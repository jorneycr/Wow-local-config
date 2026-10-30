import { IsString, MaxLength, MinLength } from 'class-validator';

export class PasswordDto {
  @IsString()
  @MinLength(8)
  @MaxLength(32)
  current_password!: string;

  @IsString()
  @MinLength(8)
  @MaxLength(32)
  new_password!: string;

  @IsString()
  @MinLength(8)
  @MaxLength(32)
  new_password_confirmation!: string;
}
