import { getConnection } from '../utils/db.js';

export default defineEventHandler(async () => {
    try {
        const connection = await getConnection();
        const [rows] = await connection.execute('SELECT k.*, s.spielerId AS `spieltag`, t.spielerId AS `training`, st.geld, st.kiste, tu.tunnel FROM kader k LEFT JOIN spieltag s ON s.spielerId = k.id LEFT JOIN training t ON t.spielerId = k.id LEFT JOIN spieler_strafen st ON st.spielerId = k.id LEFT JOIN tunnel tu ON tu.spielerId = k.id ORDER BY k.id');
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