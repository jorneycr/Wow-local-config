import { plainToInstance } from 'class-transformer';
import { validate } from 'class-validator';
import { LoginDto } from './login.dto';

it('rejects mass-assigned login fields', async () => {
  const dto = plainToInstance(LoginDto, { email: 'a@example.com', password: 'Password123', role: 'admin' });
  const errors = await validate(dto, { whitelist: true, forbidNonWhitelisted: true });
  expect(errors.some((error) => error.property === 'role')).toBe(true);
});
