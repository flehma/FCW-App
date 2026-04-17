import { getConnection } from '../utils/db';

export default defineEventHandler(async () => {
  const conn = await getConnection();
  try {
    const [spieler] = await conn.execute('SELECT id FROM kader') as any;
    for (const s of spieler) {
      await conn.execute(`
        INSERT IGNORE INTO kasse (spieler_id, halbjahr) VALUES (?, 'sommer'), (?, 'winter')
      `, [s.id, s.id]);
    }
    return { ok: true };
  } finally {
    await conn.end();
  }
});