import { getConnection } from '../utils/db.js';
import spieltagAddSpieler from './spieltag-add-spieler.js';

export default defineEventHandler(async () => {
    try {
        
        const connection = await getConnection();
        
        const[training] = await connection.execute(`SELECT * FROM training;`)
        if(training.length <= 0) return {response: "error"};
        const[spieltag] = await connection.execute(`SELECT * FROM spieltag;`)
        if(spieltag.length <= 0) return {response: "error"};

        const [dienstag] = await connection.execute(`SELECT k.id, k.name, s.kiste FROM spieler_strafen s JOIN kader k ON k.id = s.spielerId WHERE s.spielerId IN (SELECT spielerId FROM training) ORDER BY s.kiste DESC, k.name;`);
        const [donnerstag] = await connection.execute(`SELECT k.id, k.name, s.kiste FROM spieler_strafen s JOIN kader k ON k.id = s.spielerId WHERE s.spielerId IN (SELECT spielerId FROM training) AND k.id NOT IN (${dienstag[0].id}) ORDER BY s.kiste DESC, k.name;`);
        const [spiel] = await connection.execute(`SELECT k.id, k.name, s.kiste FROM spieler_strafen s JOIN kader k ON k.id = s.spielerId WHERE s.spielerId IN (SELECT spielerId FROM spieltag) AND k.id NOT IN (${dienstag[0].id}, ${donnerstag[0].id}) ORDER BY s.kiste DESC, k.name;`);
        await connection.end();
        return {
            dienstag: dienstag,
            donnerstag: donnerstag,
            spiel: spiel
        };
    } catch (error) {
        console.error('Database error:', error);
        return {
            error: error.message,
            msg: "Es müssen zuerst Spieler zum Training und Spieltag hinzugefügt werden."
        };
    }
});