#!/bin/bash
echo 'Package install! need sudo for this'

sudo -- sh -c '\
apt-get install -y terminator golang git zsh;\
snap install --classic code ;\
'
echo 'Exiting sudo!'

echo 'Setting default terminal!'
gsettings set org.gnome.desktop.default-applications.terminal exec /usr/bin/terminator
gsettings set org.gnome.desktop.default-applications.terminal exec-arg "-x"

echo 'Code extensions install!'
code --install-extension golang.Go
go get -v github.com/ramya-rao-a/go-outline
go get -v github.com/uudashr/gopkgs/v2/cmd/gopkgs
go get -v github.com/sqs/goreturns

echo 'OMZ install!'
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
