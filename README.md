# wp-deploy-global-plugins
Deploy pseudo mu-plugins to all of your hosts.

Useful for plugins you want to have installed on all of your WordPress installations. E.g. wp-fail2ban or limit-login-attempts.

Since only hosts with wp-content directory in path are taken in cosideration only WordPress hosts are deployed to.

Since the mu-plugin directory doesnt support sub-directories this script 'merges' all of SRC_DIRS into all of your hosts 'plugin' dir.

Technically that are just symlinks.

WARNING: Please use this script with caution.
## Usage
On installation and when you drop new plugins in any of the SRC_DIRS you have to update the referencens. 
Just execute

`cd /usr/local/apache/host.ltd/wp-deploy-global-plugins`

`./install.sh`
## Installation

`mkdir -p /usr/local/apache/host.ltd`

`cd /usr/local/apache/host.ltd`

`git clone https://github.com/No3x/wp-deploy-global-plugins`

`cd wp-deploy-global-plugins`

`sudo chmod +x install.sh`

Put your plugins that you want to installed on all of your WordPress hosts to ``contents``.

Configure ``SRC_DIRS`` and ``DESTS_DIRS`` in ``install.sh``:

``SRC_DIRS`` are the dirs drop the plugins (usually only one dir: /usr/local/apache/host.ltd/wp-deploy-global-plugins/contents)

``DESTS_DIRS`` are the dirs the plugins are deployed to. You have to adapt your document root after the find only:
DESTS_DIRS=`find /var/www/host.ltd -type d -path '*/wp-content/plugins' -print`
This will seach all WordPress plugin directories and deploy to them.
