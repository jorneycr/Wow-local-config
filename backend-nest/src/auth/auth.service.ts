import { Injectable } from '@nestjs/common';
import { createHash, randomBytes } from 'node:crypto';
import jwt from 'jsonwebtoken';
import { MysqlService } from '../database/mysql.service';
import { Srp6Service } from '../srp6/srp6.service';

@Injectable()
export class AuthService {
  constructor(private readonly db: MysqlService, private readonly srp6: Srp6Service) {}

  csrfToken(): string {
    return randomBytes(32).toString('hex');
  }

  async login(email: string, password: string): Promise<{ token: string; accountId: number; username: string }> {
    const rows = await this.db.query<any[]>(this.db.auth, 'SELECT id, username, salt, verifier, locked FROM account WHERE LOWER(email) = ? LIMIT 1', [email]);
    const account = rows[0];
    if (!account || account.locked || !this.srp6.passwordMatches(account.username, password, account.salt, account.verifier)) {
      throw new Error('INVALID_CREDENTIALS');
    }
    return { token: this.issueToken(account.id, account.username), accountId: account.id, username: account.username };
  }

  issueToken(accountId: number, username: string): string {
    return jwt.sign({ sub: String(accountId), username, iss: this.issuer(), aud: this.audience() }, this.secret(), { expiresIn: '15m' });
  }

  verifyToken(token: string): { sub: string; username: string } {
    return jwt.verify(token, this.secret(), { issuer: this.issuer(), audience: this.audience() }) as { sub: string; username: string };
  }

  private secret(): string { return process.env.JWT_SECRET ?? 'change-this-jwt-secret-at-least-32-bytes'; }
  private issuer(): string { return process.env.JWT_ISSUER ?? 'azerothcore-nest'; }
  private audience(): string { return process.env.JWT_AUDIENCE ?? 'azerothcore-client'; }
}
