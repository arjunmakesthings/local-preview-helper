# for server:

# name it whatever you want to name it. i named it serveme.
serveme(){
# get interface:
IFACE=$(route get default | grep interface | awk '{print $2}')

# get ip:
IP=$(ipconfig getifaddr $IFACE)

# assign port; 
PORT=8000

# fallback:
if [ -z "$IP" ]; then
  IP="localhost"
fi

echo ""
echo "ip to test on phone: $IP:$PORT"
echo ""

# can open any browser here. i chose google-chrome because it has dev-tools.
open -a "Google Chrome" "http://localhost:$PORT/"

python3 -m http.server $PORT --bind 0.0.0.0
}
