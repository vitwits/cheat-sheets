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
### 5.1 Network Configuration
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

### 5.2 Network Monitoring and Troubleshooting
```bash
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


### 5.3 Network Services and Daemons

## 6. Package Management
### 6.1 Installing and Removing Packages
### 6.2 Updating and Upgrading
### 6.3 Searching for Packages

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
