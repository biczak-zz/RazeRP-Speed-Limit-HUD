fx_version 'cerulean'
game 'gta5'

version '0.1.0'
author 'Alex Biczak'
description 'Displays the current speed limit while driving'

ui_page 'ui.html'

client_scripts {
	'config.lua',
	'client.lua',
}

files {
	'ui.html',
	'style.css',
	'eventHandler.js',
	'speed_limit_sign.png'
}
