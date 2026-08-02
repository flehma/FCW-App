import { getConnection } from '../utils/db.js';

export default defineEventHandler(async (event) => {
    try {
        const query = getQuery(event);
        const connection = await getConnection();
        const [rows] = await connection.execute('SELECT * FROM strafkisten WHERE id = ?', [query.id]);
        await connection.end();
        return {
            strafe: (rows as any[])[0] ?? null
        };
    } catch (error) {
        console.error('Database error:', error);
        return {
            error: error.message
        };
    }
});
