import { getConnection } from '../utils/db.js';

export default defineEventHandler(async (event: any) => {
  try {
    // Body auslesen
    const { strafe, einmal } = await readBody(event);

    console.log("Neue Strafenkiste:", { strafe, einmal });

    const connection = await getConnection();

    // Insert mit Platzhaltern
    const [result] = await connection.execute(
      `INSERT INTO strafkisten (strafe, einmal) VALUES (?, ?)`,
      [strafe, einmal] // einmal muss 'TRUE' oder 'FALSE' sein
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
