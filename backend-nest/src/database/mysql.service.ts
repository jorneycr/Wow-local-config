import { Injectable, OnModuleDestroy } from '@nestjs/common';
import * as mysql from 'mysql2/promise';
import { Pool, RowDataPacket } from 'mysql2/promise';

@Injectable()
export class MysqlService implements OnModuleDestroy {
  readonly auth: Pool = mysql.createPool({
    host: process.env.DB_HOST ?? 'ac-database',
    port: Number(process.env.DB_PORT ?? 3306),
    user: process.env.DB_USER ?? 'website',
    password: process.env.DB_PASSWORD ?? 'change_this_website_password',
    database: 'acore_auth',
    connectionLimit: 5,
    namedPlaceholders: false,
  });

  readonly characters: Pool = mysql.createPool({
    host: process.env.DB_HOST ?? 'ac-database',
    port: Number(process.env.DB_PORT ?? 3306),
    user: process.env.DB_USER ?? 'website',
    password: process.env.DB_PASSWORD ?? 'change_this_website_password',
    database: 'acore_characters',
    connectionLimit: 5,
    namedPlaceholders: false,
  });

  async onModuleDestroy(): Promise<void> {
    await Promise.all([this.auth.end(), this.characters.end()]);
  }

  async query<T extends RowDataPacket[]>(pool: Pool, sql: string, values: any[] = []): Promise<T> {
    const [rows] = await pool.execute<T>(sql, values);
    return rows;
  }
}
