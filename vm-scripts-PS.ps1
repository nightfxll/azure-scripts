# Install Remote Access Windows Server role
Install-WindowsFeature RemoteAccess -IncludeManagementTools

# Install Routing role service
Install-WindowsFeature -Name Routing -IncludeManagementTools -IncludeAllSubFeature
Install-WindowsFeature -Name "RSAT-RemoteAccess-Powershell"
Install-RemoteAccess -VpnType RoutingOnly
Gen-NetAdapter | Set-NetIPInterface -Forwarding Enabled