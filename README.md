# nmap-script-enhancements
Custom Nmap NSE scripts for TCP service detection and HTTP cookie security analysis
# Nmap NSE Script Enhancements
Project Overview
This project demonstrates enhancements to custom Nmap Scripting Engine (NSE) scripts using Lua.
Scripts
1. TCP Port Information
Displays the target host, TCP port number, protocol, and port state.
2. Enhanced TCP Port Information
Adds detected service-name information to the original TCP port script.
3. HTTP Header Information
Retrieves basic HTTP response information, including status, server, and date headers.
4. Enhanced HTTP Cookie Security Analysis
Checks HTTP response cookies for the Secure, HttpOnly, and SameSite attributes.
Requirements
- Nmap
- Nmap Scripting Engine
- Lua support provided by Nmap
Testing
Test the scripts only against localhost or systems for which you have authorization.
Example:
`sudo nmap -sV -p 8000 --script ./tcp-port-info-enhanced.nse 127.0.0.1`
Author
Sanchali Shastri
