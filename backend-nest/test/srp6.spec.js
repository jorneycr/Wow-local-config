const { Srp6Service } = require('../dist/srp6/srp6.service');

describe('Srp6Service', () => {
  const service = new Srp6Service();
  it('generates compatible registration data', () => {
    const data = service.registrationData('DANIEL', 'DanielLocal123');
    expect(data.salt).toHaveLength(32);
    expect(data.verifier).toHaveLength(32);
    expect(service.passwordMatches('DANIEL', 'DanielLocal123', data.salt, data.verifier)).toBe(true);
  });
  it('rejects incorrect passwords', () => {
    const data = service.registrationData('DANIEL', 'DanielLocal123');
    expect(service.passwordMatches('DANIEL', 'WrongPassword123', data.salt, data.verifier)).toBe(false);
  });
});
