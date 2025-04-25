import { getConnection } from '../utils/db.js';

export default defineEventHandler(async () => {
    try {
        const connection = await getConnection();
        const [rows] = await connection.execute('SELECT * FROM strafen');
        return {
            strafen: rows
        };
    } catch (error) {
        console.error('Database error:', error);
        return {
            error: error.message
        };
    }
});