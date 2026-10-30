import { CsrfService } from './csrf.service';

describe('CsrfService', () => {
  it('accepts matching cookie and header', () => {
    const service = new CsrfService();
    const token = 'a'.repeat(64);
    expect(service.matches(token, token)).toBe(true);
  });

  it('rejects missing or different values', () => {
    const service = new CsrfService();
    const token = 'a'.repeat(64);
    expect(service.matches(undefined, token)).toBe(false);
    expect(service.matches(token, 'b'.repeat(64))).toBe(false);
  });
});
