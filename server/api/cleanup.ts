import { getConnection } from '../utils/db.js';

export default defineEventHandler(async () => {
    try {
        const connection = await getConnection();
        const [rows] = await connection.execute(`DELETE FROM kader where id IN (100, 101);`);
        const [rows1] = await connection.execute(`DELETE FROM strafen where id IN (17);`);
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