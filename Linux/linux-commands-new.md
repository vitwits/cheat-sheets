# Linux Commands Cheat Sheet

## 1. System Information
### 1.1 Hardware Information
### 1.2 System Information
### 1.3 Kernel and OS

## 2. File Management
### 2.1 File Operations
### 2.2 Directory Operations
### 2.3 File Permissions and Ownership
### 2.4 Disk Usage and Filesystems

## 3. Process Management
### 3.1 Viewing Processes
### 3.2 Controlling Processes
### 3.3 Job Control and Scheduling

## 4. User Management
### 4.1 User Accounts
### 4.2 Groups and Permissions
### 4.3 Authentication and Security

## 5. Networking

```bash
ip addr show                      # Show IP addresses of all interfaces  
ip addr show dev eth0             # Show IP addresses of eth0  
ip addr add 192.168.1.50/24 dev eth0    # Add IP address 192.168.1.50/24 to eth0  
ip addr del 192.168.1.50/24 dev eth0    # Delete IP address 192.168.1.50/24 from eth0  
ip addr flush dev eth0            # Remove all IP addresses from eth0  
ip link show                     # Show all network interfaces  
ip link show dev eth0            # Show info about eth0  
ip link set dev eth0 up          # Bring eth0 up  
ip link set dev eth0 down        # Bring eth0 down  
ip link set dev eth0 mtu 1400    # Set MTU of eth0 to 1400  
ip link set dev eth0 promisc on  # Enable promiscuous mode on eth0  
ip link set dev eth0 promisc off # Disable promiscuous mode on eth0  
ip link set dev eth0 address 00:11:22:33:44:55  # Change MAC address of eth0  
ip link set dev eth0 alias "uplink"             # Set alias “uplink” for eth0  
ip link set dev eth0 netns mynamespace           # Move eth0 to network namespace “mynamespace”  
ip route show                   # Show routing table  
ip route add 10.0.0.0/8 via 192.168.1.1 dev eth0   # Add route to 10.0.0.0/8 via gateway 192.168.1.1  
ip route add default via 192.168.1.1 dev eth0       # Add default gateway  
ip route del 10.0.0.0/8          # Delete route to 10.0.0.0/8  
ip route replace default via 192.168.1.254 dev eth1 # Replace default route  
ip neigh show                  # Show ARP table  
ip neigh show dev eth0         # Show ARP table for eth0  
ip neigh add 192.168.1.20 lladdr 00:11:22:33:44:55 dev eth0 nud permanent  # Add static ARP entry  
ip neigh del 192.168.1.20 dev eth0     # Delete ARP entry  
ip neigh flush dev eth0        # Flush ARP entries on eth0  
ip netns list                 # List network namespaces  
ip netns add mynamespace      # Create network namespace “mynamespace”  
ip netns delete mynamespace   # Delete network namespace “mynamespace”  
ip netns exec mynamespace ip addr show    # Run “ip addr show” inside mynamespace  
ip netns attach 12345 mynamespace         # Attach PID 12345 to namespace mynamespace  
ip maddr show dev eth0        # Show multicast groups on eth0  
ip maddr add 224.0.0.1 dev eth0  # Join multicast group 224.0.0.1 on eth0  
ip maddr del 224.0.0.1 dev eth0  # Leave multicast group 224.0.0.1 on eth0  
ip tunnel show               # Show existing tunnels  
ip tunnel add gre1 mode gre local 192.168.1.1 remote 192.168.1.2 dev eth0  # Add GRE tunnel  
ip tunnel del gre1           # Delete GRE tunnel gre1  
ip link add link eth0 name eth0.100 type vlan id 100   # Create VLAN 100 on eth0  
ip link del eth0.100          # Delete VLAN interface eth0.100  
ip link add veth0 type veth peer name veth1  # Create veth pair veth0 <-> veth1  
ip link del veth0             # Delete veth0 (also deletes peer veth1)  
ip -s link show              # Show interface statistics  
ip monitor all               # Monitor IP changes live  
ip rule show                 # Show routing rules  
ip rule add from 192.168.1.0/24 lookup 100   # Add routing rule for source subnet  
ip rule del from 192.168.1.0/24 lookup 100   # Delete routing rule  
ip rule flush                # Flush all routing rules  
ip tcp_metrics show          # Show TCP metrics cache  
ip tcp_metrics flush         # Flush TCP metrics cache  
ip vrf show                 # Show VRF devices  
ip link add vrf-blue type vrf table 10   # Create VRF device vrf-blue with table 10  
ip link del vrf-blue         # Delete VRF device vrf-blue  
ip link set dev eth0 txqueuelen 1000    # Set transmit queue length of eth0 to 1000  
ip link set dev eth0 alias "uplink"      # Set alias for eth0  
ip addr help
ip link help
ip route help
ip neigh help
ip netns help
ip rule help

ss -tuln                           # Show all listening TCP/UDP ports with numeric addresses  
ss -tunap                          # Show all TCP/UDP sockets with process info, no DNS resolution  
ss -s                              # Show socket statistics summary  
ss -tp                             # Show TCP connections with process names  
ss -ltp                            # Show listening TCP sockets with process info  
ss -tn                             # Show all TCP connections, numeric output, don't resolve service names 
ss -tna                            # Show all TCP connections with numeric addresses and ports  
ss -x                              # Show UNIX domain sockets  
ss -4tuln                          # Show IPv4 listening TCP/UDP ports  
ss -6tuln                          # Show IPv6 listening TCP/UDP ports  
ss -o state established '( sport = :http or sport = :https )'  # Show established HTTP/HTTPS connections with timers  
ss -epl                            # Show extended, process, and listening socket info  
ss -d | grep -v 'drops 0'          # Show only sockets with packet drops  
watch -n 1 'ss -s'                 # Live socket stats refresh every 1 second  

nmap -sS 192.168.1.1                   # TCP SYN scan (stealth scan) on target IP  
nmap -sT 192.168.1.1                   # TCP connect scan (full TCP handshake)  
nmap -sU 192.168.1.1                   # UDP scan  
nmap -p 22,80,443 192.168.1.1          # Scan specific ports 22, 80, and 443  
nmap -p- 192.168.1.1                   # Scan all 65535 TCP ports  
nmap -sV 192.168.1.1                   # Detect service versions  
nmap -O 192.168.1.1                    # OS detection  
nmap -A 192.168.1.1                    # Aggressive scan (OS detection, version detection, script scan, traceroute)  
nmap -Pn 192.168.1.1                   # Skip host discovery (assume host is up)  
nmap -sC 192.168.1.1                   # Run default NSE scripts  
nmap -T4 192.168.1.1                   # Faster scan timing template  
nmap --top-ports 100 192.168.1.1       # Scan top 100 most common ports  
nmap -oN scan.txt 192.168.1.1           # Save output in normal format to scan.txt  
nmap -oX scan.xml 192.168.1.1           # Save output in XML format  
nmap -oG scan.gnmap 192.168.1.1         # Save output in grepable format  
nmap -v -oG -                           # Verbose scan with grepable output sent to console (stdout) for parsing or piping to other commands
nmap --script vuln 192.168.1.1          # Run vulnerability detection scripts  
nmap --traceroute 192.168.1.1           # Trace route to target  
nmap -6 2001:db8::1                     # Scan IPv6 address  
nmap -v 192.168.1.1                     # Verbose output  
nmap --reason 192.168.1.1               # Show reason for each reported port state  
nmap --exclude 192.168.1.5              # Exclude target IP from scan  
nmap 192.168.1.0/24                     # Scan entire subnet  
nmap --script "default or safe" 192.168.1.1  # Run default and safe scripts  

 iptables -L -v -n                  # List all IPv4 rules with packet counts, no DNS resolution  
 iptables -L --line-numbers         # Show rules with line numbers for reference or deletion  
 iptables -S                        # Show rules in iptables-save format (for scripting)  
 iptables -A INPUT -p tcp --dport 22 -j ACCEPT      # Allow incoming SSH connections  
 iptables -P INPUT DROP             # Set default policy to DROP for incoming traffic  
 iptables -A INPUT -i lo -j ACCEPT  # Accept all traffic from localhost interface  
 iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT  # Allow established and related connections  
 iptables -A INPUT -p icmp -j ACCEPT               # Allow ping (ICMP)  
 iptables -D INPUT 3                # Delete rule number 3 in INPUT chain  
 iptables -I INPUT 1 -p tcp --dport 80 -j ACCEPT    # Insert HTTP rule at top of INPUT chain  
 iptables -F                        # Flush (delete) all rules in all chains  
 iptables -X                        # Delete all user-defined chains 
 iptables -Z                        # Zero (reset) all packet and byte counters in all chains  
 iptables -N LOGGING                # Create new chain named LOGGING  
 iptables -A INPUT -j LOGGING       # Send packets to LOGGING chain  
 iptables -A LOGGING -m limit --limit 2/min -j LOG --log-prefix "IPTables-Dropped: " --log-level 4  # Log dropped packets  

 iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT  
# Allow incoming packets that are part of already established or related connections, ensuring proper session tracking  

 iptables -A INPUT -i lo -j ACCEPT  
# Allow all traffic on the loopback interface (localhost), necessary for internal system communications  

 iptables -A INPUT -p tcp --dport 22 -j ACCEPT  
# Allow incoming SSH connections on TCP port 22 for remote administration  

 iptables -A INPUT -p tcp --dport 80 -j ACCEPT  
# Allow incoming HTTP web traffic on TCP port 80  

 iptables -A INPUT -p tcp --dport 443 -j ACCEPT  
# Allow incoming HTTPS secure web traffic on TCP port 443  

 iptables -A INPUT -p icmp -j ACCEPT  
# Allow all ICMP packets, enabling ping and network diagnostics  

 iptables -A INPUT -p udp --dport 53 -j ACCEPT  
# Allow DNS queries on UDP port 53, necessary for domain name resolution  

 iptables -A INPUT -p udp --dport 123 -j ACCEPT  
# Allow NTP time synchronization requests on UDP port 123  

 iptables -A INPUT -p tcp --dport 25 -j DROP  
# Drop SMTP mail traffic on TCP port 25 to prevent spam or unauthorized mail relaying  

 iptables -A INPUT -s 203.0.113.45 -j DROP  
# Block all incoming traffic from a specific IP address (example: 203.0.113.45)  

 iptables -A INPUT -p tcp --dport 3306 -s 192.168.1.100 -j ACCEPT  
# Allow MySQL database access on port 3306 only from a trusted IP address (192.168.1.100) 

 iptables -A INPUT -p tcp -s 192.168.1.0/24 --dport 22 -j ACCEPT  
# Allow incoming SSH (port 22) from any IP in the 192.168.1.0/24 subnet (e.g. your internal LAN)

 iptables -A INPUT -p tcp --dport 10000:20000 -j ACCEPT  
# Allow incoming TCP connections on ports 10000 to 20000 (e.g. passive FTP, VoIP, or custom services)

 iptables -A INPUT -p tcp --dport 22 -j LOG --log-prefix "SSH Attempt: "  
# Log every incoming SSH connection attempt (port 22) with the prefix "SSH Attempt:" in syslog

 iptables -A INPUT -p tcp -s 192.168.2.50 --dport 80 -j ACCEPT  
# Allow HTTP (port 80) connections from a specific IP address: 192.168.2.50

 iptables -P INPUT DROP  
# Set default policy for INPUT chain to DROP, blocking all unspecified incoming connections  

 iptables -P FORWARD DROP  
# Set default policy for FORWARD chain to DROP, blocking all packet forwarding by default  

 iptables -P OUTPUT ACCEPT  
# Set default policy for OUTPUT chain to ACCEPT, allowing all outgoing connections  

 iptables -L -v -n  
# List all current iptables rules with packet and byte counters; numeric output (no DNS lookup)  

 iptables -F  
# Flush (delete) all existing iptables rules, clearing the firewall ruleset   


# Saving and restoring rules (without iptables-persistent)
 iptables-save > ~/iptables.rules           # Save current rules to file  
 iptables-restore < ~/iptables.rules        # Restore rules from file  

# Saving and restoring with iptables-persistent
 apt install iptables-persistent            # Install persistent rule saving (asks to save current rules)  
 netfilter-persistent save                  # Save current IPv4 and IPv6 rules to /etc/iptables/rules.v4/.v6  
 netfilter-persistent reload                # Reload saved rules (without reboot)  
 netfilter-persistent flush                 # Flush all rules managed by iptables-persistent  
 iptables-save > /etc/iptables/rules.v4     # Save IPv4 rules to persistent storage (manual) 
 iptables-restore < /etc/iptables/rules.v4  # To manually reload saved rules without rebooting

 nft list ruleset
# Create table and chains with policies
 nft add table inet filter
 nft add chain inet filter input { type filter hook input priority 0 \; policy drop \; }
 nft add chain inet filter forward { type filter hook forward priority 0 \; policy drop \; }
 nft add chain inet filter output { type filter hook output priority 0 \; policy accept \; }

# Create a user-defined chain for logging
 nft add chain inet filter logging { }

# Allow all traffic on loopback interface
 nft add rule inet filter input iif "lo" accept

# Allow established and related connections
 nft add rule inet filter input ct state established,related accept

# Allow ICMP (ping)
 nft add rule inet filter input ip protocol icmp accept

# Allow SSH (TCP port 22)
 nft add rule inet filter input tcp dport 22 accept

# Allow HTTP (TCP port 80)
 nft add rule inet filter input tcp dport 80 accept

# Allow HTTPS (TCP port 443)
 nft add rule inet filter input tcp dport 443 accept

# Allow DNS (UDP port 53)
 nft add rule inet filter input udp dport 53 accept

# Allow NTP (UDP port 123)
 nft add rule inet filter input udp dport 123 accept

# Drop SMTP (TCP port 25)
 nft add rule inet filter input tcp dport 25 drop

# Block specific IP (203.0.113.45)
 nft add rule inet filter input ip saddr 203.0.113.45 drop

# Allow MySQL from trusted IP (TCP port 3306 from 192.168.1.100)
 nft add rule inet filter input ip saddr 192.168.1.100 tcp dport 3306 accept

# Allow SSH from subnet 192.168.1.0/24
 nft add rule inet filter input ip saddr 192.168.1.0/24 tcp dport 22 accept

# Allow TCP ports 10000 to 20000
 nft add rule inet filter input tcp dport 10000-20000 accept

# Allow HTTP from specific IP (192.168.2.50)
 nft add rule inet filter input ip saddr 192.168.2.50 tcp dport 80 accept

# Logging dropped packets with limit 2 per minute
 nft add rule inet filter logging limit rate 2/minute log prefix "NFTables-Dropped: " level info

# Jump to logging chain for packets reaching INPUT chain
 nft add rule inet filter input counter jump logging

# Log every incoming SSH attempt (port 22)
 nft add rule inet filter input tcp dport 22 log prefix "SSH Attempt: " level info

# 4. Flush all rules (equivalent to iptables -F)
 nft flush chain inet filter input
 nft flush chain inet filter forward
 nft flush chain inet filter output
 nft flush chain inet filter logging

# Or delete the whole table to remove all rules/chains
 nft delete table inet filter

# Save current ruleset to file
 nft list ruleset > ~/nftables.rules

# Restore from saved file
 nft -f ~/nftables.rules
```


## 6. Package Management
```bash
apt update                                  # Update package lists from all configured repositories  
apt upgrade                                 # Upgrade all installed packages to the latest version  
apt full-upgrade                            # Upgrade packages including those that require removing others  
apt install curl                            # Install package "curl"  
apt install --reinstall curl                # Reinstall package "curl"  
apt remove nano                             # Remove package "nano" but keep config files  
apt purge nano                              # Remove package "nano" including config files  
apt autoremove                             # Remove automatically installed packages no longer needed  
apt search nginx                            # Search for packages with keyword "nginx"  
apt show nginx                              # Show detailed information about the "nginx" package  
apt list --installed                        # List all installed packages  
apt list --upgradable                       # List all packages with available upgrades  
apt list *keyword*                          # Searching packet by name
apt clean                                  # Clear local repository of retrieved package files  
apt autoclean                              # Remove outdated package files from cache  
apt depends systemd                         # Show package dependencies of "systemd"  
apt rdepends systemd                        # Show reverse dependencies of "systemd"  
apt download git                            # Download the .deb file for "git" without installing  
apt policy firefox                          # Show installed and candidate versions, and repository info for "firefox"  
apt changelog vim                           # Display changelog of "vim" package  
apt edit-sources                            # Open sources.list file for editing repositories  
apt list -a python3                         # List all versions (installed and available) of python3  
apt install -f                             # Fix broken dependencies and install missing packages  
apt-mark hold nginx                        # Prevent "nginx" from being automatically upgraded  
apt-mark unhold nginx                      # Allow "nginx" to be upgraded again  
apt showpkg curl                           # Show detailed info about the package and versions available  
apt build-dep nginx                        # Install all build dependencies for "nginx"  
apt-get source bash                        # Download source code of "bash" package  
apt-get dist-upgrade                      # Upgrade packages, intelligently handling dependencies (older method)  
apt-get autoremove                        # Same as apt autoremove but older command  
apt-get clean                            # Clean cached packages (older command)  
apt-get autoclean                        # Remove obsolete cached packages (older command)  
```

## 7. Disk and Storage Management
### 7.1 Partitioning and Formatting
### 7.2 Mounting and Unmounting
### 7.3 RAID and LVM

## 8. System Monitoring and Performance
### 8.1 Resource Monitoring (CPU, Memory, Disk)
### 8.2 Log Files and System Logs
### 8.3 Performance Tuning

## 9. Shell and Scripting
### 9.1 Shell Basics
### 9.2 Variables and Control Structures
### 9.3 Functions and Scripts
### 9.4 Scheduling Scripts (cron, at)

## 10. Security
### 10.1 Firewall and iptables/nftables
### 10.2 SELinux and AppArmor
### 10.3 SSH and Secure Connections
### 10.4 Encryption and Certificates

## 11. Backup and Recovery
### 11.1 Backup Tools and Methods
### 11.2 Disk Imaging and Cloning
### 11.3 Recovery Procedures

## 12. Virtualization and Containers
### 12.1 Virtual Machines
### 12.2 Docker and Container Management
### 12.3 Kubernetes Basics

## 13. Development Tools
### 13.1 Compilers and Build Tools
### 13.2 Version Control Systems
### 13.3 Debugging Tools

## 14. Miscellaneous
### 14.1 Time and Date Management
### 14.2 Localization and Language Settings
### 14.3 System Shutdown and Reboot
### 14.4 SHELL shortcuts and tricks
```bash
!h                          # will run 'hostnamectl' command (running last command by specifying first letters of last command)
!!                          # run last command
!!                      # run last command with ''
```