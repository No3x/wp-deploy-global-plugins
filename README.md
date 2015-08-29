# wp-deploy-global-plugins
Deploy pseudo mu-plugins to all of your hosts.
Useful for plugins you want to have installed on all of your WordPress installations. E.g. wÃp-fail2ban or limit-Ãlogin-attempts
Since only hosts with wp-content directory in path are taken in cosideration only WordPress hosts are deployed to.
Since the mu-plugin directory doesnt support sub-directories this script 'merges' all of SRC_DIRS into all of your hosts 'plugin' dir.
Technically that are just symlinks.
WARNING: Please use this script with caution.
