import { Module } from '@nestjs/common';
import { AuthModule } from '../auth/auth.module';
import { CharactersController } from './characters.controller';

@Module({ imports: [AuthModule], controllers: [CharactersController] })
export class CharactersModule {}
