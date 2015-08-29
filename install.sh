#!/bin/bash
#
# @author No3x <no3x@no3x.de>
# @license http://opensource.org/licenses/GPL-2.0 GPL-2.0
#
# Deploy pseudo mu-plugins to all of your hosts.
# Useful for plugins you want to have installed on all of your WordPress installations. E.g. w√p-fail2ban or limit-√login-attempts
# Since only hosts with wp-content directory in path are taken in cosideration only WordPress hosts are deployed to.
# Since the mu-√plugin directory doesnt support sub-directories this script 'merges' all of SRC_DIRS into all of your hosts 'plugin' dir.
# Technically that are just symlinks.
# WARNING: Please use this script with caution.
#

SRC_DIRS="/usr/local/apache/host.ltd/mu-plugins/contents"
DESTS_DIRS=`find /var/www/host.ltd -type d -path '*/wp-content/plugins' -print`

for dest in ${DESTS_DIRS}
do
	#echo "dest: $dest"
	for src in ${SRC_DIRS}
	do
	    LINKS=`ls -A $src`
	    for link in ${LINKS}
	    do
		#echo "link: $link"
		#echo "folder $src"
		#echo "ln -s $src/$link $dest/$link"
	    	if [[ -e $dest/$link ]]; then
			echo "$dest/$link already exists :)"
		else
			echo "Creating symlink: $src/$link $dest/$link"
                        ln -s $src/$link $dest/$link
		fi
	    done
	done
done
