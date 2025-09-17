import { getConnection } from '../utils/db.js';

export default defineEventHandler(async (event: any) => {
    try {
        const requestBody = await readBody(event)
        console.log(requestBody)
        console.log("INSERT INTO strafkisten (strafe, einmal) VALUES ('" + requestBody.grund + "', '" + requestBody.once + "');")
        const connection = await getConnection();
        const [rows] = await connection.execute(
            `INSERT INTO strafkisten (strafe, einmal) VALUES ('${requestBody.grund}', '${requestBody.once}')`
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