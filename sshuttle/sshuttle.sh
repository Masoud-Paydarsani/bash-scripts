#!/bin/bash

sudo apt install -y sshuttle 

touch v{p,d,s}
chmod +x v{p,d,s}

cat << EOF > vp
#!/bin/bash
sshuttle --dns -r user@ip:port 0/0 -x ip --no-latency-control  &
EOF

cat << 'EOF' > vd
#!/bin/bash
sudo kill -9 $(pgrep sshuttle)
EOF

cat << 'EOF' > vs
#!/bin/bash
sudo pgrep sshuttle

if [ $? -ne 0 ]; then
	echo -e "VPN is disconnected"
else
	echo -e "VPN is running"
fi
EOF

echo 'export PATH="$PATH:$HOME"' >> ~/.bashrc
source .bashrc

sudo rm sshuttle.sh