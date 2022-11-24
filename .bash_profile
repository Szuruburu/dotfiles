# ~/.bash_profile: executed by bash login shells.

if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# If the generic profile exists, source that as well.
if [ -f ~/.profile ]; then
    . ~/. profile
fi
