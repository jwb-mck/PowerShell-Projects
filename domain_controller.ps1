Install-WindowsFeature AD-Domain-Services
Install-ADDSForest -DomainName development.imcktraining.com

#Prompt for a SafeMode Administrator Password will appear.
#Note to self: Look into adding this as a secure string.