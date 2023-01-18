#!/bin/bash

echo "Enter domain to scan:"
read domain
echo "Running subfinder"
subfinder -d $domain > subdomains.txt
echo "Running httprobe"
cat subdomains.txt | httprobe > live_subdomains.txt
echo "Running gau"
cat live_subdomains.txt | gau > endpoints.txt
echo "Running uro"
cat endpoints.txt | uro > passive_endpoints.txt
echo "Greping params"
cat passive_endpoints.txt | grep "\?.\{0,8\}=" > parameters.txt
echo "Done"

#Github links:
#subfinder https://github.com/projectdiscovery/subfinder
#httprobe https://github.com/tomnomnom/httprobe
#gau https://github.com/lc/gau
#uro https://github.com/s0md3v/uro

