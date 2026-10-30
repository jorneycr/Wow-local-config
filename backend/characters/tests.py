from unittest.mock import MagicMock, patch
from django.test import SimpleTestCase, RequestFactory
from .api import character_detail, character_detail_data, character_list_data


class CharacterApiTests(SimpleTestCase):
    def setUp(self):
        self.factory = RequestFactory()

    @patch('characters.api.character_cursor')
    def test_character_list_is_scoped_to_authenticated_account(self, cursor_factory):
        cursor = MagicMock()
        cursor.fetchall.return_value = [(7, 'Daniel', 80, 1, 5, 0)]
        cursor_factory.return_value.__enter__.return_value = cursor
        request = self.factory.get('/api/characters')
        request.account_id = 12
        response = character_list_data(request)
        self.assertEqual(response['characters'][0]['guid'], 7)
        cursor.execute.assert_called_once_with(
            'SELECT guid,name,level,race,class,online FROM characters WHERE account = %s ORDER BY name',
            [12],
        )

    @patch('characters.api.character_cursor')
    def test_character_detail_rejects_unknown_character(self, cursor_factory):
        cursor = MagicMock()
        cursor.fetchone.return_value = None
        cursor_factory.return_value.__enter__.return_value = cursor
        request = self.factory.get('/api/character?guid=999')
        request.account_id = 12
        response = character_detail.__wrapped__(request)
        self.assertEqual(response.status_code, 401)
