import { getConnection } from '../utils/db.js';

export default defineEventHandler(async (event: any) => {
    try {
        const requestBody = await readBody(event)
        const connection = await getConnection();

        let update = 'geld = geld + ' + requestBody.geld; 
        if (requestBody.kiste > 0) {
            update = update + ', kiste = kiste + ' + requestBody.kiste
        }
        
        const [rows] = await connection.execute(`UPDATE spieler_strafen SET ${update} where spielerId = ${requestBody.spieler.id};`);

        // Feed-Log
        const [spieler] = await connection.execute(`SELECT name FROM kader WHERE id = ${requestBody.spieler.id}`) as any;
        const name = spieler[0]?.name ?? 'Unbekannt';
        const teile = [];
        if (requestBody.geld > 0) teile.push(`${requestBody.geld}€`);
        if (requestBody.kiste > 0) teile.push(`${requestBody.kiste} Kiste(n) Bier`);
        await connection.execute(
            'INSERT INTO activity_log (typ, spieler_name, beschreibung) VALUES (?, ?, ?)',
            ['strafe', name, `hat eine Strafe erhalten: ${requestBody.strafeName} (${teile.join(' + ')})`]
        );

        await connection.end();
        return { kader: rows };
    } catch (error) {
        console.error('Database error:', error);
        return { error: error.message };
    }
});