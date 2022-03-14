VPN_USER="y.hoffmann"
TW_PASSWORD="$(pass show talkwalker)"
read -p "Yubikey: " YUBIKEY
CREDS="$HOME/.creds.txt"

echo $VPN_USER > $CREDS
echo "$TW_PASSWORD$YUBIKEY" >> $CREDS

sudo openvpn \
	--daemon \
	--config /home/yann/.ssh/vpn/y.hoffmann.ovpn \
	--auth-user-pass $CREDS

rm $CREDS
