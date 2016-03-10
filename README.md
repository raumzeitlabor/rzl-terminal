# rzl-terminal

Software and Hardware powering our public IRC terminal consisting of a Raspberry PI and a Wyse 55-ES serial terminal.

irssi-config
------------

Configuration for the irssi minus the bouncer password. We originally wanted to use Weechat, but it seems to have a few display bugs with serial terminals.

serial-getty@ttyAMA0.service
----------------------------

Systemd unit file. This is actually the standard serial-getty@ unit that should be on every Linux using systemd. We only changed the agetty parameters (Like the baud rate, terminal type, and autologin to the terminal user).

Save as /etc/systemd/system/serial-getty@ttyAMA0.service, then do `systemctl daemon-reload`.

terminal.sh
-----------

Bash script that keeps the whole thing together. We simply set this as the login shell for our terminal user using `chsh -s /usr/local/bin/terminal.sh terminal`. You might have to add it to /etc/shells first on some Linux distributions.
