import { getConnection } from '../utils/db.js';

export default defineEventHandler(async (event: any) => {
    try {
        const requestBody = await readBody(event)
        console.log(requestBody.id)
        
        const connection = await getConnection();
        const [rows] = await connection.execute(`INSERT INTO kader (name, flaschen, musikbox, bälle, jacken) VALUES ("${requestBody.name}", 0, 0, 0, 0);`);
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