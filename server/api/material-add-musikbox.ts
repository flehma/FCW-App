import { getConnection } from '../utils/db.js';

export default defineEventHandler(async (event: any) => {
    try {
        const requestBody = await readBody(event)
        const connection = await getConnection();

        let update = '1';
        if (requestBody.spieler.musikbox > 0) update = 'musikbox + 1'

        const [rows] = await connection.execute(`UPDATE material SET musikbox = ${update} where spielerId = ${requestBody.spieler};`);

        const [spieler] = await connection.execute(`SELECT name FROM kader WHERE id = ${requestBody.spieler}`) as any;
        const name = spieler[0]?.name ?? 'Unbekannt';
        await connection.execute(
            'INSERT INTO activity_log (typ, spieler_name, beschreibung) VALUES (?, ?, ?)',
            ['material', name, 'hat die Musikbox mitgenommen']
        );

        await connection.end();
        return { kader: rows };
    } catch (error) {
        console.error('Database error:', error);
        return { error: error.message };
    }
});