import { getConnection } from '../utils/db.js';

export default defineEventHandler(async (event: any) => {
  try {
    // Body auslesen
    const { strafe, pro_x_text, wert_geld, wert_kiste } = await readBody(event);

    console.log("Neue Strafe:", { strafe, pro_x_text, wert_geld, wert_kiste });

    // DB-Verbindung aufbauen
    const connection = await getConnection();

    // Neue Strafe ans Ende der Reihenfolge anhängen
    const [maxRows] = await connection.execute(
      `SELECT COALESCE(MAX(reihenfolge), 0) AS maxReihenfolge FROM strafen`
    ) as any;
    const naechsteReihenfolge = maxRows[0].maxReihenfolge + 1;

    // Insert mit Platzhaltern, um SQL-Injection zu vermeiden
    const [result] = await connection.execute(
      `INSERT INTO strafen (strafe, pro_x_text, wert_geld, wert_kiste, reihenfolge) VALUES (?, ?, ?, ?, ?)`,
      [strafe, pro_x_text, wert_geld, wert_kiste, naechsteReihenfolge]
    );

    await connection.end();

    // Erfolgreiche Rückgabe mit insertId
    return {
      success: true,
      insertId: result.insertId
    };
  } catch (error) {
    console.error('Database error:', error);
    return {
      success: false,
      error: error.message
    };
  }
});
