import { getConnection } from '../utils/db.js';

export default defineEventHandler(async () => {
    try {
        const connection = await getConnection();
        await connection.execute(`DELETE FROM strafen where id IN (16);`);
        await connection.end();
        return {
            kader: "success"
        };
    } catch (error) {
        console.error('Database error:', error);
        return {
            error: error.message
        };
    }
});