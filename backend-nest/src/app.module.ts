import { Module } from '@nestjs/common';
import { DatabaseModule } from './database/database.module';
import { AuthModule } from './auth/auth.module';
import { CharactersModule } from './characters/characters.module';
import { SecurityModule } from './common/security.module';
import { Srp6Module } from './srp6/srp6.module';

@Module({
  imports: [DatabaseModule, SecurityModule, Srp6Module, AuthModule, CharactersModule],
})
export class AppModule {}
