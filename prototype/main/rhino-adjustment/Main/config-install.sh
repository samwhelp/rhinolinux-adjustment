#!/usr/bin/env bash

#set -e


################################################################################
### Head: xfce
##

xfce_config_run_pre () {

	xfce_service_stop


	return 0

}

xfce_config_run_post () {

	xfce_service_start


	return 0

}

xfce_service_stop () {

	xfce_service_stop_xfconfd

	#xfce_service_stop_xfsettingsd


	return 0

}

xfce_service_stop_xfconfd () {

	if killall -9 xfconfd; then
		return 0
	fi


	return 0

}

xfce_service_stop_xfsettingsd () {

	if killall -9 xfsettingsd; then
		return 0
	fi


	return 0

}

xfce_service_start () {


	return 0

}

xfce_config_install () {

	echo
	echo "##"
	echo "## Config: xfce"
	echo "##"
	echo


	xfce_config_install_by_dir

	xfce_config_install_adjust_xdg_unicorn


	echo

}

xfce_config_install_by_dir () {


	echo
	echo "mkdir -p ${HOME}"
	mkdir -p "${HOME}"


	echo
	echo "cp -rf ./asset/overlay/etc/skel/. ${HOME}"
	cp -rf "./asset/overlay/etc/skel/." "${HOME}"


}


xfce_config_install_adjust_xdg_unicorn () {


	echo
	echo sudo mkdir -p "/etc/xdg/xdg-unicorn/xfce4/xfconf/xfce-perchannel-xml"
	sudo mkdir -p "/etc/xdg/xdg-unicorn/xfce4/xfconf/xfce-perchannel-xml"


	##
	## ## unicorn desktop / set default keybind
	##

	echo
	echo sudo install -Dm644 "./asset/overlay/etc/skel/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml" "/etc/xdg/xdg-unicorn/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml"
	sudo install -Dm644 "./asset/overlay/etc/skel/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml" "/etc/xdg/xdg-unicorn/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml"


}

##
### Tail: xfce
################################################################################




################################################################################
### Head: plank
##

plank_system_stop_plank () {

	if killall -9 plank; then
		return 0
	fi


	return 0

}

plank_system_start_plank () {

	plank &

	return 0

}

plank_config_run_pre () {

	plank_system_stop_plank

	sleep 3

	return 0
}


plank_config_run_post () {

	plank_system_start_plank

	return 0
}

plank_config_install () {

	echo
	echo "##"
	echo "## Config: plank"
	echo "##"
	echo


	plank_config_install_dock1_launchers_item_clear
	plank_config_install_dock1_settings_item_clear



	plank_config_install_dock1_launchers_item_add
	plank_config_install_dock1_settings_item_add


	return 0
}

plank_config_install_dock1_settings_item_clear () {


	echo
	echo gsettings set net.launchpad.plank.dock.settings:/net/launchpad/plank/docks/dock1/ dock-items "[]"
	gsettings set net.launchpad.plank.dock.settings:/net/launchpad/plank/docks/dock1/ dock-items "[]"


	return 0
}


plank_config_install_dock1_settings_item_add () {


	echo
	echo gsettings set net.launchpad.plank.dock.settings:/net/launchpad/plank/docks/dock1/ dock-items "['thunar.dockitem', 'codium.dockitem', 'firefox.dockitem', 'xfce4-terminal.dockitem', 'desktop.dockitem', 'uniLauncher.dockitem', 'uniApps.dockitem', 'uniDesktop.dockitem', 'org.rhinolinux.system.dockitem']"
	gsettings set net.launchpad.plank.dock.settings:/net/launchpad/plank/docks/dock1/ dock-items "['thunar.dockitem', 'codium.dockitem', 'firefox.dockitem', 'xfce4-terminal.dockitem', 'desktop.dockitem', 'uniLauncher.dockitem', 'uniApps.dockitem', 'uniDesktop.dockitem', 'org.rhinolinux.system.dockitem']"


	return 0
}

plank_config_install_dock1_launchers_item_clear () {


	echo
	echo mkdir -p "${HOME}/.config/plank/dock1/launchers"
	mkdir -p "${HOME}/.config/plank/dock1/launchers"

	echo
	echo rm -rf "${HOME}/.config/plank/dock1/launchers/*"
	rm -rf ${HOME}/.config/plank/dock1/launchers/*


	return 0
}


plank_config_install_dock1_launchers_item_add () {
	echo
	echo install -Dm644 "./asset/overlay/etc/skel/.config/plank/dock1/launchers/thunar.dockitem" "${HOME}/.config/plank/dock1/launchers/thunar.dockitem"
	install -Dm644 "./asset/overlay/etc/skel/.config/plank/dock1/launchers/thunar.dockitem" "${HOME}/.config/plank/dock1/launchers/thunar.dockitem"


	echo
	echo install -Dm644 "./asset/overlay/etc/skel/.config/plank/dock1/launchers/codium.dockitem" "${HOME}/.config/plank/dock1/launchers/codium.dockitem"
	install -Dm644 "./asset/overlay/etc/skel/.config/plank/dock1/launchers/codium.dockitem" "${HOME}/.config/plank/dock1/launchers/codium.dockitem"


	echo
	echo install -Dm644 "./asset/overlay/etc/skel/.config/plank/dock1/launchers/firefox.dockitem" "${HOME}/.config/plank/dock1/launchers/firefox.dockitem"
	install -Dm644 "./asset/overlay/etc/skel/.config/plank/dock1/launchers/firefox.dockitem" "${HOME}/.config/plank/dock1/launchers/firefox.dockitem"


	echo
	echo install -Dm644 "./asset/overlay/etc/skel/.config/plank/dock1/launchers/xfce4-terminal.dockitem" "${HOME}/.config/plank/dock1/launchers/xfce4-terminal.dockitem"
	install -Dm644 "./asset/overlay/etc/skel/.config/plank/dock1/launchers/xfce4-terminal.dockitem" "${HOME}/.config/plank/dock1/launchers/xfce4-terminal.dockitem"


	echo
	echo install -Dm644 "./asset/overlay/etc/skel/.config/plank/dock1/launchers/desktop.dockitem" "${HOME}/.config/plank/dock1/launchers/desktop.dockitem"
	install -Dm644 "./asset/overlay/etc/skel/.config/plank/dock1/launchers/desktop.dockitem" "${HOME}/.config/plank/dock1/launchers/desktop.dockitem"


	echo
	echo install -Dm644 "./asset/overlay/etc/skel/.config/plank/dock1/launchers/uniLauncher.dockitem" "${HOME}/.config/plank/dock1/launchers/uniLauncher.dockitem"
	install -Dm644 "./asset/overlay/etc/skel/.config/plank/dock1/launchers/uniLauncher.dockitem" "${HOME}/.config/plank/dock1/launchers/uniLauncher.dockitem"


	echo
	echo install -Dm644 "./asset/overlay/etc/skel/.config/plank/dock1/launchers/uniApps.dockitem" "${HOME}/.config/plank/dock1/launchers/uniApps.dockitem"
	install -Dm644 "./asset/overlay/etc/skel/.config/plank/dock1/launchers/uniApps.dockitem" "${HOME}/.config/plank/dock1/launchers/uniApps.dockitem"


	echo
	echo install -Dm644 "./asset/overlay/etc/skel/.config/plank/dock1/launchers/uniDesktop.dockitem" "${HOME}/.config/plank/dock1/launchers/uniDesktop.dockitem"
	install -Dm644 "./asset/overlay/etc/skel/.config/plank/dock1/launchers/uniDesktop.dockitem" "${HOME}/.config/plank/dock1/launchers/uniDesktop.dockitem"


	echo
	echo install -Dm644 "./asset/overlay/etc/skel/.config/plank/dock1/launchers/org.rhinolinux.system.dockitem" "${HOME}/.config/plank/dock1/launchers/org.rhinolinux.system.dockitem"
	install -Dm644 "./asset/overlay/etc/skel/.config/plank/dock1/launchers/org.rhinolinux.system.dockitem" "${HOME}/.config/plank/dock1/launchers/org.rhinolinux.system.dockitem"




	return 0
}

##
### Tail: plank
################################################################################




################################################################################
### Head: config_install
##

main_config_install () {

	xfce_config_run_pre

	xfce_config_install

	xfce_config_run_post




	plank_config_run_pre
	
	plank_config_install

	plank_config_run_post




	return 0

}

##
### Tail: config_install
################################################################################


################################################################################
### Head: Main
##

__main__ () {

	main_config_install

}

##
## Start
##
__main__

##
### Tail: Main
################################################################################
