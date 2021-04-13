CREATE DATABASE wordpress DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
CREATE USER 'wordpress'@'%' IDENTIFIED BY 'wordpress';
GRANT ALL ON wordpress.* TO 'wordpress'@'%';
FLUSH PRIVILEGES;
quit