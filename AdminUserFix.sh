#!/bin/sh

#  AdminUserCheck_EA.sh
#  
#
#  Created by Lee Stanford on 2/14/19.
#  
loggedInUser=$(/usr/bin/python -c 'from SystemConfiguration import SCDynamicStoreCopyConsoleUser; import sys; username = (SCDynamicStoreCopyConsoleUser(None, None, None) or [None])[0]; username = [username,""][username in [u"loginwindow", None, u""]]; sys.stdout.write(username + "\n");')
if groups $loggedInUser | grep -q -w admin ; then
/usr/sbin/dseditgroup -o edit -d $loggedInUser -t user admin
fi

exit 0
#
