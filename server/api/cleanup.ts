import { getConnection } from '../utils/db.js';

export default defineEventHandler(async () => {
    try {
        const connection = await getConnection();
        const [rows] = await connection.execute(`UPDATE tunnel SET tunnel = 0 WHERE spielerId = 5;`);
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