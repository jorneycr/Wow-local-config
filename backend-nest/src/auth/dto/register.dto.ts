import { IsEmail, IsString, Matches, MaxLength, MinLength } from 'class-validator';

export class RegisterDto {
  @IsEmail()
  @MaxLength(255)
  email!: string;

  @IsString()
  @Matches(/^[A-Za-z0-9]{3,16}$/)
  username!: string;

  @IsString()
  @MinLength(8)
  @MaxLength(32)
  password!: string;

  @IsString()
  @MinLength(8)
  @MaxLength(32)
  password_confirmation!: string;
}
