# CR1SS - PING SWEEP
# This script performs a ping sweep on a specified subnet.
param($p1)

# Checks if the $p1 parameter is defined.
# If not, print instructions for use.
if (!p1){
    echo "PING SWEEP by CR1SS"
    echo "Usage: .\ping_sweep.ps1 192.168.10"
} else {
     # Loop through all IP addresses in the subnet.
    foreach ($ip in 1..254){
        # Attempt to send a ping to the current IP address.
        # If the ping is successful, extract the IP address from the result.
        try {
            $answer = ping -n 1 "$p1.$ip" | Select-String "bytes=32"
        $answer.Line.split(' ')[2] -replace ":",""
        } catch {}
    }
}