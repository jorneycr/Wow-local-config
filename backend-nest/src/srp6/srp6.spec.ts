import { Srp6Service } from './srp6.service';

describe('Srp6Service', () => {
  const service = new Srp6Service();

  it('generates 32-byte registration data', () => {
    const data = service.registrationData('DANIEL', 'DanielLocal123');
    expect(data.salt).toHaveLength(32);
    expect(data.verifier).toHaveLength(32);
  });

  it('matches the generated password', () => {
    const data = service.registrationData('DANIEL', 'DanielLocal123');
    expect(service.passwordMatches('DANIEL', 'DanielLocal123', data.salt, data.verifier)).toBe(true);
  });

  it('rejects a wrong password', () => {
    const data = service.registrationData('DANIEL', 'DanielLocal123');
    expect(service.passwordMatches('DANIEL', 'WrongPassword123', data.salt, data.verifier)).toBe(false);
  });

  it('normalizes ASCII case like AzerothCore', () => {
    const data = service.registrationData('Daniel', 'DanielLocal123');
    expect(service.passwordMatches('DANIEL', 'DANIELLOCAL123', data.salt, data.verifier)).toBe(true);
  });
});
