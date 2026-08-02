import { getConnection } from '../utils/db.js';

export default defineEventHandler(async (event: any) => {
  try {
    // Body auslesen
    const { strafe, einmal } = await readBody(event);

    console.log("Neue Strafenkiste:", { strafe, einmal });

    const connection = await getConnection();

    // Neuen Grund ans Ende der Reihenfolge anhängen
    const [maxRows] = await connection.execute(
      `SELECT COALESCE(MAX(reihenfolge), 0) AS maxReihenfolge FROM strafkisten`
    ) as any;
    const naechsteReihenfolge = maxRows[0].maxReihenfolge + 1;

    // Insert mit Platzhaltern
    const [result] = await connection.execute(
      `INSERT INTO strafkisten (strafe, einmal, reihenfolge) VALUES (?, ?, ?)`,
      [strafe, einmal, naechsteReihenfolge] // einmal muss 'TRUE' oder 'FALSE' sein
    );

    await connection.end();

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
