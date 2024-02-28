#!/bin/sh


Shutdown_command="systemctl poweroff"
Reboot_command="systemctl reboot"
Logout_command="swaymsg exit"
Hibernate_command="systemctl hibernate"
Suspend_command="systemctl suspend"
Back_command=""

rofi_command="rofi -theme /home/hoppix/.config/wofi/launcher.rasi"
options=$'Back\nShutdown\nLogout\nReboot\nHibernate\nSuspend' 

# ... because the essential options (-dmenu and -p) are added here
eval \$"$(echo "$options" | $rofi_command -dmenu -p "")_command"