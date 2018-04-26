# Introduction
Install MariaDB and configure it on CentOS

## Environment
* CentOS 7.4 x86_64

## Installation
```
$ sudo yum install -y mariadb-server
```

## Start MariaDB server
```
$ sudo systemctl start mariadb
$ systemctl status mariadb
● mariadb.service - MariaDB database server
   Loaded: loaded (/usr/lib/systemd/system/mariadb.service; disabled; vendor preset: disabled)
      Active: active (running) since Thu 2018-04-26 17:34:31 CST; 20s ago
        Process: 26273 ExecStartPost=/usr/libexec/mariadb-wait-ready $MAINPID (code=exited, status=0/SUCCESS)
          Process: 26191 ExecStartPre=/usr/libexec/mariadb-prepare-db-dir %n (code=exited, status=0/SUCCESS)
           Main PID: 26272 (mysqld_safe)
              CGroup: /system.slice/mariadb.service
                         ├─26272 /bin/sh /usr/bin/mysqld_safe --basedir=/usr
                                    └─26434 /usr/libexec/mysqld --basedir=/usr --datadir=/var/lib/mysql --plugin-dir=/usr/lib64/mysql/plugin --log-error=/var/log/mariadb/mariadb.log --pid-file=/var/run/mariadb/ma...
```

## Configuration
```
$ mysql_secure_installation
```

```
NOTE: RUNNING ALL PARTS OF THIS SCRIPT IS RECOMMENDED FOR ALL MariaDB
      SERVERS IN PRODUCTION USE!  PLEASE READ EACH STEP CAREFULLY!

      In order to log into MariaDB to secure it, we'll need the current
      password for the root user.  If you've just installed MariaDB, and
      you haven't set the root password yet, the password will be blank,
      so you should just press enter here.

      Enter current password for root (enter for none): 
      OK, successfully used password, moving on...

      Setting the root password ensures that nobody can log into the MariaDB
      root user without the proper authorisation.

      Set root password? [Y/n] Y
      New password: 
      Re-enter new password: 
      Password updated successfully!
      Reloading privilege tables..
       ... Success!


       By default, a MariaDB installation has an anonymous user, allowing anyone
       to log into MariaDB without having to have a user account created for
       them.  This is intended only for testing, and to make the installation
       go a bit smoother.  You should remove them before moving into a
       production environment.

       Remove anonymous users? [Y/n] n
        ... skipping.

        Normally, root should only be allowed to connect from 'localhost'.  This
        ensures that someone cannot guess at the root password from the network.

        Disallow root login remotely? [Y/n] Y
         ... Success!

         By default, MariaDB comes with a database named 'test' that anyone can
         access.  This is also intended only for testing, and should be removed
         before moving into a production environment.

         Remove test database and access to it? [Y/n] n
          ... skipping.

          Reloading the privilege tables will ensure that all changes made so far
          will take effect immediately.

          Reload privilege tables now? [Y/n] Y
           ... Success!

           Cleaning up...

           All done!  If you've completed all of the above steps, your MariaDB
           installation should now be secure.

           Thanks for using MariaDB!
```

### Enter this keys:
* Enter current password for root (enter for none): <Enter>
* Set root password? [Y/n] **Y**
* New password: <Input root password>
* Re-enter new password: <Repeart the root password>
* Remove anonymous users? [Y/n] **n**
* Disallow root login remotely? [Y/n] **Y**
* Remove test database and access to it? [Y/n] **n**
* Reload privilege tables now? **Y**



