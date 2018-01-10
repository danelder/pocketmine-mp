#!/bin/bash

cd /pocketmine/PocketMine-MP

if ! [ -e server.properties ]; then
	echo >&2 "[WARN] server.properties is not found in $(pwd). Copying from the original assets."
	cp -p ../server.properties.original server.properties
	chown pocketmine server.properties
fi

# Link in state files if they exist
if [ -e /pocketmine/PocketMine-MP/mapped/banned-ips.txt ]; then
	ln -s /pocketmine/PocketMine-MP/mapped/banned-ips.txt /pocketmine/PocketMine-MP/banned-ips.txt
fi

if [ -e /pocketmine/PocketMine-MP/mapped/banned-players.txt ]; then
        ln -s /pocketmine/PocketMine-MP/mapped/banned-players.txt /pocketmine/PocketMine-MP/banned-players.txt
fi

if [ -e /pocketmine/PocketMine-MP/mapped/ops.txt ]; then
        ln -s /pocketmine/PocketMine-MP/mapped/ops.txt /pocketmine/PocketMine-MP/ops.txt
fi

if [ -e /pocketmine/PocketMine-MP/mapped/server.log ]; then
        ln -s /pocketmine/PocketMine-MP/mapped/server.log /pocketmine/PocketMine-MP/server.log
fi

if [ -e /pocketmine/PocketMine-MP/mapped/white-list.txt ]; then
        ln -s /pocketmine/PocketMine-MP/mapped/white-list.txt /pocketmine/PocketMine-MP/white-list.txt
fi

if [ -e /pocketmine/PocketMine-MP/mapped/players ]; then
        ln -s /pocketmine/PocketMine-MP/mapped/players /pocketmine/PocketMine-MP/players
fi

if [ -e /pocketmine/PocketMine-MP/mapped/plugins ]; then
        ln -s /pocketmine/PocketMine-MP/mapped/plugins /pocketmine/PocketMine-MP/plugins
fi

if [ -e /pocketmine/PocketMine-MP/mapped/worlds ]; then
        ln -s /pocketmine/PocketMine-MP/mapped/worlds /pocketmine/PocketMine-MP/worlds
fi

/pocketmine/PocketMine-MP/start.sh --no-wizard

