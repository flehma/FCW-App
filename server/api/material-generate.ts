import { getConnection } from '../utils/db.js';

export default defineEventHandler(async () => {
    try {
        
        const connection = await getConnection();

        const[training] = await connection.execute(`SELECT * FROM training;`)
        if(training.length <= 0) return {response: "error"};
        const[spieltag] = await connection.execute(`SELECT * FROM spieltag;`)
        if(spieltag.length <= 0) return {response: "error"};

        const [flaschen] = await connection.execute(`SELECT k.id, k.name, m.flaschen FROM material m JOIN kader k ON k.id = m.spielerId WHERE m.spielerId IN (SELECT spielerId FROM training) AND m.spielerId IN (SELECT spielerId FROM spieltag) AND k.id NOT IN (6) ORDER BY m.flaschen, k.name;`);
        const [musikbox] = await connection.execute(`SELECT k.id, k.name, m.musikbox FROM material m JOIN kader k ON k.id = m.spielerId WHERE m.spielerId IN (SELECT spielerId FROM training) AND m.spielerId IN (SELECT spielerId FROM spieltag) AND k.id NOT IN (${flaschen[0].id}, 6) ORDER BY m.musikbox, k.name;`);
        const [bälle] = await connection.execute(`SELECT k.id, k.name, m.bälle FROM material m JOIN kader k ON k.id = m.spielerId WHERE m.spielerId IN (SELECT spielerId FROM training) AND m.spielerId IN (SELECT spielerId FROM spieltag) AND k.id NOT IN (${flaschen[0].id}, ${musikbox[0].id}, 3, 6, 31) ORDER BY m.bälle, k.name;`);
        const [jacken] = await connection.execute(`SELECT k.id, k.name, m.jacken FROM material m JOIN kader k ON k.id = m.spielerId WHERE m.spielerId IN (SELECT spielerId FROM training) AND m.spielerId IN (SELECT spielerId FROM spieltag)  AND k.id NOT IN (${flaschen[0].id}, ${musikbox[0].id}, ${bälle[0].id}, 6) ORDER BY m.jacken, k.name;`);
        await connection.end();
        return {
            flaschen: flaschen,
            musikbox: musikbox,
            bälle: bälle,
            jacken: jacken
        };
    } catch (error) {
        console.error('Database error:', error);
        return {
            error: error.message
        };
    }
});