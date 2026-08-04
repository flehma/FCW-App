import { getConnection } from '../utils/db.js';

// Befüllt den Spieltag-Kader mit allen Spielern aus dem Kader, die noch
// nicht eingetragen sind. Gegenstück zu spieltag-clear.ts, gedacht für
// Teams im "opt_out"-Modus (siehe useKaderModus.ts), bei denen Spieler
// standardmäßig dabei sind und einzeln entfernt werden.
export default defineEventHandler(async () => {
    try {
        const connection = await getConnection();
        const [rows] = await connection.execute(
            `INSERT INTO spieltag (spielerId) SELECT id FROM kader WHERE id NOT IN (SELECT spielerId FROM spieltag);`
        );
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
