import { Controller, Get, Headers, HttpException, HttpStatus, Query } from '@nestjs/common';
import { MysqlService } from '../database/mysql.service';
import { AuthService } from '../auth/auth.service';

@Controller('api')
export class CharactersController {
  constructor(private readonly db: MysqlService, private readonly auth: AuthService) {}

  private accountId(authorization: string | undefined, cookie: string | undefined): number {
    const token = authorization?.replace(/^Bearer\s+/i, '') || cookie;
    if (!token) throw new HttpException('No autenticado.', HttpStatus.UNAUTHORIZED);
    try { return Number(this.auth.verifyToken(token).sub); } catch { throw new HttpException('No autenticado.', HttpStatus.UNAUTHORIZED); }
  }

  @Get('me')
  async me(@Headers('authorization') authorization: string, @Headers('cookie') cookie: string) {
    const accountId = this.accountId(authorization, this.readCookie(cookie, 'access_token'));
    const rows = await this.db.query<any[]>(this.db.auth, 'SELECT username,email,joindate,last_login,last_ip FROM account WHERE id = ? LIMIT 1', [accountId]);
    const account = rows[0];
    if (!account) throw new HttpException('No autenticado.', HttpStatus.UNAUTHORIZED);
    return { id: accountId, ...account };
  }

  @Get('characters')
  async characters(@Headers('authorization') authorization: string, @Headers('cookie') cookie: string) {
    const accountId = this.accountId(authorization, this.readCookie(cookie, 'access_token'));
    const rows = await this.db.query<any[]>(this.db.characters, 'SELECT guid,name,level,race,class,online FROM characters WHERE account = ? ORDER BY name', [accountId]);
    return { characters: rows.map((row) => ({ ...row, online: Boolean(row.online) })) };
  }

  @Get('character')
  async character(@Query('guid') guid: string, @Headers('authorization') authorization: string, @Headers('cookie') cookie: string) {
    const accountId = this.accountId(authorization, this.readCookie(cookie, 'access_token'));
    const rows = await this.db.query<any[]>(this.db.characters, 'SELECT guid,name,level,race,class,gender,xp,money,map,zone,online,totaltime,totalHonorPoints,arenaPoints,totalKills,health,power1,power2,power3,power4,power5,power6,power7,creation_date FROM characters WHERE guid = ? AND account = ? LIMIT 1', [Number(guid), accountId]);
    if (!rows[0]) throw new HttpException('Personaje no encontrado.', HttpStatus.NOT_FOUND);
    return { character: { ...rows[0], online: Boolean(rows[0].online) } };
  }

  private readCookie(header: string | undefined, name: string): string | undefined {
    return header?.split(';').map((part) => part.trim()).find((part) => part.startsWith(`${name}=`))?.slice(name.length + 1);
  }
}
