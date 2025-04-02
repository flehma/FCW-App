import { getConnection } from '../utils/db.js';

export default defineEventHandler(async () => {
    try {
        const connection = await getConnection();
        const [rows] = await connection.execute('SELECT k.name FROM training t INNER JOIN kader k ON t.spielerId = k.id');
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