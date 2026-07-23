import { getConnection } from '../utils/db';

export default defineEventHandler(async () => {
  const conn = await getConnection();
  try {
    const [rows] = await conn.execute('SELECT `key`, `value` FROM einstellungen') as any;
    const result: Record<string, string> = {};
    for (const row of rows) {
      result[row.key] = row.value;
    }
    return result;
  } finally {
    await conn.end();
  }
});
