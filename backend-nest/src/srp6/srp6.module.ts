import { Module } from '@nestjs/common';
import { Srp6Service } from './srp6.service';

@Module({
  providers: [Srp6Service],
  exports: [Srp6Service],
})
export class Srp6Module {}
