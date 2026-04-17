import { getConnection } from '../utils/db';

export default defineEventHandler(async () => {
  const conn = await getConnection();
  try {
    const [rows] = await conn.execute(`
      SELECT k.spieler_id, k.halbjahr, k.bezahlt, s.name
      FROM kasse k
      JOIN kader s ON k.spieler_id = s.id
      ORDER BY s.name
    `);
    return rows;
  } finally {
    await conn.end();
  }
});