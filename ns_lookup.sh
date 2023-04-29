#!/bin/bash

# Turns off displaying to output of commands
exec 3>&1 >/dev/null

# Requests the user to input a target domain and saves it as the value of the $domain variable
read -p "Enter domain to perform recon: " domain

# Perform a txt lookup on the target domain, output the results to results.txt
dig +short txt $domain >> result.txt

# Perform a mx lookup on the target domain, output the results to results.txt
dig +short mx $domain >> result.txt

# Perform a ns lookup on the target domain, output the results to results.txt
dig +short ns $domain >> result.txt

# Restore output to the console
exec 1>&3
echo "Results saved to result.txt"
