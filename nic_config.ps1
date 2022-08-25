#The purpose of the below commands is to set automate the process of setting an IP address for a new, recently built server.

#Creates a variable that contains the interface index number of the NIC.
#The first half before the pipe provides the NIC details.
#The second half filters out just the unique index interface used to ID the NIC.

$InterfaceIndex = Write-Output (Get-NetIPAddress -InterfaceAlias Ethernet -AddressFamily IPv4 | ForEach-Object -MemberName InterfaceIndex)

#Stops the NIC from being a DHCP client. Without this, it throws out an error "Inconsistent parameters PolicyStore PersistentStore and Dhcp Enabled".

Set-NetIPInterface -InterfaceIndex $InterfaceIndex -Dhcp Disabled

#Sets the new IP address and default gateway.

Set-NetIPAddress -AddressFamily IPv4 -InterfaceIndex $InterfaceIndex -IPAddress 10.0.0.1 -PrefixLength 24 -DefaultGateway 10.0.0.254

#Note to self: Revisit this code Add some pre-checks and error handling, in case some changes need to be forced or ignored.