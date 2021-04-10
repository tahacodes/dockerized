create user wordpress@'%' identified by 'wordpress';
grant all privileges on *.* to wordpress@'%';
flush privileges;
quit