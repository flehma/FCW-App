import { getConnection } from '../utils/db.js';

export default defineEventHandler(async (event: any) => {
    try {
        const requestBody = await readBody(event)
        console.log(requestBody)
        
        const connection = await getConnection();

        let update = 'geld = geld + ' + requestBody.geld; 
        if (requestBody.kiste > 0) {
            update = update + ', kiste = kiste + ' + requestBody.kiste
        }
        
        const [rows] = await connection.execute(`UPDATE spieler_strafen SET ${update} where spielerId = ${requestBody.spieler.id};`);
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
