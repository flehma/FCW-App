import { getConnection } from '../utils/db';

export default defineEventHandler(async (event) => {
  const { spieler_id, halbjahr } = await readBody(event);
  const conn = await getConnection();
  try {
    await conn.execute(`
      UPDATE kasse SET bezahlt = NOT bezahlt
      WHERE spieler_id = ? AND halbjahr = ?
    `, [spieler_id, halbjahr]);
    return { ok: true };
  } finally {
    await conn.end();
  }
});