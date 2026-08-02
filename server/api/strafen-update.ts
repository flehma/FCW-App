import { getConnection } from '../utils/db.js';

export default defineEventHandler(async (event: any) => {
    try {
        const { id, strafe, pro_x_text, wert_geld, wert_kiste } = await readBody(event);

        if (!id) {
            return { success: false, error: 'id fehlt' };
        }

        const connection = await getConnection();

        await connection.execute(
            `UPDATE strafen SET strafe = ?, pro_x_text = ?, wert_geld = ?, wert_kiste = ? WHERE id = ?`,
            [strafe, pro_x_text, wert_geld, wert_kiste, id]
        );

        await connection.end();

        return { success: true };
    } catch (error) {
        console.error('Database error:', error);
        return { success: false, error: error.message };
    }
});
