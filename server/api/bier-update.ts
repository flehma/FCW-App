import { getConnection } from '../utils/db.js';

export default defineEventHandler(async (event: any) => {
    try {
        const { id, strafe, einmal } = await readBody(event);

        if (!id) {
            return { success: false, error: 'id fehlt' };
        }

        const connection = await getConnection();

        await connection.execute(
            `UPDATE strafkisten SET strafe = ?, einmal = ? WHERE id = ?`,
            [strafe, einmal, id]
        );

        await connection.end();

        return { success: true };
    } catch (error) {
        console.error('Database error:', error);
        return { success: false, error: error.message };
    }
});
