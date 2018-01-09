FROM opensuse:latest

MAINTAINER Dan Elder <dantheelder@gmail.com>

# Install the appropriate software
RUN zypper --gpg-auto-import-keys ref && zypper up -y
RUN zypper install -y curl make autoconf automake libtool net-tools ncurses-utils

RUN useradd -c 'PocketMine-MP' --home /pocketmine pocketmine
RUN passwd -l pocketmine

WORKDIR /pocketmine
RUN mkdir -p /pocketmine/PocketMine-MP
RUN chown -R pocketmine /pocketmine

COPY assets/server.properties /pocketmine/server.properties.original
COPY assets/entrypoint.sh /pocketmine/entrypoint.sh

RUN chmod 755 /pocketmine/entrypoint.sh

USER pocketmine

ENV GNUPGHOME /pocketmine

RUN cd /pocketmine/PocketMine-MP && curl -sL https://get.pmmp.io | bash -s -

EXPOSE 19132/udp

ENTRYPOINT ["./entrypoint.sh"]

