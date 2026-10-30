from django.test import SimpleTestCase, Client


class SecuritySmokeTests(SimpleTestCase):
    def setUp(self):
        self.client = Client(enforce_csrf_checks=True)

    def test_csrf_endpoint_sets_cookie(self):
        response = self.client.get('/api/csrf')
        self.assertEqual(response.status_code, 200)
        self.assertIn('csrftoken', response.cookies)

    def test_login_without_csrf_is_rejected(self):
        response = self.client.post('/api/login', data='{}', content_type='application/json')
        self.assertEqual(response.status_code, 403)
