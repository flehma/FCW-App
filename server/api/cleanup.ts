import { getConnection } from '../utils/db.js';

export default defineEventHandler(async () => {
    try {
        const connection = await getConnection();
        await connection.execute(`DELETE FROM tunnel where id IN (100, 101);`);
        await connection.execute(`DELETE FROM strafkisten_log where id IN (100, 101);`);
        await connection.execute(`DELETE FROM spieler_strafen where id IN (100, 101);`);
        await connection.execute(`DELETE FROM material where id IN (100, 101);`);
        await connection.execute(`DELETE FROM kader where id IN (100, 101);`);
        await connection.execute(`DELETE FROM strafen where id IN (17);`);
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