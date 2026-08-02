import { getConnection } from '../utils/db.js';

export default defineEventHandler(async (event: any) => {
    try {
        // order: Array von Strafkisten-IDs in der gewuenschten neuen Reihenfolge
        const { order } = await readBody(event);

        if (!Array.isArray(order) || order.length === 0) {
            return { success: false, error: 'order muss ein nicht-leeres Array sein' };
        }

        const connection = await getConnection();

        for (let i = 0; i < order.length; i++) {
            await connection.execute(
                `UPDATE strafkisten SET reihenfolge = ? WHERE id = ?`,
                [i, order[i]]
            );
        }

        await connection.end();
        return { success: true };
    } catch (error) {
        console.error('Database error:', error);
        return { success: false, error: error.message };
    }
});
