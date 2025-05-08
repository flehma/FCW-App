import { getConnection } from '../utils/db.js';
import spieltagAddSpieler from './spieltag-add-spieler.js';

export default defineEventHandler(async () => {
    try {
        
        const connection = await getConnection();
        const [dienstag] = await connection.execute(`SELECT k.id, k.name, s.kiste FROM spieler_strafen s JOIN kader k ON k.id = s.spielerId WHERE s.spielerId IN (SELECT spielerId FROM training) ORDER BY s.kiste DESC, k.name;`);
        const [donnerstag] = await connection.execute(`SELECT k.id, k.name, s.kiste FROM spieler_strafen s JOIN kader k ON k.id = s.spielerId WHERE s.spielerId IN (SELECT spielerId FROM training) AND k.id NOT IN (${dienstag[0].id}) ORDER BY s.kiste DESC, k.name;`);
        const [spieltag] = await connection.execute(`SELECT k.id, k.name, s.kiste FROM spieler_strafen s JOIN kader k ON k.id = s.spielerId WHERE s.spielerId IN (SELECT spielerId FROM spieltag) AND k.id NOT IN (${dienstag[0].id}, ${donnerstag[0].id}) ORDER BY s.kiste DESC, k.name;`);
        await connection.end();
        console.log
        return {
            dienstag: dienstag,
            donnerstag: donnerstag,
            spieltag: spieltag
        };
    } catch (error) {
        console.error('Database error:', error);
        return {
            error: error.message
        };
    }
});