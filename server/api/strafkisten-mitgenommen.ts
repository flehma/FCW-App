import { getConnection } from '../utils/db.js';

export default defineEventHandler(async (event) => {
    try {
        const requestBody = await readBody(event)
        console.log(requestBody)
        
        const connection = await getConnection();
        const [rows] = await connection.execute(`UPDATE spieler_strafen SET kiste = kiste - 1 WHERE spielerId = ${requestBody.spieler.id};`);
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