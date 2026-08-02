import { getConnection } from '../utils/db.js';

export default defineEventHandler(async (event) => {
    try {
        const requestBody = await readBody(event);
        const connection = await getConnection();
        await connection.execute('DELETE FROM strafkisten WHERE id = ?', [requestBody.id]);
        await connection.end();
        return {
            success: true
        };
    } catch (error) {
        console.error('Database error:', error);
        return {
            error: error.message
        };
    }
});
