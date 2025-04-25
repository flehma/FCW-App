import { getConnection } from '../utils/db.js';

export default defineEventHandler(async () => {
    try {
        const connection = await getConnection();
        const [rows] = await connection.execute('SELECT k.*, m.flaschen, m.musikbox, m.`bälle`, m.jacken, s.spielerId AS `spieltag`, t.spielerId AS `training`, st.geld, st.kiste FROM kader k LEFT JOIN material m ON k.id = m.spielerId LEFT JOIN spieltag s ON s.spielerId = k.id LEFT JOIN training t ON t.spielerId = k.id LEFT JOIN spieler_strafen st ON st.spielerId = k.id ORDER BY k.id');
        await connection.end();
        return {
            kader: rows
        };
    } catch (error) {
        console.error('Database error:', error);
        return {
            error: error.message
        };
    }
});