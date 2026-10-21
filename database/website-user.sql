CREATE USER IF NOT EXISTS 'website'@'%' IDENTIFIED BY 'change_this_website_password';

GRANT SELECT (id, username, email, salt, verifier, locked, joindate, last_login, last_ip) ON acore_auth.account TO 'website'@'%';
GRANT INSERT (username, email, reg_mail, salt, verifier, expansion, joindate) ON acore_auth.account TO 'website'@'%';
GRANT SELECT ON acore_auth.account_access TO 'website'@'%';
GRANT SELECT ON acore_characters.characters TO 'website'@'%';

FLUSH PRIVILEGES;
