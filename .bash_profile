# Most of the time you don’t want to maintain two separate config files
# for login and non-login shells — when you set a PATH, you want it to
# apply to both. You can fix this by sourcing .bashrc from your .bash_profile 
# file, then putting PATH and common settings in .bashrc.
#
# http://www.joshstaiger.org/archives/2005/07/bash_profile_vs.html

if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi
