import { MysqlService } from './mysql.service';

describe('MysqlService query safety', () => {
  it('passes values separately instead of interpolating SQL', async () => {
    const execute = jest.fn().mockResolvedValue([[]]);
    const pool = { execute } as any;
    const service = Object.create(MysqlService.prototype) as MysqlService;
    await service.query(pool, 'SELECT id FROM account WHERE email = ?', ['user@example.com']);
    expect(execute).toHaveBeenCalledWith('SELECT id FROM account WHERE email = ?', ['user@example.com']);
    expect(execute.mock.calls[0][0]).not.toContain('user@example.com');
  });
});
