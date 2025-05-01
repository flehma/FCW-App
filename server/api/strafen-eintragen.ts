import { getConnection } from '../utils/db.js';

export default defineEventHandler(async (event: any) => {
    try {
        const requestBody = await readBody(event)
        console.log(requestBody)
        
        const connection = await getConnection();

        let update = 'geld = ';
        if (requestBody.spieler.geld > 0) {
            update = update + 'geld + ' + requestBody.geld;
        } else {
            update = update + requestBody.geld
        }

        if(requestBody.kiste > 0 && requestBody.spieler.kiste > 0) {
            update = update + ', kiste = kiste + ' + requestBody.kiste
        } else if (requestBody.kiste > 0 && requestBody.spieler.kiste == null) {
            update = update + ', kiste = ' + requestBody.kiste
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
