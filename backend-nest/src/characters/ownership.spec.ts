import { CharactersController } from './characters.controller';

describe('CharactersController ownership', () => {
  it('uses the authenticated account id in the character query', async () => {
    const query = jest.fn().mockResolvedValue([{ guid: 8, name: 'Owned', online: 0 }]);
    const db = { characters: {}, query } as any;
    const auth = { verifyToken: jest.fn().mockReturnValue({ sub: '12', username: 'PLAYER' }) } as any;
    const controller = new CharactersController(db, auth);
    await controller.characters('Bearer token', undefined as any);
    expect(query).toHaveBeenCalledWith(db.characters, expect.stringContaining('WHERE account = ?'), [12]);
  });
});
