import { getConnection } from '../utils/db.js';

export default defineEventHandler(async () => {
    try {
        
        const connection = await getConnection();
        const [rows] = await connection.execute('SELECT kader.*, tunnel.tunnel FROM kader INNER JOIN tunnel ON kader.id = tunnel.spielerId ORDER by kader.name');
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
