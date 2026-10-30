import { Module } from '@nestjs/common';
import { Srp6Module } from '../srp6/srp6.module';
import { AuthController } from './auth.controller';
import { AuthService } from './auth.service';

@Module({ imports: [Srp6Module], controllers: [AuthController], providers: [AuthService], exports: [AuthService] })
export class AuthModule {}
