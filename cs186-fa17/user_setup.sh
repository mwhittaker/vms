#! /usr/bin/env bash

set -euo pipefail

main() {
    # Most desktop environments (e.g KDE, GNOME) ship with a display manager
    # (e.g. kdm, gdm) that greets the user when they turn on their computer and
    # prompts them to log in [1]. XFCE is a bit different; it doesn't ship with
    # a default display manager. Instead, users log in via the command line.
    # Then, by putting these two lines in their appropriate files, xfce is
    # started upon log in [2].
    #
    # [1]: https://unix.stackexchange.com/a/20428
    # [2]: https://askubuntu.com/a/614544
    echo 'exec startxfce4' >> ~/.xinitrc
    echo '[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx' >> ~/.bashrc

    # By default, the icons in the launcher at the bottom of the desktop are
    # missing. We use the xfconf-query command to make them appear [1].
    # However, trying to run xfconf-query without xfce actually up and running
    # fails. We have to use the commands in [2] to make things work.
    #
    # [1]: https://forum.xfce.org/viewtopic.php?id=5653
    # [2]: https://unix.stackexchange.com/a/235098
    eval `dbus-launch --sh-syntax`
    xfconf-query -c xsettings -p /Net/IconThemeName -s "Tango"
    kill -HUP $DBUS_SESSION_BUS_PID
}

main
