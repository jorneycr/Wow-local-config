from unittest.mock import patch
from django.test import SimpleTestCase, RequestFactory
from django.core.exceptions import ValidationError
from .api import validate_email, validate_password
from .auth import issue_token, claims
from .security import password_matches, registration_data, verifier


class ValidationTests(SimpleTestCase):
    def test_valid_email_is_normalized(self):
        self.assertEqual(validate_email(' User@Example.COM '), 'user@example.com')

    def test_invalid_email_is_rejected(self):
        self.assertIsNone(validate_email('not-an-email'))

    def test_password_length_is_enforced(self):
        self.assertEqual(validate_password('Password123'), 'Password123')
        self.assertIsNone(validate_password('short'))


class SRP6Tests(SimpleTestCase):
    def test_generated_registration_data_is_32_bytes(self):
        salt, stored_verifier = registration_data('DANIEL', 'DanielLocal123')
        self.assertEqual(len(salt), 32)
        self.assertEqual(len(stored_verifier), 32)

    def test_generated_password_matches(self):
        salt, stored_verifier = registration_data('DANIEL', 'DanielLocal123')
        self.assertTrue(password_matches('DANIEL', 'DanielLocal123', salt, stored_verifier))

    def test_wrong_password_does_not_match(self):
        salt, stored_verifier = registration_data('DANIEL', 'DanielLocal123')
        self.assertFalse(password_matches('DANIEL', 'WrongPassword123', salt, stored_verifier))

    def test_case_normalization_matches_azerothcore(self):
        salt, stored_verifier = registration_data('Daniel', 'DanielLocal123')
        self.assertTrue(password_matches('DANIEL', 'DANIELLOCAL123', salt, stored_verifier))


class JWTTests(SimpleTestCase):
    @patch('accounts.auth.settings.JWT_SECRET', 'test-secret-with-at-least-32-bytes-1234')
    @patch('accounts.auth.settings.JWT_ISSUER', 'test-issuer')
    @patch('accounts.auth.settings.JWT_AUDIENCE', 'test-audience')
    def test_token_contains_account_identity(self):
        request = RequestFactory().get('/api/me')
        token = issue_token(42, 'DANIEL')
        request.COOKIES = {'access_token': token}
        payload = claims(request)
        self.assertEqual(payload['sub'], '42')
        self.assertEqual(payload['username'], 'DANIEL')
