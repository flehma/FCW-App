import { getConnection } from '../utils/db.js';

export default defineEventHandler(async () => {
    try {
        const connection = await getConnection();
        const [rows] = await connection.execute('SELECT k.name FROM spieltag s INNER JOIN kader k ON s.spielerId = k.id ORDER BY k.name');
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