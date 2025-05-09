import { getConnection } from '../utils/db.js';

export default defineEventHandler(async (event: any) => {
    try {
        const requestBody = await readBody(event)
        console.log(requestBody)
        
        const connection = await getConnection();
        if(requestBody.strafe.einmal == 'TRUE') {
            const [checkUp] = await connection.execute(`SELECT * FROM strafkisten_log WHERE spielerId = ${requestBody.spieler.id} AND strafkistenId = ${requestBody.strafe.id}`);
            if(checkUp.length > 0) return "Strafe darf nur einmal pro Spieler verteilt werden";
        }
        
        await connection.execute(`INSERT INTO strafkisten_log (spielerId, strafkistenId) VALUES (${requestBody.spieler.id}, ${requestBody.strafe.id})`)
        
        const [rows] = await connection.execute(`UPDATE spieler_strafen SET kiste = kiste + 1 where spielerId = ${requestBody.spieler.id};`);
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
