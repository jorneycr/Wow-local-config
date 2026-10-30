import { Injectable } from '@nestjs/common';
import { createHash, randomBytes, timingSafeEqual } from 'node:crypto';
import { SRP6_FIELD_LENGTH, SRP6_GENERATOR, SRP6_MODULUS } from './srp6.constants';

function upperBasicLatin(value: string): string {
  return value.replace(/[a-z]/g, (character) => character.toUpperCase());
}

function sha1(value: Buffer | string): Buffer {
  return createHash('sha1').update(value).digest();
}

function littleEndianToBigInt(value: Buffer): bigint {
  return BigInt(`0x${Buffer.from(value).reverse().toString('hex')}`);
}

function bigIntToLittleEndian(value: bigint): Buffer {
  const hex = value.toString(16).padStart(SRP6_FIELD_LENGTH * 2, '0');
  return Buffer.from(hex.match(/.{2}/g)!.reverse().join(''), 'hex');
}

@Injectable()
export class Srp6Service {
  registrationData(username: string, password: string): { salt: Buffer; verifier: Buffer } {
    const salt = randomBytes(SRP6_FIELD_LENGTH);
    return { salt, verifier: this.verifier(username, password, salt) };
  }

  passwordMatches(username: string, password: string, salt: Buffer, storedVerifier: Buffer): boolean {
    if (salt.length !== SRP6_FIELD_LENGTH || storedVerifier.length !== SRP6_FIELD_LENGTH) return false;
    const calculated = this.verifier(username, password, salt);
    return timingSafeEqual(calculated, storedVerifier);
  }

  private verifier(username: string, password: string, salt: Buffer): Buffer {
    const normalizedUsername = upperBasicLatin(username);
    const normalizedPassword = upperBasicLatin(password);
    const identityHash = sha1(`${normalizedUsername}:${normalizedPassword}`);
    const exponent = littleEndianToBigInt(sha1(Buffer.concat([salt, identityHash])));
    return bigIntToLittleEndian(this.modPow(SRP6_GENERATOR, exponent, SRP6_MODULUS));
  }

  private modPow(base: bigint, exponent: bigint, modulus: bigint): bigint {
    let result = 1n;
    let current = base % modulus;
    let remaining = exponent;
    while (remaining > 0n) {
      if (remaining % 2n === 1n) result = (result * current) % modulus;
      current = (current * current) % modulus;
      remaining /= 2n;
    }
    return result;
  }
}
