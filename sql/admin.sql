# -*- text -*-
##
## admin.sql -- MySQL commands for creating the RADIUS user.
##
##	WARNING: You should change 'localhost' and 'radpass'
##		 to something else.  Also update raddb/sql.conf
##		 with the new RADIUS password.
##
##	WARNING2: Please execute these commands after
##                all other files so referenced tables exist.
##
##	$Id: 2c1d69be33831669a9520724af23e4b0cb4866ca $

#
#  Create default administrator for RADIUS
#
CREATE USER 'radius'@'localhost' IDENTIFIED BY 'radpass';

# The server can read any table in SQL
GRANT SELECT ON radius.* TO 'radius'@'localhost';

# The server can write to the accounting and post-auth logging table.
#
#  i.e. 
GRANT ALL on radius.radacct TO 'radius'@'localhost';
GRANT ALL on radius.radpostauth TO 'radius'@'localhost';

GRANT ALL PRIVILEGES ON radius.reg_users TO 'radius'@'localhost';
GRANT ALL PRIVILEGES ON radius.radcheck TO 'radius'@'localhost';
GRANT ALL PRIVILEGES ON radius.radusergroup TO 'radius'@'localhost';
FLUSH PRIVIELGES;
