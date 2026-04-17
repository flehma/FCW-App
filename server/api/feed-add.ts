import { getConnection } from '../utils/db';

export default defineEventHandler(async (event) => {
  const { typ, spieler_name, beschreibung } = await readBody(event);
  const conn = await getConnection();
  try {
    await conn.execute(
      'INSERT INTO activity_log (typ, spieler_name, beschreibung) VALUES (?, ?, ?)',
      [typ, spieler_name, beschreibung]
    );
    return { ok: true };
  } finally {
    await conn.end();
  }
});