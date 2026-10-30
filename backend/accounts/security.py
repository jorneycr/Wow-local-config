import hashlib
import secrets
import string

N = int('894B645E89E1535BBDAD5B8B290650530801B18EBFBF5E8FAB3C82872A3E9BB7', 16)
G = 7


def upper_basic_latin(value: str) -> str:
    return ''.join(char.upper() if 'a' <= char <= 'z' else char for char in value)


def verifier(username: str, password: str, salt: bytes) -> bytes:
    username = upper_basic_latin(username)
    password = upper_basic_latin(password)
    identity_hash = hashlib.sha1(f'{username}:{password}'.encode(), usedforsecurity=True).digest()
    exponent = int.from_bytes(hashlib.sha1(salt + identity_hash, usedforsecurity=True).digest(), 'little')
    return pow(G, exponent, N).to_bytes(32, 'little')


def registration_data(username: str, password: str) -> tuple[bytes, bytes]:
    salt = secrets.token_bytes(32)
    return salt, verifier(username, password, salt)


def password_matches(username: str, password: str, salt: bytes, stored_verifier: bytes) -> bool:
    if len(salt) != 32 or len(stored_verifier) != 32:
        return False
    return secrets.compare_digest(verifier(username, password, salt), stored_verifier)


def jwt_secret() -> str:
    from django.conf import settings
    return settings.JWT_SECRET
