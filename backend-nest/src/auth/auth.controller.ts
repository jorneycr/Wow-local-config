import { Body, Controller, Get, Headers, HttpException, HttpStatus, Post, Res } from '@nestjs/common';
import type { Response } from 'express';
import { AuthService } from './auth.service';
import { CsrfService } from '../common/csrf.service';
import { LoginDto } from './dto/login.dto';

@Controller('api')
export class AuthController {
  constructor(private readonly auth: AuthService, private readonly csrfService: CsrfService) {}

  @Get('csrf')
  csrf(@Res({ passthrough: true }) response: Response) {
    const token = this.csrfService.create();
    response.cookie('csrf_token', token, { httpOnly: false, sameSite: 'strict', secure: process.env.COOKIE_SECURE === '1', maxAge: 24 * 60 * 60 * 1000 });
    return { csrf_token: token };
  }

  @Post('login')
  async login(@Body() body: LoginDto, @Headers('x-csrf-token') csrf: string, @Headers('cookie') cookie: string, @Res({ passthrough: true }) response: Response) {
    const csrfCookie = cookie?.split(';').map((part) => part.trim()).find((part) => part.startsWith('csrf_token='))?.slice(11);
    if (!this.csrfService.matches(csrfCookie, csrf)) throw new HttpException('CSRF inválido.', HttpStatus.FORBIDDEN);
    try {
      const result = await this.auth.login(body.email.toLowerCase(), body.password);
      response.cookie('access_token', result.token, { httpOnly: true, sameSite: 'strict', secure: process.env.COOKIE_SECURE === '1', maxAge: 15 * 60 * 1000 });
      return { message: 'Sesión iniciada.' };
    } catch (error) {
      throw new HttpException('Usuario o contraseña incorrectos.', HttpStatus.UNAUTHORIZED);
    }
  }
}
