# Get IP - Optionally supply an interface (default: en0)
function ip() {
    if=${1:-en0}
    ip=$(ipconfig getifaddr $if)
    router=$(ipconfig getoption $if router)
    mac=$(ifconfig $if | awk '/ether/{print $2}')

    echo -e "IP:\t$ip"
    echo -e "Router:\t$router"
    echo -e "MAC:\t$mac"
    
    return
}

unset ip