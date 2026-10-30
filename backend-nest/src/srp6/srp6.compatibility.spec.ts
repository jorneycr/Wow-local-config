import { Srp6Service } from './srp6.service';

describe('AzerothCore SRP6 compatibility contract', () => {
  it('uses the 32-byte little-endian verifier format', () => {
    const service = new Srp6Service();
    const data = service.registrationData('COMPATIBILITY', 'Compatibility123');
    expect(data.salt).toHaveLength(32);
    expect(data.verifier).toHaveLength(32);
    expect(service.passwordMatches('COMPATIBILITY', 'Compatibility123', data.salt, data.verifier)).toBe(true);
  });
});
