import { getConnection } from '../utils/db';

export default defineEventHandler(async () => {
  const conn = await getConnection();
  try {
    const [rows] = await conn.execute(`
      SELECT * FROM activity_log ORDER BY erstellt_am DESC
    `);
    return rows;
  } finally {
    await conn.end();
  }
});