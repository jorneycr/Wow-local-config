const assert = require('node:assert/strict');
const crypto = require('node:crypto');

const N = BigInt('0x894B645E89E1535BBDAD5B8B290650530801B18EBFBF5E8FAB3C82872A3E9BB7');
const G = 7n;

function sha1(value) { return crypto.createHash('sha1').update(value).digest(); }
function upperBasicLatin(value) { return value.replace(/[a-z]/g, (char) => char.toUpperCase()); }
function modPow(base, exponent, modulus) { let result = 1n; let current = base % modulus; for (let left = exponent; left > 0n; left >>= 1n) { if (left & 1n) result = result * current % modulus; current = current * current % modulus; } return result; }
function verifier(username, password, salt) { const identity = sha1(`${upperBasicLatin(username)}:${upperBasicLatin(password)}`); const exponent = BigInt(`0x${Buffer.from(sha1(Buffer.concat([salt, identity]))).reverse().toString('hex')}`); const hex = modPow(G, exponent, N).toString(16).padStart(64, '0'); return Buffer.from(hex.match(/../g).reverse().join(''), 'hex'); }

const salt = crypto.randomBytes(32);
const stored = verifier('DANIEL', 'DanielLocal123', salt);
assert.equal(salt.length, 32);
assert.equal(stored.length, 32);
assert.deepEqual(verifier('DANIEL', 'DanielLocal123', salt), stored);
assert.notDeepEqual(verifier('DANIEL', 'WrongPassword123', salt), stored);
console.log('SRP6 smoke test: OK');
