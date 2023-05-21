# auth_vpn.sh
VPN_USER="y.hoffmann"
TW_PASSWORD="$(pass show talkwalker)"

read -rp "Yubikey: " YUBIKEY
CREDS="$HOME/.creds.txt"

echo $VPN_USER > "$CREDS"
echo "$TW_PASSWORD$YUBIKEY" >> "$CREDS"

sudo openvpn \
	--daemon \
	--config /home/yann/.ssh/vpn/y.hoffmann.ovpn \
	--auth-user-pass "$CREDS"

rm "$CREDS"
<<<<<<< HEAD
||||||| parent of fe811aa (Synchronize)


## set up tunnels
# git tunnels
ssh -L 3333:git.talkwalker.net:22 work
# VNC
ssh -L 9999:localhost:5901 work
# audience grpc testing
ssh -L 4044:wc2n8:4044 work
=======


## set up tunnels
# git tunnels
ssh -tt -L 3333:git.talkwalker.net:22 work &
# VNC
ssh -tt -L 9999:localhost:5901 work &
# audience grpc testing
ssh -tt -L 4044:wc2n8:4044 work &
# llm_insight grpc
ssh -tt -L 4045:wc5n17:4045 work &
>>>>>>> fe811aa (Synchronize)
