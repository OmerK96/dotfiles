# Wireshark User Configuration (Optional)
Configuring wireshark just requires us to do 1 thing: Allowing us to sniff when we are not root (*so stop writing `sudo wireshark`*).  

**WARNING**: This will allow everyone in the `wireshark` group to sniff. This isn't particulary *bad*, but this can be a security hazard, since it will not ask for a password every time we sniff. 

I am going to assume you just pressed `Enter` when you installed everything, and you pressed `No` at the question wireshark asked you. Let's fix this:
1. Run `sudo dpkg-reconfigure wireshark-common`, and answer `Yes`. This will create the "wireshark" group.
2. Run `sudo adduser $USER wireshark`. This will add your user to the "wireshark" group.
3. Log out of the machine and log in again for the changes to take effect.