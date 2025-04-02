import mysql from 'mysql2/promise';

export async function getConnection() {
    return await mysql.createConnection({
        host: process.env.DATABASE_HOST || 'mariadb',
        port: process.env.DATABASE_PORT || 3306,
        database: process.env.DATABASE_NAME || 'database',
        user: process.env.DATABASE_USER || 'root',
        password: process.env.DATABASE_PASSWORD || 'root'
    });
}