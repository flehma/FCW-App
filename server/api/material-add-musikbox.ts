import { getConnection } from '../utils/db.js';

export default defineEventHandler(async (event: any) => {
    try {
        const requestBody = await readBody(event)
        console.log(requestBody)
        
        const connection = await getConnection();

        let update = '1';
        if (requestBody.spieler.musikbox > 0) update = 'musikbox + 1'

        const [rows] = await connection.execute(`UPDATE material SET musikbox = ${update} where spielerId = ${requestBody.spieler};`);
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
