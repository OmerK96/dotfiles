# IP Command

The command `ip` is the replacement of many linux commands regarding networking. In this document, we will review some of the basic commands of `ip` to allow for easy transition to the program.

## Ifconfig
Purpose                       | ifconfig                  | ip
----------------------------- | ------------------------- | ---
List all interfaces           | ifconfig                  | ip a
List a specific interface     | ifconfig eth0             | ip a show dev eth0
Change the IP of an interface | ifconfig eth0 192.168.0.1 | ip a add 192.168.0.1/24 dev eth0
Bring an interface down       | ifconfig eth0 down        | ip l set dev eth0 down
Bring an interface up         | ifconfig eth0 up          | ip l set dev eth0 up
Changing the MTU              | ifconfig eth0 mtu 1000    | ip l set dev eth0 mtu 1000

a = (a)ddr
l = (l)ink

## Arp
Purpose                         | arp    | ip
------------------------------- | ------ | ---
See all ARP entries             | arp    | ip n
see all ARP entries, unresolved | arp -n | *IMPOSSIBLE*

n = (n)eigh

## Route
Purpose | route | ip
--- | --- | ---
Show the route table | route | ip r
Adding a route rule | route add -net 192.168.0.1/24 dev eth0 | ip r add 192.168.0.1/24 dev eth0
Deleting a route rule | route del -net 192.168.0.1/24 dev eth0 | ip r del 192.168.0.1/24 dev eth0
Adding a default gateway | route add default gw 192.168.0.254 | ip r add default via 192.168.0.254

r = (r)oute
