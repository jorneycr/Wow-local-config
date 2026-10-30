import { Injectable } from '@nestjs/common';
import { randomBytes, timingSafeEqual } from 'node:crypto';

@Injectable()
export class CsrfService {
  create(): string {
    return randomBytes(32).toString('hex');
  }

  matches(cookie: string | undefined, header: string | undefined): boolean {
    if (!cookie || !header || cookie.length !== header.length) return false;
    return timingSafeEqual(Buffer.from(cookie), Buffer.from(header));
  }
}
