CREATE USER IF NOT EXISTS 'website'@'%' IDENTIFIED BY 'change_this_website_password';

GRANT SELECT (id, username, salt, verifier, locked) ON acore_auth.account TO 'website'@'%';
GRANT SELECT ON acore_auth.account_access TO 'website'@'%';
GRANT SELECT ON acore_characters.characters TO 'website'@'%';

FLUSH PRIVILEGES;
