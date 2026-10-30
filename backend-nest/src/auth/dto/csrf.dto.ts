import { IsString, Length } from 'class-validator';

export class CsrfHeaderDto {
  @IsString()
  @Length(64, 64)
  token!: string;
}
