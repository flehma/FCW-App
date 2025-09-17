import { getConnection } from '../utils/db.js';

export default defineEventHandler(async (event: any) => {
    try {
        const requestBody = await readBody(event)
        
        const connection = await getConnection();
        const [rows] = await connection.execute(`INSERT INTO kader (name) VALUES ("${requestBody.name}");`);
        await connection.execute(`INSERT INTO tunnel (spielerId, tunnel) VALUES ("${rows.insertId}", 0);`)
        await connection.execute(`INSERT INTO material (spielerId, flaschen, musikbox, bälle, jacken) VALUES ("${rows.insertId}",NULL,NULL,NULL,NULL);`)
        await connection.execute(`INSERT INTO spieler_strafen (spielerId, geld, kiste) VALUES ("${rows.insertId}",0,0);`)
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