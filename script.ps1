# Check SEHOP setting
$seh = Get-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\SubSystems" | Select-Object -ExpandProperty Windows
if ($seh -match "SehOn") {
    Write-Output "SEHOP is Enabled"
} else {
    Write-Output "SEHOP is Not Enabled"
    # Enable SEHOP (requires restart)
    $seh = $seh -replace "SehOn", "SehOn"
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\SubSystems" -Name Windows -Value $seh
    Write-Output "SEHOP has been Enabled. Restart required."
}
# Check NetBT NodeType configuration
$netbt = Get-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\NetBT\Parameters" | Select-Object -ExpandProperty NodeType
if ($netbt -eq 0) {
    Write-Output "NetBT NodeType is set to P-node"
} else {
    Write-Output "NetBT NodeType is not set to P-node"
    # Set NetBT NodeType to P-node (0x2)
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\NetBT\Parameters" -Name NodeType -Value 0
    Write-Output "NetBT NodeType has been set to P-node."
}
# Check WDigest Authentication setting
$wdigest = Get-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\WDigest" | Select-Object -ExpandProperty UseLogonCredential
if ($wdigest -eq 0) {
    Write-Output "WDigest Authentication is Disabled"
} else {
    Write-Output "WDigest Authentication is Enabled"
    # Disable WDigest Authentication
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\WDigest" -Name UseLogonCredential -Value 0
    Write-Output "WDigest Authentication has been Disabled."
}
# Check AutoAdminLogon setting
$autoAdminLogon = Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" | Select-Object -ExpandProperty AutoAdminLogon
if ($autoAdminLogon -eq "0") {
    Write-Output "AutoAdminLogon is Disabled"
} else {
    Write-Output "AutoAdminLogon is Enabled"
    # Disable AutoAdminLogon
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" -Name AutoAdminLogon -Value "0"
    Write-Output "AutoAdminLogon has been Disabled."
}
# Check IP Source Routing Protection Level for IPv6
$ipSourceRoutingIPv6 = Get-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\TCPIP6\Parameters" | Select-Object -ExpandProperty DisableIPSourceRouting
if ($ipSourceRoutingIPv6 -eq 2) {
    Write-Output "IP Source Routing Protection Level for IPv6 is set to Highest protection"
} else {
    Write-Output "IP Source Routing Protection Level for IPv6 is not set to Highest protection"
    # Set IP Source Routing Protection Level for IPv6 to Highest protection
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\TCPIP6\Parameters" -Name DisableIPSourceRouting -Value 2
    Write-Output "IP Source Routing Protection Level for IPv6 has been set to Highest protection."
}
# Check IP Source Routing Protection Level for IPv4
$ipSourceRoutingIPv4 = Get-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\TCPIP\Parameters" | Select-Object -ExpandProperty DisableIPSourceRouting
if ($ipSourceRoutingIPv4 -eq 2) {
    Write-Output "IP Source Routing Protection Level for IPv4 is set to Highest protection"
} else {
    Write-Output "IP Source Routing Protection Level for IPv4 is not set to Highest protection"
    # Set IP Source Routing Protection Level for IPv4 to Highest protection
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\TCPIP\Parameters" -Name DisableIPSourceRouting -Value 2
    Write-Output "IP Source Routing Protection Level for IPv4 has been set to Highest protection."
}
# Check if dial-up password saving is prevented
$dialUpPassword = Get-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Network Connections" | Select-Object -ExpandProperty SavePassword
if ($dialUpPassword -eq 0) {
    Write-Output "Dial-up password saving is prevented"
} else {
    Write-Output "Dial-up password saving is not prevented"
    # Prevent saving dial-up password
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Network Connections" -Name SavePassword -Value 0
    Write-Output "Dial-up password saving has been prevented."
}
# Check ICMP Redirects setting
$icmpRedirect = Get-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" | Select-Object -ExpandProperty EnableICMPRedirect
if ($icmpRedirect -eq 0) {
    Write-Output "ICMP Redirects are Disabled"
} else {
    Write-Output "ICMP Redirects are Enabled"
    # Disable ICMP Redirects
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -Name EnableICMPRedirect -Value 0
    Write-Output "ICMP Redirects have been Disabled."
}
# Check KeepAliveTime setting
$keepAliveTime = Get-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" | Select-Object -ExpandProperty KeepAliveTime
if ($keepAliveTime -eq 300000) {
    Write-Output "KeepAliveTime is set to 300,000 milliseconds (5 minutes)"
} else {
    Write-Output "KeepAliveTime is not set to 300,000 milliseconds"
    # Set KeepAliveTime to 300,000 milliseconds (5 minutes)
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -Name KeepAliveTime -Value 300000
    Write-Output "KeepAliveTime has been set to 300,000 milliseconds (5 minutes)."
}
# Check NoNameReleaseOnDemand setting
$noNameReleaseOnDemand = Get-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\NetBT\Parameters" | Select-Object -ExpandProperty NoNameReleaseOnDemand
if ($noNameReleaseOnDemand -eq 1) {
    Write-Output "NoNameReleaseOnDemand is Enabled"
} else {
    Write-Output "NoNameReleaseOnDemand is Not Enabled"
    # Enable NoNameReleaseOnDemand
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\NetBT\Parameters" -Name NoNameReleaseOnDemand -Value 1
    Write-Output "NoNameReleaseOnDemand has been Enabled."
}
# Check PerformRouterDiscovery setting
$performRouterDiscovery = Get-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" | Select-Object -ExpandProperty PerformRouterDiscovery
if ($performRouterDiscovery -eq 0) {
    Write-Output "IRDP for Default Gateway detection is Disabled"
} else {
    Write-Output "IRDP for Default Gateway detection is Enabled"
    # Disable IRDP
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -Name PerformRouterDiscovery -Value 0
    Write-Output "IRDP for Default Gateway detection has been Disabled."
}
# Check Safe DLL Search Mode setting
$safeDllSearchMode = Get-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\SafeDllSearchMode" | Select-Object -ExpandProperty SafeDllSearchMode
if ($safeDllSearchMode -eq 1) {
    Write-Output "Safe DLL Search Mode is Enabled"
} else {
    Write-Output "Safe DLL Search Mode is Not Enabled"
    # Enable Safe DLL Search Mode
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\SafeDllSearchMode" -Name SafeDllSearchMode -Value 1
    Write-Output "Safe DLL Search Mode has been Enabled."
}
# Check Screen Saver Grace Period setting
$screenSaverGracePeriod = Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Screensavers\ScreenSaverGracePeriod" | Select-Object -ExpandProperty ScreenSaverGracePeriod
if ($screenSaverGracePeriod -le 5) {
    Write-Output "Screen Saver Grace Period is set to 5 or fewer seconds"
} else {
    Write-Output "Screen Saver Grace Period is not set to 5 or fewer seconds"
    # Set Screen Saver Grace Period to 5 seconds
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Screensavers\ScreenSaverGracePeriod" -Name ScreenSaverGracePeriod -Value 5
    Write-Output "Screen Saver Grace Period has been set to 5 seconds."
}
# Check TcpMaxDataRetransmissions for IPv6
$tcpMaxDataRetransmissionsIPv6 = Get-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\TCPIP6\Parameters" | Select-Object -ExpandProperty TcpMaxDataRetransmissions
if ($tcpMaxDataRetransmissionsIPv6 -eq 3) {
    Write-Output "TcpMaxDataRetransmissions for IPv6 is set to 3"
} else {
    Write-Output "TcpMaxDataRetransmissions for IPv6 is not set to 3"
    # Set TcpMaxDataRetransmissions for IPv6 to 3
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\TCPIP6\Parameters" -Name TcpMaxDataRetransmissions -Value 3
    Write-Output "TcpMaxDataRetransmissions for IPv6 has been set to 3."
}
# Check TcpMaxDataRetransmissions for IPv4
$tcpMaxDataRetransmissionsIPv4 = Get-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\TCPIP\Parameters" | Select-Object -ExpandProperty TcpMaxDataRetransmissions
if ($tcpMaxDataRetransmissionsIPv4 -eq 3) {
    Write-Output "TcpMaxDataRetransmissions for IPv4 is set to 3"
} else {
    Write-Output "TcpMaxDataRetransmissions for IPv4 is not set to 3"
    # Set TcpMaxDataRetransmissions for IPv4 to 3
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\TCPIP\Parameters" -Name TcpMaxDataRetransmissions -Value 3
    Write-Output "TcpMaxDataRetransmissions for IPv4 has been set to 3."
}
# Check Warning Level for Security Event Log
$warningLevel = Get-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Eventlog\Security" | Select-Object -ExpandProperty MaxSize
if ($warningLevel -le 90) {
    Write-Output "Warning Level for Security Event Log is set to 90% or less"
} else {
    Write-Output "Warning Level for Security Event Log is not set to 90% or less"
    # Set Warning Level for Security Event Log to 90%
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Eventlog\Security" -Name MaxSize -Value 1024
    Write-Output "Warning Level for Security Event Log has been set to 90% or less."
}
# Check DNS over HTTPS (DoH) setting
$dnsDoH = Get-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DNS" | Select-Object -ExpandProperty EnableDNSOverHTTPS
if ($dnsDoH -eq 1) {
    Write-Output "DNS over HTTPS (DoH) is Enabled"
} else {
    Write-Output "DNS over HTTPS (DoH) is Not Enabled"
    # Enable DNS over HTTPS (DoH)
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DNS" -Name EnableDNSOverHTTPS -Value 1
    Write-Output "DNS over HTTPS (DoH) has been Enabled."
}
# Check Font Providers setting
$fontProviders = Get-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Fonts" | Select-Object -ExpandProperty EnableFontProviders
if ($fontProviders -eq 0) {
    Write-Output "Font Providers is Disabled"
} else {
    Write-Output "Font Providers is Enabled"
    # Disable Font Providers
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Fonts" -Name EnableFontProviders -Value 0
    Write-Output "Font Providers has been Disabled."
}
# Check Insecure Guest Logons setting
$insecureGuestLogons = Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" | Select-Object -ExpandProperty EnableGuestLogon
if ($insecureGuestLogons -eq 0) {
    Write-Output "Insecure Guest Logons are Disabled"
} else {
    Write-Output "Insecure Guest Logons are Enabled"
    # Disable Insecure Guest Logons
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name EnableGuestLogon -Value 0
    Write-Output "Insecure Guest Logons have been Disabled."
}
# Check Mapper I/O (LLTDIO) Driver setting
$lltdio = Get-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\LLTDIO" | Select-Object -ExpandProperty Start
if ($lltdio -eq 4) {
    Write-Output "LLTDIO Driver is Disabled"
} else {
    Write-Output "LLTDIO Driver is Enabled"
    # Disable LLTDIO Driver
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\LLTDIO" -Name Start -Value 4
    Write-Output "LLTDIO Driver has been Disabled."
}
# Check Responder (RSPNDR) Driver setting
$rspndr = Get-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\RSPNDR" | Select-Object -ExpandProperty Start
if ($rspndr -eq 4) {
    Write-Output "RSPNDR Driver is Disabled"
} else {
    Write-Output "RSPNDR Driver is Enabled"
    # Disable RSPNDR Driver
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\RSPNDR" -Name Start -Value 4
    Write-Output "RSPNDR Driver has been Disabled."
}
# Check Microsoft Peer-to-Peer Networking Services setting
$peerToPeer = Get-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\PeerName" | Select-Object -ExpandProperty Start
if ($peerToPeer -eq 4) {
    Write-Output "Microsoft Peer-to-Peer Networking Services is Disabled"
} else {
    Write-Output "Microsoft Peer-to-Peer Networking Services is Enabled"
    # Disable Microsoft Peer-to-Peer Networking Services
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\PeerName" -Name Start -Value 4
    Write-Output "Microsoft Peer-to-Peer Networking Services has been Disabled."
}
# Check Network Bridge Installation setting
$networkBridge = Get-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Network Connections" | Select-Object -ExpandProperty ProhibitNetworkBridge
if ($networkBridge -eq 1) {
    Write-Output "Network Bridge Installation is Prohibited"
} else {
    Write-Output "Network Bridge Installation is Allowed"
    # Prohibit Network Bridge Installation
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Network Connections" -Name ProhibitNetworkBridge -Value 1
    Write-Output "Network Bridge Installation has been Prohibited."
}
# Check Internet Connection Sharing setting
$internetConnectionSharing = Get-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Network Connections" | Select-Object -ExpandProperty ProhibitInternetConnectionSharing
if ($internetConnectionSharing -eq 1) {
    Write-Output "Internet Connection Sharing is Prohibited"
} else {
    Write-Output "Internet Connection Sharing is Allowed"
    # Prohibit Internet Connection Sharing
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Network Connections" -Name ProhibitInternetConnectionSharing -Value 1
    Write-Output "Internet Connection Sharing has been Prohibited."
}
# Check Hardened UNC Paths setting
$hardenedUncPaths = Get-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\NetworkProvider\HardenedPaths" | Select-Object -ExpandProperty RequireMutualAuthentication
if ($hardenedUncPaths -eq 1) {
    Write-Output "Hardened UNC Paths is Enabled with Mutual Authentication, Integrity, and Privacy"
} else {
    Write-Output "Hardened UNC Paths is Not Fully Configured"
    # Enable Hardened UNC Paths
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\NetworkProvider\HardenedPaths" -Name RequireMutualAuthentication -Value 1
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\NetworkProvider\HardenedPaths" -Name RequireIntegrity -Value 1
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\NetworkProvider\HardenedPaths" -Name RequirePrivacy -Value 1
    Write-Output "Hardened UNC Paths has been Enabled with Mutual Authentication, Integrity, and Privacy."
}
# Check IPv6 DisabledComponents setting
$disabledComponents = Get-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\TCPIP6\Parameters" | Select-Object -ExpandProperty DisabledComponents
if ($disabledComponents -eq 255) {
    Write-Output "IPv6 is Disabled"
} else {
    Write-Output "IPv6 is Not Disabled"
    # Disable IPv6
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\TCPIP6\Parameters" -Name DisabledComponents -Value 255
    Write-Output "IPv6 has been Disabled."
}
# Check Windows Connect Now setting
$wcnSetting = Get-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Wcn" | Select-Object -ExpandProperty EnableWcn
if ($wcnSetting -eq 0) {
    Write-Output "Windows Connect Now configuration is Disabled"
} else {
    Write-Output "Windows Connect Now configuration is Enabled"
    # Disable Windows Connect Now configuration
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Wcn" -Name EnableWcn -Value 0
    Write-Output "Windows Connect Now configuration has been Disabled."
}
# Check Prohibit Access to Windows Connect Now Wizards setting
$wcnWizardAccess = Get-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Wcn" | Select-Object -ExpandProperty ProhibitWcnWizards
if ($wcnWizardAccess -eq 1) {
    Write-Output "Access to Windows Connect Now Wizards is Prohibited"
} else {
    Write-Output "Access to Windows Connect Now Wizards is Allowed"
    # Prohibit access to Windows Connect Now wizards
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Wcn" -Name ProhibitWcnWizards -Value 1
    Write-Output "Access to Windows Connect Now Wizards has been Prohibited."
}
# Check Number of Simultaneous Connections setting
$maxConnections = Get-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Network Connections" | Select-Object -ExpandProperty MaxConnections
if ($maxConnections -eq 3) {
    Write-Output "Number of Simultaneous Connections is set to 3"
} else {
    Write-Output "Number of Simultaneous Connections is not set to 3"
    # Set Number of Simultaneous Connections to 3
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Network Connections" -Name MaxConnections -Value 3
    Write-Output "Number of Simultaneous Connections has been set to 3."
}
# Check Automatic Connection to Suggested Hotspots setting
$autoConnectHotspots = Get-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WcmSvc\wifinetworkmanager" | Select-Object -ExpandProperty AutoConnectToOpenHotspots
if ($autoConnectHotspots -eq 0) {
    Write-Output "Automatic connection to suggested open hotspots is Disabled"
} else {
    Write-Output "Automatic connection to suggested open hotspots is Enabled"
    # Disable automatic connection to suggested open hotspots
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WcmSvc\wifinetworkmanager" -Name AutoConnectToOpenHotspots -Value 0
    Write-Output "Automatic connection to suggested open hotspots has been Disabled."
}
# Check Print Spooler Client Connections setting
$printSpoolerConnections = Get-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Print" | Select-Object -ExpandProperty EnableClientConnections
if ($printSpoolerConnections -eq 0) {
    Write-Output "Print Spooler client connections are Disabled"
} else {
    Write-Output "Print Spooler client connections are Enabled"
    # Disable Print Spooler client connections
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Print" -Name EnableClientConnections -Value 0
    Write-Output "Print Spooler client connections have been Disabled."
}
# Check Redirection Guard setting
$redirectionGuard = Get-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\RedirectionGuard" | Select-Object -ExpandProperty EnableRedirectionGuard
if ($redirectionGuard -eq 1) {
    Write-Output "Redirection Guard is Enabled"
} else {
    Write-Output "Redirection Guard is Not Enabled"
    # Enable Redirection Guard
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\RedirectionGuard" -Name EnableRedirectionGuard -Value 1
    Write-Output "Redirection Guard has been Enabled."
}
# Check RPC Protocol for Outgoing Connections setting
$rpcProtocol = Get-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\RPC" | Select-Object -ExpandProperty RpcProtocol
if ($rpcProtocol -eq "TCP") {
    Write-Output "RPC Protocol for Outgoing Connections is set to TCP"
} else {
    Write-Output "RPC Protocol for Outgoing Connections is not set to TCP"
    # Set RPC Protocol for Outgoing Connections to TCP
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\RPC" -Name RpcProtocol -Value "TCP"
    Write-Output "RPC Protocol for Outgoing Connections has been set to TCP."
}
# Check RPC Authentication for Outgoing Connections setting
$rpcAuthentication = Get-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\RPC" | Select-Object -ExpandProperty RpcAuthentication
if ($rpcAuthentication -eq "Default") {
    Write-Output "RPC Authentication for Outgoing Connections is set to Default"
} else {
    Write-Output "RPC Authentication for Outgoing Connections is not set to Default"
    # Set RPC Authentication for Outgoing Connections to Default
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\RPC" -Name RpcAuthentication -Value "Default"
    Write-Output "RPC Authentication for Outgoing Connections has been set to Default."
}
# Check RPC Protocols for Incoming Connections setting
$rpcListenerProtocol = Get-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\RPC" | Select-Object -ExpandProperty RpcListenerProtocol
if ($rpcListenerProtocol -eq "TCP") {
    Write-Output "RPC Protocol for Incoming Connections is set to TCP"
} else {
    Write-Output "RPC Protocol for Incoming Connections is not set to TCP"
    # Set RPC Protocol for Incoming Connections to TCP
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\RPC" -Name RpcListenerProtocol -Value "TCP"
    Write-Output "RPC Protocol for Incoming Connections has been set to TCP."
}
# Check RPC Authentication Protocol for Incoming Connections setting
$rpcListenerAuth = Get-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\RPC" | Select-Object -ExpandProperty RpcListenerAuth
if ($rpcListenerAuth -eq "Negotiate") {
    Write-Output "RPC Authentication Protocol for Incoming Connections is set to Negotiate"
} else {
    Write-Output "RPC Authentication Protocol for Incoming Connections is not set to Negotiate"
    # Set RPC Authentication Protocol for Incoming Connections to Negotiate
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\RPC" -Name RpcListenerAuth -Value "Negotiate"
    Write-Output "RPC Authentication Protocol for Incoming Connections has been set to Negotiate."
}
# Check RPC over TCP Port setting
$rpcPort = Get-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\RPC" | Select-Object -ExpandProperty RpcPort
if ($rpcPort -eq 0) {
    Write-Output "RPC over TCP Port is set to 0"
} else {
    Write-Output "RPC over TCP Port is not set to 0"
    # Set RPC over TCP Port to 0
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\RPC" -Name RpcPort -Value 0
    Write-Output "RPC over TCP Port has been set to 0."
}
# Check Print Driver Installation Limit setting
$printDriverInstall = Get-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Printers" | Select-Object -ExpandProperty LimitPrintDriverInstallation
if ($printDriverInstall -eq 1) {
    Write-Output "Print Driver Installation is Limited to Administrators"
} else {
    Write-Output "Print Driver Installation is not Limited to Administrators"
    # Limit Print Driver Installation to Administrators
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Printers" -Name LimitPrintDriverInstallation -Value 1
    Write-Output "Print Driver Installation has been Limited to Administrators."
}
# Check Queue-Specific Files setting
$queueSpecificFiles = Get-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Print" | Select-Object -ExpandProperty QueueSpecificFiles
if ($queueSpecificFiles -eq "Color profiles") {
    Write-Output "Queue-Specific Files are Limited to Color Profiles"
} else {
    Write-Output "Queue-Specific Files are not Limited to Color Profiles"
    # Limit Queue-Specific Files to Color Profiles
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Print" -Name QueueSpecificFiles -Value "Color profiles"
    Write-Output "Queue-Specific Files have been Limited to Color Profiles."
}
# Check Point and Print Restrictions for New Connections setting
$printRestrictionsNew = Get-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Printers" | Select-Object -ExpandProperty PointAndPrintRestrictionsNew
if ($printRestrictionsNew -eq "Show warning and elevation prompt") {
    Write-Output "Point and Print Restrictions for New Connections are set to Show Warning and Elevation Prompt"
} else {
    Write-Output "Point and Print Restrictions for New Connections are not set correctly"
    # Set Point and Print Restrictions for New Connections
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Printers" -Name PointAndPrintRestrictionsNew -Value "Show warning and elevation prompt"
    Write-Output "Point and Print Restrictions for New Connections have been set to Show Warning and Elevation Prompt."
}
# Check Point and Print Restrictions for Existing Connections setting
$printRestrictionsUpdate = Get-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Printers" | Select-Object -ExpandProperty PointAndPrintRestrictionsUpdate
if ($printRestrictionsUpdate -eq "Show warning and elevation prompt") {
    Write-Output "Point and Print Restrictions for Existing Connections are set to Show Warning and Elevation Prompt"
} else {
    Write-Output "Point and Print Restrictions for Existing Connections are not set correctly"
    # Set Point and Print Restrictions for Existing Connections
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Printers" -Name PointAndPrintRestrictionsUpdate -Value "Show warning and elevation prompt"
    Write-Output "Point and Print Restrictions for Existing Connections have been set to Show Warning and Elevation Prompt."
}
# Check Network Usage Notifications setting
$networkUsageNotifications = Get-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Network Connections" | Select-Object -ExpandProperty TurnOffNotifications
if ($networkUsageNotifications -eq 1) {
    Write-Output "Network Usage Notifications are Turned Off"
} else {
    Write-Output "Network Usage Notifications are not Turned Off"
    # Turn Off Network Usage Notifications
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Network Connections" -Name TurnOffNotifications -Value 1
    Write-Output "Network Usage Notifications have been Turned Off."
}
# Check if Personalized Website Recommendations are removed from Start Menu
$startMenuRecommendations = Get-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer" | Select-Object -ExpandProperty DisableWebSearch
if ($startMenuRecommendations -eq 1) {
    Write-Output "Personalized Website Recommendations are removed from Start Menu"
} else {
    Write-Output "Personalized Website Recommendations are not removed from Start Menu"
    # Remove Personalized Website Recommendations from Start Menu
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer" -Name DisableWebSearch -Value 1
    Write-Output "Personalized Website Recommendations have been removed from Start Menu."
}
# Check if Command Line is included in Process Creation Events
$processCreationEvents = Get-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AdvancedAudit" | Select-Object -ExpandProperty IncludeCommandLine
if ($processCreationEvents -eq 1) {
    Write-Output "Command Line is included in Process Creation Events"
} else {
    Write-Output "Command Line is not included in Process Creation Events"
    # Include Command Line in Process Creation Events
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AdvancedAudit" -Name IncludeCommandLine -Value 1
    Write-Output "Command Line has been included in Process Creation Events."
}
# Check Encryption Oracle Remediation setting
$encryptionOracle = Get-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Cryptography\WinTrust\Config" | Select-Object -ExpandProperty EncryptionOracleRemediation
if ($encryptionOracle -eq 2) {
    Write-Output "Encryption Oracle Remediation is set to Force Updated Clients"
} else {
    Write-Output "Encryption Oracle Remediation is not set to Force Updated Clients"
    # Set Encryption Oracle Remediation to Force Updated Clients
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Cryptography\WinTrust\Config" -Name EncryptionOracleRemediation -Value 2
    Write-Output "Encryption Oracle Remediation has been set to Force Updated Clients."
}
# Check Remote Host Delegation of Non-Exportable Credentials
$remoteDelegation = Get-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Kerberos\Parameters" | Select-Object -ExpandProperty AllowDelegationOfNonExportableCredentials
if ($remoteDelegation -eq 1) {
    Write-Output "Remote Host allows delegation of non-exportable credentials"
} else {
    Write-Output "Remote Host does not allow delegation of non-exportable credentials"
    # Allow delegation of non-exportable credentials
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Kerberos\Parameters" -Name AllowDelegationOfNonExportableCredentials -Value 1
    Write-Output "Remote Host has been configured to allow delegation of non-exportable credentials."
}
# Check Virtualization-Based Security setting
$virtualizationSecurity = Get-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\DeviceGuard" | Select-Object -ExpandProperty EnableVirtualizationBasedSecurity
if ($virtualizationSecurity -eq 1) {
    Write-Output "Virtualization-Based Security is Enabled"
} else {
    Write-Output "Virtualization-Based Security is not Enabled"
    # Enable Virtualization-Based Security
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\DeviceGuard" -Name EnableVirtualizationBasedSecurity -Value 1
    Write-Output "Virtualization-Based Security has been Enabled."
}
# Check Platform Security Level setting
$platformSecurity = Get-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\DeviceGuard" | Select-Object -ExpandProperty PlatformSecurityLevel
if ($platformSecurity -eq 2) {
    Write-Output "Platform Security Level is set to Secure Boot or higher"
} else {
    Write-Output "Platform Security Level is not set to Secure Boot or higher"
    # Set Platform Security Level to Secure Boot or higher
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\DeviceGuard" -Name PlatformSecurityLevel -Value 2
    Write-Output "Platform Security Level has been set to Secure Boot or higher."
}
# Check Virtualization-Based Protection of Code Integrity setting
$codeIntegrityProtection = Get-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\DeviceGuard" | Select-Object -ExpandProperty CodeIntegrityProtection
if ($codeIntegrityProtection -eq 1) {
    Write-Output "Virtualization-Based Protection of Code Integrity is Enabled with UEFI lock"
} else {
    Write-Output "Virtualization-Based Protection of Code Integrity is not Enabled with UEFI lock"
    # Enable Virtualization-Based Protection of Code Integrity with UEFI lock
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\DeviceGuard" -Name CodeIntegrityProtection -Value 1
    Write-Output "Virtualization-Based Protection of Code Integrity has been Enabled with UEFI lock."
}
# Check UEFI Memory Attributes Table setting
$uefiMemoryAttributes = Get-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\DeviceGuard" | Select-Object -ExpandProperty UEFI_MemoryAttributes
if ($uefiMemoryAttributes -eq 1) {
    Write-Output "UEFI Memory Attributes Table is Required (True)"
} else {
    Write-Output "UEFI Memory Attributes Table is not Required (False)"
    # Require UEFI Memory Attributes Table
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\DeviceGuard" -Name UEFI_MemoryAttributes -Value 1
    Write-Output "UEFI Memory Attributes Table has been set to Required (True)."
}
# Check Credential Guard Configuration setting
$credentialGuard = Get-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\DeviceGuard" | Select-Object -ExpandProperty CredentialGuard
if ($credentialGuard -eq 1) {
    Write-Output "Credential Guard is Enabled with UEFI lock"
} else {
    Write-Output "Credential Guard is not Enabled with UEFI lock"
    # Enable Credential Guard with UEFI lock
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\DeviceGuard" -Name CredentialGuard -Value 1
    Write-Output "Credential Guard has been Enabled with UEFI lock."
}
# Check Secure Launch Configuration setting
$secureLaunch = Get-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\DeviceGuard" | Select-Object -ExpandProperty SecureLaunch
if ($secureLaunch -eq 1) {
    Write-Output "Secure Launch Configuration is Enabled"
} else {
    Write-Output "Secure Launch Configuration is not Enabled"
    # Enable Secure Launch Configuration
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\DeviceGuard" -Name SecureLaunch -Value 1
    Write-Output "Secure Launch Configuration has been Enabled."
}
# Check Kernel-mode Hardware-enforced Stack Protection setting
$stackProtection = Get-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\DeviceGuard" | Select-Object -ExpandProperty StackProtection
if ($stackProtection -eq 1) {
    Write-Output "Kernel-mode Hardware-enforced Stack Protection is Enabled in enforcement mode"
} else {
    Write-Output "Kernel-mode Hardware-enforced Stack Protection is not Enabled in enforcement mode"
    # Enable Kernel-mode Hardware-enforced Stack Protection in enforcement mode
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\DeviceGuard" -Name StackProtection -Value 1
    Write-Output "Kernel-mode Hardware-enforced Stack Protection has been Enabled in enforcement mode."
}
# Check Prevent Installation of Devices setting
$deviceIDs = Get-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeviceInstall\Restrictions" | Select-Object -ExpandProperty DenyDeviceIDs
if ($deviceIDs -contains "PCI\CC_0C0A") {
    Write-Output "Prevent Installation of Devices with ID PCI\CC_0C0A is Enabled"
} else {
    Write-Output "Prevent Installation of Devices with ID PCI\CC_0C0A is not Enabled"
    # Prevent Installation of Devices with ID PCI\CC_0C0A
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeviceInstall\Restrictions" -Name DenyDeviceIDs -Value "PCI\CC_0C0A"
    Write-Output "Installation of Devices with ID PCI\CC_0C0A has been Prevented."
}
# Check Prevent Installation of Devices Using Drivers setting
$deviceSetupClasses = Get-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeviceInstall\Restrictions" | Select-Object -ExpandProperty DenyDeviceSetupClasses
if ($deviceSetupClasses) {
    Write-Output "Prevent Installation of Devices Using Drivers for Setup Classes is Enabled"
} else {
    Write-Output "Prevent Installation of Devices Using Drivers for Setup Classes is not Enabled"
    # Prevent Installation of Devices Using Drivers for Setup Classes
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeviceInstall\Restrictions" -Name DenyDeviceSetupClasses -Value 1
    Write-Output "Prevent Installation of Devices Using Drivers for Setup Classes has been Enabled."
}
# Check Prevent Installation of Devices Using Drivers for IEEE 1394 Device Setup Classes
$deviceSetupClasses = Get-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeviceInstall\Restrictions" | Select-Object -ExpandProperty DenyDeviceSetupClasses
if ($deviceSetupClasses -contains "IEEE 1394") {
    Write-Output "Prevent Installation of Devices Using Drivers for IEEE 1394 Device Setup Classes is Enabled"
} else {
    Write-Output "Prevent Installation of Devices Using Drivers for IEEE 1394 Device Setup Classes is not Enabled"
    # Prevent Installation of Devices Using Drivers for IEEE 1394 Device Setup Classes
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeviceInstall\Restrictions" -Name DenyDeviceSetupClasses -Value "IEEE 1394"
    Write-Output "Installation of Devices Using Drivers for IEEE 1394 Device Setup Classes has been Prevented."
}
# Check if Prevent Installation Applies to Matching Devices Already Installed
$applyToInstalled = Get-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeviceInstall\Restrictions" | Select-Object -ExpandProperty ApplyToAlreadyInstalled
if ($applyToInstalled -eq 1) {
    Write-Output "Prevent Installation Applies to Matching Devices Already Installed is Enabled"
} else {
    Write-Output "Prevent Installation Does Not Apply to Matching Devices Already Installed"
    # Enable Prevent Installation Applies to Matching Devices Already Installed
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeviceInstall\Restrictions" -Name ApplyToAlreadyInstalled -Value 1
    Write-Output "Prevent Installation Applies to Matching Devices Already Installed has been Enabled."
}
# Check Prevent Device Metadata Retrieval from the Internet
$deviceMetadata = Get-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeviceMetadata" | Select-Object -ExpandProperty PreventDeviceMetadataRetrieval
if ($deviceMetadata -eq 1) {
    Write-Output "Device Metadata Retrieval from the Internet is Prevented"
} else {
    Write-Output "Device Metadata Retrieval from the Internet is Not Prevented"
    # Prevent Device Metadata Retrieval from the Internet
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeviceMetadata" -Name PreventDeviceMetadataRetrieval -Value 1
    Write-Output "Device Metadata Retrieval from the Internet has been Prevented."
}
# Check Boot-Start Driver Initialization Policy
$bootStartPolicy = Get-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\CriticalDeviceDatabase" | Select-Object -ExpandProperty BootStartDriverPolicy
if ($bootStartPolicy -eq 2) {
    Write-Output "Boot-Start Driver Initialization Policy is set to Good, Unknown, and Bad but Critical"
} else {
    Write-Output "Boot-Start Driver Initialization Policy is not set to Good, Unknown, and Bad but Critical"
    # Set Boot-Start Driver Initialization Policy to Good, Unknown, and Bad but Critical
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\CriticalDeviceDatabase" -Name BootStartDriverPolicy -Value 2
    Write-Output "Boot-Start Driver Initialization Policy has been set to Good, Unknown, and Bad but Critical."
}
# Check Continue Experiences on This Device setting
$continueExperiences = Get-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent" | Select-Object -ExpandProperty DisableCloudContent
if ($continueExperiences -eq 1) {
    Write-Output "Continue Experiences on This Device is Disabled"
} else {
    Write-Output "Continue Experiences on This Device is Not Disabled"
    # Disable Continue Experiences on This Device
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent" -Name DisableCloudContent -Value 1
    Write-Output "Continue Experiences on This Device has been Disabled."
}
# Check if Access to the Store is Turned Off
$storeAccess = Get-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\WindowsStore" | Select-Object -ExpandProperty RemoveWindowsStore
if ($storeAccess -eq 1) {
    Write-Output "Access to the Store is Turned Off"
} else {
    Write-Output "Access to the Store is Not Turned Off"
    # Turn Off Access to the Store
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\WindowsStore" -Name RemoveWindowsStore -Value 1
    Write-Output "Access to the Store has been Turned Off."
}
# Check if Downloading of Print Drivers Over HTTP is Turned Off
$printDriversHttp = Get-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Printers" | Select-Object -ExpandProperty DisableWebPrintDriverDownload
if ($printDriversHttp -eq 1) {
    Write-Output "Downloading of Print Drivers Over HTTP is Turned Off"
} else {
    Write-Output "Downloading of Print Drivers Over HTTP is Not Turned Off"
    # Turn Off Downloading of Print Drivers Over HTTP
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Printers" -Name DisableWebPrintDriverDownload -Value 1
    Write-Output "Downloading of Print Drivers Over HTTP has been Turned Off."
}
# Check if Handwriting Personalization Data Sharing is Turned Off
$handwritingDataSharing = Get-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\TabletPC" | Select-Object -ExpandProperty DisableHandwritingPersonalization
if ($handwritingDataSharing -eq 1) {
    Write-Output "Handwriting Personalization Data Sharing is Turned Off"
} else {
    Write-Output "Handwriting Personalization Data Sharing is Not Turned Off"
    # Turn Off Handwriting Personalization Data Sharing
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\TabletPC" -Name DisableHandwritingPersonalization -Value 1
    Write-Output "Handwriting Personalization Data Sharing has been Turned Off."
}
# Check if Handwriting Recognition Error Reporting is Turned Off
$handwritingErrorReporting = Get-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\TabletPC" | Select-Object -ExpandProperty DisableHandwritingRecognitionErrorReporting
if ($handwritingErrorReporting -eq 1) {
    Write-Output "Handwriting Recognition Error Reporting is Turned Off"
} else {
    Write-Output "Handwriting Recognition Error Reporting is Not Turned Off"
    # Turn Off Handwriting Recognition Error Reporting
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\TabletPC" -Name DisableHandwritingRecognitionErrorReporting -Value 1
    Write-Output "Handwriting Recognition Error Reporting has been Turned Off."
}
# Check if Internet Connection Wizard is Turned Off for Microsoft.com URLs
$internetConnectionWizard = Get-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Internet Connection Wizard" | Select-Object -ExpandProperty DisableInternetConnectionWizard
if ($internetConnectionWizard -eq 1) {
    Write-Output "Internet Connection Wizard is Turned Off for Microsoft.com URLs"
} else {
    Write-Output "Internet Connection Wizard is Not Turned Off for Microsoft.com URLs"
    # Turn Off Internet Connection Wizard for Microsoft.com URLs
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Internet Connection Wizard" -Name DisableInternetConnectionWizard -Value 1
    Write-Output "Internet Connection Wizard has been Turned Off for Microsoft.com URLs."
}
# Check if Internet Download for Web Publishing and Online Ordering Wizards is Turned Off
$webPublishingWizards = Get-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Web" | Select-Object -ExpandProperty DisableWebPublishing
if ($webPublishingWizards -eq 1) {
    Write-Output "Internet Download for Web Publishing and Online Ordering Wizards is Turned Off"
} else {
    Write-Output "Internet Download for Web Publishing and Online Ordering Wizards is Not Turned Off"
    # Turn Off Internet Download for Web Publishing and Online Ordering Wizards
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Web" -Name DisableWebPublishing -Value 1
    Write-Output "Internet Download for Web Publishing and Online Ordering Wizards has been Turned Off."
}
# Check if Printing Over HTTP is Turned Off
$printingOverHttp = Get-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Print" | Select-Object -ExpandProperty DisableHttpPrinting
if ($printingOverHttp -eq 1) {
    Write-Output "Printing Over HTTP is Turned Off"
} else {
    Write-Output "Printing Over HTTP is Not Turned Off"
    # Turn Off Printing Over HTTP
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Print" -Name DisableHttpPrinting -Value 1
    Write-Output "Printing Over HTTP has been Turned Off."
}
# Check if Registration Is Turned Off for Microsoft.com URLs
$registrationOff = Get-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Registration" | Select-Object -ExpandProperty DisableRegistration
if ($registrationOff -eq 1) {
    Write-Output "Registration Is Turned Off for Microsoft.com URLs"
} else {
    Write-Output "Registration Is Not Turned Off for Microsoft.com URLs"
    # Turn Off Registration for Microsoft.com URLs
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Registration" -Name DisableRegistration -Value 1
    Write-Output "Registration has been Turned Off for Microsoft.com URLs."
}
# Check if Search Companion Content File Updates Are Turned Off
$searchCompanionUpdates = Get-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Search" | Select-Object -ExpandProperty DisableSearchCompanionUpdates
if ($searchCompanionUpdates -eq 1) {
    Write-Output "Search Companion Content File Updates Are Turned Off"
} else {
    Write-Output "Search Companion Content File Updates Are Not Turned Off"
    # Turn Off Search Companion Content File Updates
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Search" -Name DisableSearchCompanionUpdates -Value 1
    Write-Output "Search Companion Content File Updates have been Turned Off."
}
# Check if "Order Prints" Picture Task is Turned Off
$orderPrintsTask = Get-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Photo" | Select-Object -ExpandProperty DisableOrderPrints
if ($orderPrintsTask -eq 1) {
    Write-Output "\"Order Prints\" Picture Task is Turned Off"
} else {
    Write-Output "\"Order Prints\" Picture Task is Not Turned Off"
    # Turn Off "Order Prints" Picture Task
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Photo" -Name DisableOrderPrints -Value 1
    Write-Output "\"Order Prints\" Picture Task has been Turned Off."
}
# Check if "Publish to Web" Task for Files and Folders is Turned Off
$publishToWebTask = Get-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer" | Select-Object -ExpandProperty DisablePublishToWeb
if ($publishToWebTask -eq 1) {
    Write-Output "\"Publish to Web\" Task for Files and Folders is Turned Off"
} else {
    Write-Output "\"Publish to Web\" Task for Files and Folders is Not Turned Off"
    # Turn Off "Publish to Web" Task for Files and Folders
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer" -Name DisablePublishToWeb -Value 1
    Write-Output "\"Publish to Web\" Task for Files and Folders has been Turned Off."
}
# Check if Windows Messenger Customer Experience Improvement Program is Turned Off
$messengerCEIP = Get-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Messenger" | Select-Object -ExpandProperty DisableCEIP
if ($messengerCEIP -eq 1) {
    Write-Output "Windows Messenger Customer Experience Improvement Program is Turned Off"
} else {
    Write-Output "Windows Messenger Customer Experience Improvement Program is Not Turned Off"
    # Turn Off Windows Messenger Customer Experience Improvement Program
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Messenger" -Name DisableCEIP -Value 1
    Write-Output "Windows Messenger Customer Experience Improvement Program has been Turned Off."
}
# Check if Windows Customer Experience Improvement Program is Turned Off
$ceip = Get-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Customer Experience Improvement Program" | Select-Object -ExpandProperty CEIP
if ($ceip -eq 1) {
    Write-Output "Windows Customer Experience Improvement Program is Turned Off"
} else {
    Write-Output "Windows Customer Experience Improvement Program is Not Turned Off"
    # Turn Off Windows Customer Experience Improvement Program
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Customer Experience Improvement Program" -Name CEIP -Value 1
    Write-Output "Windows Customer Experience Improvement Program has been Turned Off."
}
# Check if Windows Error Reporting is Turned Off
$errorReporting = Get-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\ErrorReporting" | Select-Object -ExpandProperty DisableErrorReporting
if ($errorReporting -eq 1) {
    Write-Output "Windows Error Reporting is Turned Off"
} else {
    Write-Output "Windows Error Reporting is Not Turned Off"
    # Turn Off Windows Error Reporting
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\ErrorReporting" -Name DisableErrorReporting -Value 1
    Write-Output "Windows Error Reporting has been Turned Off."
}
# Check if Device Authentication Using Certificate is Enabled
$deviceAuthCert = Get-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CredentialProvider\CertAuth" | Select-Object -ExpandProperty EnableCertAuth
if ($deviceAuthCert -eq 1) {
    Write-Output "Device Authentication Using Certificate is Enabled"
} else {
    Write-Output "Device Authentication Using Certificate is Not Enabled"
    # Enable Device Authentication Using Certificate
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CredentialProvider\CertAuth" -Name EnableCertAuth -Value 1
    Write-Output "Device Authentication Using Certificate has been Enabled."
}
# Check Enumeration Policy for External Devices
$enumerationPolicy = Get-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Kernel-DMA" | Select-Object -ExpandProperty EnumPolicy
if ($enumerationPolicy -eq 1) {
    Write-Output "Enumeration Policy for External Devices is Block All"
} else {
    Write-Output "Enumeration Policy for External Devices is Not Block All"
    # Set Enumeration Policy for External Devices to Block All
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Kernel-DMA" -Name EnumPolicy -Value 1
    Write-Output "Enumeration Policy for External Devices has been Set to Block All."
}
# Check if Custom SSPs and APs are Allowed to be Loaded into LSASS
$customSSPs = Get-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\LSA" | Select-Object -ExpandProperty AllowCustomSSPs
if ($customSSPs -eq 0) {
    Write-Output "Custom SSPs and APs Loading into LSASS is Disabled"
} else {
    Write-Output "Custom SSPs and APs Loading into LSASS is Not Disabled"
    # Disable Custom SSPs and APs Loading into LSASS
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\LSA" -Name AllowCustomSSPs -Value 0
    Write-Output "Custom SSPs and APs Loading into LSASS has been Disabled."
}
# Check if LSASS is Configured to Run as a Protected Process
$lsassProtected = Get-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\LSA" | Select-Object -ExpandProperty RunAsProtectedProcess
if ($lsassProtected -eq 1) {
    Write-Output "LSASS is Configured to Run as a Protected Process"
} else {
    Write-Output "LSASS is Not Configured to Run as a Protected Process"
    # Configure LSASS to Run as a Protected Process
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\LSA" -Name RunAsProtectedProcess -Value 1
    Write-Output "LSASS has been Configured to Run as a Protected Process."
}
# Check if Copying of User Input Methods to the System Account for Sign-In is Disallowed
$inputMethods = Get-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" | Select-Object -ExpandProperty DisallowCopyInputMethods
if ($inputMethods -eq 1) {
    Write-Output "Copying of User Input Methods to the System Account for Sign-In is Disallowed"
} else {
    Write-Output "Copying of User Input Methods to the System Account for Sign-In is Allowed"
    # Disallow Copying of User Input Methods to the System Account for Sign-In
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Name DisallowCopyInputMethods -Value 1
    Write-Output "Copying of User Input Methods to the System Account for Sign-In has been Disallowed."
}
# Check if Showing Account Details on Sign-In is Blocked
$accountDetails = Get-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" | Select-Object -ExpandProperty BlockAccountDetails
if ($accountDetails -eq 1) {
    Write-Output "Showing Account Details on Sign-In is Blocked"
} else {
    Write-Output "Showing Account Details on Sign-In is Not Blocked"
    # Block Showing Account Details on Sign-In
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Name BlockAccountDetails -Value 1
    Write-Output "Showing Account Details on Sign-In has been Blocked."
}
# Check if Network Selection UI is Disabled
$networkSelectionUI = Get-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Network" | Select-Object -ExpandProperty DisableNetworkSelectionUI
if ($networkSelectionUI -eq 1) {
    Write-Output "Network Selection UI is Disabled"
} else {
    Write-Output "Network Selection UI is Not Disabled"
    # Disable Network Selection UI
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Network" -Name DisableNetworkSelectionUI -Value 1
    Write-Output "Network Selection UI has been Disabled."
}
# Check if App Notifications on the Lock Screen are Turned Off
$appNotifications = Get-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Notifications" | Select-Object -ExpandProperty DisableLockScreenNotifications
if ($appNotifications -eq 1) {
    Write-Output "App Notifications on the Lock Screen are Turned Off"
} else {
    Write-Output "App Notifications on the Lock Screen are Not Turned Off"
    # Turn Off App Notifications on the Lock Screen
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Notifications" -Name DisableLockScreenNotifications -Value 1
    Write-Output "App Notifications on the Lock Screen have been Turned Off."
}
# Check if Convenience PIN Sign-In is Enabled
$pinSignIn = Get-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CredentialProvider\LocalCredential" | Select-Object -ExpandProperty EnablePINSignIn
if ($pinSignIn -eq 0) {
    Write-Output "Convenience PIN Sign-In is Disabled"
} else {
    Write-Output "Convenience PIN Sign-In is Not Disabled"
    # Disable Convenience PIN Sign-In
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CredentialProvider\LocalCredential" -Name EnablePINSignIn -Value 0
    Write-Output "Convenience PIN Sign-In has been Disabled."
}
# Check if Clipboard Synchronization Across Devices is Allowed
$clipboardSync = Get-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Clipboard" | Select-Object -ExpandProperty AllowClipboardSync
if ($clipboardSync -eq 0) {
    Write-Output "Clipboard Synchronization Across Devices is Disabled"
} else {
    Write-Output "Clipboard Synchronization Across Devices is Not Disabled"
    # Disable Clipboard Synchronization Across Devices
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Clipboard" -Name AllowClipboardSync -Value 0
    Write-Output "Clipboard Synchronization Across Devices has been Disabled."
}
# Check if Upload of User Activities is Allowed
$userActivities = Get-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Activity" | Select-Object -ExpandProperty AllowUploadUserActivities
if ($userActivities -eq 0) {
    Write-Output "Upload of User Activities is Disabled"
} else {
    Write-Output "Upload of User Activities is Not Disabled"
    # Disable Upload of User Activities
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Activity" -Name AllowUploadUserActivities -Value 0
    Write-Output "Upload of User Activities has been Disabled."
}
# Check if Network Connectivity During Connected-Standby (On Battery) is Allowed
$networkOnBattery = Get-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Power" | Select-Object -ExpandProperty AllowNetworkConnectivityBattery
if ($networkOnBattery -eq 0) {
    Write-Output "Network Connectivity During Connected-Standby (On Battery) is Disabled"
} else {
    Write-Output "Network Connectivity During Connected-Standby (On Battery) is Not Disabled"
    # Disable Network Connectivity During Connected-Standby (On Battery)
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Power" -Name AllowNetworkConnectivityBattery -Value 0
    Write-Output "Network Connectivity During Connected-Standby (On Battery) has been Disabled."
}
# Check if Network Connectivity During Connected-Standby (Plugged In) is Allowed
$networkPluggedIn = Get-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Power" | Select-Object -ExpandProperty AllowNetworkConnectivityPluggedIn
if ($networkPluggedIn -eq 0) {
    Write-Output "Network Connectivity During Connected-Standby (Plugged In) is Disabled"
} else {
    Write-Output "Network Connectivity During Connected-Standby (Plugged In) is Not Disabled"
    # Disable Network Connectivity During Connected-Standby (Plugged In)
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Power" -Name AllowNetworkConnectivityPluggedIn -Value 0
    Write-Output "Network Connectivity During Connected-Standby (Plugged In) has been Disabled."
}
# Check if Standby States (S1-S3) When Sleeping (On Battery) is Allowed
$standbyBattery = Get-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Power\Sleep" | Select-Object -ExpandProperty AllowStandbyStatesBattery
if ($standbyBattery -eq 0) {
    Write-Output "Standby States (S1-S3) When Sleeping (On Battery) is Disabled"
} else {
    Write-Output "Standby States (S1-S3) When Sleeping (On Battery) is Not Disabled"
    # Disable Standby States (S1-S3) When Sleeping (On Battery)
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Power\Sleep" -Name AllowStandbyStatesBattery -Value 0
    Write-Output "Standby States (S1-S3) When Sleeping (On Battery) has been Disabled."
}
# Check if Standby States (S1-S3) When Sleeping (Plugged In) is Allowed
$standbyPluggedIn = Get-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Power\Sleep" | Select-Object -ExpandProperty AllowStandbyStatesPluggedIn
if ($standbyPluggedIn -eq 0) {
    Write-Output "Standby States (S1-S3) When Sleeping (Plugged In) is Disabled"
} else {
    Write-Output "Standby States (S1-S3) When Sleeping (Plugged In) is Not Disabled"
    # Disable Standby States (S1-S3) When Sleeping (Plugged In)
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Power\Sleep" -Name AllowStandbyStatesPluggedIn -Value 0
    Write-Output "Standby States (S1-S3) When Sleeping (Plugged In) has been Disabled."
}
# Enable Password Requirement When a Computer Wakes (On Battery)
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System"
$regName = "RequirePasswordOnWakeup"
$regValue = 1

# Check if the setting is enabled
$existingValue = Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue | Select-Object -ExpandProperty RequirePasswordOnWakeup
if ($existingValue -eq $regValue) {
    Write-Output "Password requirement when waking from sleep (on battery) is already Enabled."
} else {
    # Set the value
    Set-ItemProperty -Path $regPath -Name $regName -Value $regValue
    Write-Output "Password requirement when waking from sleep (on battery) has been Enabled."
}
# Enable Password Requirement When a Computer Wakes (Plugged In)
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System"
$regName = "RequirePasswordOnWakeupPluggedIn"
$regValue = 1

# Check if the setting is enabled
$existingValue = Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue | Select-Object -ExpandProperty RequirePasswordOnWakeupPluggedIn
if ($existingValue -eq $regValue) {
    Write-Output "Password requirement when waking from sleep (plugged in) is already Enabled."
} else {
    # Set the value
    Set-ItemProperty -Path $regPath -Name $regName -Value $regValue
    Write-Output "Password requirement when waking from sleep (plugged in) has been Enabled."
}
# Disable Offer Remote Assistance
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Remote Assistance"
$regName = "OfferRemoteAssistance"
$regValue = 0

# Check if the setting is disabled
$existingValue = Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue | Select-Object -ExpandProperty OfferRemoteAssistance
if ($existingValue -eq $regValue) {
    Write-Output "Offer Remote Assistance is already Disabled."
} else {
    # Set the value
    Set-ItemProperty -Path $regPath -Name $regName -Value $regValue
    Write-Output "Offer Remote Assistance has been Disabled."
}
# Disable Solicited Remote Assistance
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Remote Assistance"
$regName = "SolicitedRemoteAssistance"
$regValue = 0

# Check if the setting is disabled
$existingValue = Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue | Select-Object -ExpandProperty SolicitedRemoteAssistance
if ($existingValue -eq $regValue) {
    Write-Output "Solicited Remote Assistance is already Disabled."
} else {
    # Set the value
    Set-ItemProperty -Path $regPath -Name $regName -Value $regValue
    Write-Output "Solicited Remote Assistance has been Disabled."
}
# Enable RPC Endpoint Mapper Client Authentication
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\RPC"
$regName = "EnableRPCClientAuth"
$regValue = 1

# Check if the setting is enabled
$existingValue = Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue | Select-Object -ExpandProperty EnableRPCClientAuth
if ($existingValue -eq $regValue) {
    Write-Output "RPC Endpoint Mapper Client Authentication is already Enabled."
} else {
    # Set the value
    Set-ItemProperty -Path $regPath -Name $regName -Value $regValue
    Write-Output "RPC Endpoint Mapper Client Authentication has been Enabled."
}
# Restrict Unauthenticated RPC Clients
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\RPC"
$regName = "RestrictUnauthenticatedClients"
$regValue = 1

# Check if the setting is enabled
$existingValue = Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue | Select-Object -ExpandProperty RestrictUnauthenticatedClients
if ($existingValue -eq $regValue) {
    Write-Output "Unauthenticated RPC Clients are already Restricted."
} else {
    # Set the value
    Set-ItemProperty -Path $regPath -Name $regName -Value $regValue
    Write-Output "Unauthenticated RPC Clients have been Restricted."
}
# Disable MSDT Interactive Communication with Support Provider
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\ErrorReporting"
$regName = "DisableMSDTInteractive"
$regValue = 1

# Check if the setting is disabled
$existingValue = Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue | Select-Object -ExpandProperty DisableMSDTInteractive
if ($existingValue -eq $regValue) {
    Write-Output "MSDT Interactive Communication with Support Provider is already Disabled."
} else {
    # Set the value
    Set-ItemProperty -Path $regPath -Name $regName -Value $regValue
    Write-Output "MSDT Interactive Communication with Support Provider has been Disabled."
}
# Disable PerfTrack
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Performance"
$regName = "EnablePerfTrack"
$regValue = 0

# Check if PerfTrack is disabled
$existingValue = Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue | Select-Object -ExpandProperty EnablePerfTrack
if ($existingValue -eq $regValue) {
    Write-Output "PerfTrack is already Disabled."
} else {
    # Set the value
    Set-ItemProperty -Path $regPath -Name $regName -Value $regValue
    Write-Output "PerfTrack has been Disabled."
}
# Disable Advertising ID
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo"
$regName = "DisableAdvertisingID"
$regValue = 1

# Check if Advertising ID is disabled
$existingValue = Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue | Select-Object -ExpandProperty DisableAdvertisingID
if ($existingValue -eq $regValue) {
    Write-Output "Advertising ID is already Disabled."
} else {
    # Set the value
    Set-ItemProperty -Path $regPath -Name $regName -Value $regValue
    Write-Output "Advertising ID has been Disabled."
}
# Enable Windows NTP Client
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Time Service\Time Providers"
$regName = "EnableWindowsNTPClient"
$regValue = 1

# Check if Windows NTP Client is enabled
$existingValue = Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue | Select-Object -ExpandProperty EnableWindowsNTPClient
if ($existingValue -eq $regValue) {
    Write-Output "Windows NTP Client is already Enabled."
} else {
    # Set the value
    Set-ItemProperty -Path $regPath -Name $regName -Value $regValue
    Write-Output "Windows NTP Client has been Enabled."
}
# Disable Sharing Application Data Between Users
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy"
$regName = "AllowAppDataSharing"
$regValue = 0

# Check if sharing application data between users is disabled
$existingValue = Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue | Select-Object -ExpandProperty AllowAppDataSharing
if ($existingValue -eq $regValue) {
    Write-Output "Sharing of Application Data Between Users is already Disabled."
} else {
    # Set the value
    Set-ItemProperty -Path $regPath -Name $regName -Value $regValue
    Write-Output "Sharing of Application Data Between Users has been Disabled."
}
# Disable Sharing Application Data Between Users
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy"
$regName = "AllowAppDataSharing"
$regValue = 0

# Check if sharing application data between users is disabled
$existingValue = Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue | Select-Object -ExpandProperty AllowAppDataSharing
if ($existingValue -eq $regValue) {
    Write-Output "Sharing of Application Data Between Users is already Disabled."
} else {
    # Set the value
    Set-ItemProperty -Path $regPath -Name $regName -Value $regValue
    Write-Output "Sharing of Application Data Between Users has been Disabled."
}
# Prevent Non-Admin Users from Installing Packaged Windows Apps
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Installer"
$regName = "AllowNonAdminAppInstall"
$regValue = 0

# Check if non-admin users are prevented from installing packaged apps
$existingValue = Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue | Select-Object -ExpandProperty AllowNonAdminAppInstall
if ($existingValue -eq $regValue) {
    Write-Output "Non-admin users are already prevented from installing packaged apps."
} else {
    # Set the value
    Set-ItemProperty -Path $regPath -Name $regName -Value $regValue
    Write-Output "Non-admin users have been prevented from installing packaged apps."
}
# Disable Voice Activation of Windows Apps While the System is Locked
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Voice"
$regName = "AllowVoiceActivationWhenLocked"
$regValue = 0

# Check if voice activation is disabled
$existingValue = Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue | Select-Object -ExpandProperty AllowVoiceActivationWhenLocked
if ($existingValue -eq $regValue) {
    Write-Output "Voice Activation for Windows Apps While Locked is already Disabled."
} else {
    # Set the value
    Set-ItemProperty -Path $regPath -Name $regName -Value $regValue
    Write-Output "Voice Activation for Windows Apps While Locked has been Disabled."
}
# Enable Microsoft Accounts to be Optional
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Account"
$regName = "MicrosoftAccountsOptional"
$regValue = 1

# Check if Microsoft Accounts are optional
$existingValue = Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue | Select-Object -ExpandProperty MicrosoftAccountsOptional
if ($existingValue -eq $regValue) {
    Write-Output "Microsoft Accounts are already Optional."
} else {
    # Set the value
    Set-ItemProperty -Path $regPath -Name $regName -Value $regValue
    Write-Output "Microsoft Accounts have been set to Optional."
}
# Block Launching Universal Windows Apps with Windows Runtime API Access from Hosted Content
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppRuntime"
$regName = "BlockUniversalApps"
$regValue = 1

# Check if Universal Windows Apps are blocked
$existingValue = Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue | Select-Object -ExpandProperty BlockUniversalApps
if ($existingValue -eq $regValue) {
    Write-Output "Launching Universal Windows Apps from Hosted Content is already Blocked."
} else {
    # Set the value
    Set-ItemProperty -Path $regPath -Name $regName -Value $regValue
    Write-Output "Launching Universal Windows Apps from Hosted Content has been Blocked."
}
# Disable Autoplay for Non-Volume Devices
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AutoplayPolicies"
$regName = "NoAutoplayNonVolumeDevices"
$regValue = 1

# Check if Autoplay is disabled for non-volume devices
$existingValue = Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue | Select-Object -ExpandProperty NoAutoplayNonVolumeDevices
if ($existingValue -eq $regValue) {
    Write-Output "Autoplay for Non-Volume Devices is already Disabled."
} else {
    # Set the value
    Set-ItemProperty -Path $regPath -Name $regName -Value $regValue
    Write-Output "Autoplay for Non-Volume Devices has been Disabled."
}
# Set AutoRun Behavior to Do Not Execute Any Commands
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AutoplayPolicies"
$regName = "DefaultAutoRunBehavior"
$regValue = 0

# Check if AutoRun is set to not execute any commands
$existingValue = Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue | Select-Object -ExpandProperty DefaultAutoRunBehavior
if ($existingValue -eq $regValue) {
    Write-Output "AutoRun is already set to Do Not Execute Any Commands."
} else {
    # Set the value
    Set-ItemProperty -Path $regPath -Name $regName -Value $regValue
    Write-Output "AutoRun has been set to Do Not Execute Any Commands."
}
# Disable Autoplay for All Drives
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AutoplayPolicies"
$regName = "NoAutoplay"
$regValue = 1

# Check if Autoplay is disabled for all drives
$existingValue = Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue | Select-Object -ExpandProperty NoAutoplay
if ($existingValue -eq $regValue) {
    Write-Output "Autoplay for all drives is already Disabled."
} else {
    # Set the value
    Set-ItemProperty -Path $regPath -Name $regName -Value $regValue
    Write-Output "Autoplay for all drives has been Disabled."
}
# Enable Enhanced Anti-Spoofing
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Biometrics"
$regName = "AllowEnhancedAntiSpoofing"
$regValue = 1

# Check if Enhanced Anti-Spoofing is enabled
$existingValue = Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue | Select-Object -ExpandProperty AllowEnhancedAntiSpoofing
if ($existingValue -eq $regValue) {
    Write-Output "Enhanced Anti-Spoofing is already Enabled."
} else {
    # Set the value
    Set-ItemProperty -Path $regPath -Name $regName -Value $regValue
    Write-Output "Enhanced Anti-Spoofing has been Enabled."
}
# Disable Access to BitLocker-Protected Fixed Data Drives from Earlier Versions of Windows
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\FVE"
$regName = "AllowBitLockerFixDataDriveVersion"
$regValue = 0

# Check if access to BitLocker-protected fixed data drives from earlier versions of Windows is disabled
$existingValue = Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue | Select-Object -ExpandProperty AllowBitLockerFixDataDriveVersion
if ($existingValue -eq $regValue) {
    Write-Output "Access to BitLocker-protected fixed data drives from earlier versions of Windows is already Disabled."
} else {
    # Set the value
    Set-ItemProperty -Path $regPath -Name $regName -Value $regValue
    Write-Output "Access to BitLocker-protected fixed data drives from earlier versions of Windows has been Disabled."
}
# Enable Recovery Options for BitLocker-Protected Fixed Drives
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\FVE"
$regName = "RecoveryOptions"
$regValue = 1

# Check if recovery options are enabled
$existingValue = Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue | Select-Object -ExpandProperty RecoveryOptions
if ($existingValue -eq $regValue) {
    Write-Output "BitLocker recovery options are already Enabled."
} else {
    # Set the value
    Set-ItemProperty -Path $regPath -Name $regName -Value $regValue
    Write-Output "BitLocker recovery options have been Enabled."
}
# Enable Data Recovery Agent for BitLocker-Protected Fixed Drives
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\FVE"
$regName = "AllowDataRecoveryAgent"
$regValue = 1

# Check if Data Recovery Agent is allowed
$existingValue = Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue | Select-Object -ExpandProperty AllowDataRecoveryAgent
if ($existingValue -eq $regValue) {
    Write-Output "Data Recovery Agent is already Allowed for BitLocker-protected fixed drives."
} else {
    # Set the value
    Set-ItemProperty -Path $regPath -Name $regName -Value $regValue
    Write-Output "Data Recovery Agent has been Allowed for BitLocker-protected fixed drives."
}
# Enable Recovery Password with 48-Digit or Higher for BitLocker-Protected Fixed Drives
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\FVE"
$regName = "RecoveryPasswordLength"
$regValue = 48

# Check if the Recovery Password Length is set to 48 digits or higher
$existingValue = Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue | Select-Object -ExpandProperty RecoveryPasswordLength
if ($existingValue -ge $regValue) {
    Write-Output "BitLocker recovery password is already set to 48 digits or higher."
} else {
    # Set the value
    Set-ItemProperty -Path $regPath -Name $regName -Value $regValue
    Write-Output "BitLocker recovery password has been set to 48 digits or higher."
}
# Enable Recovery Key with 256-Bit or Higher for BitLocker-Protected Fixed Drives
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\FVE"
$regName = "RecoveryKeyLength"
$regValue = 256

# Check if the Recovery Key Length is set to 256 bits or higher
$existingValue = Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue | Select-Object -ExpandProperty RecoveryKeyLength
if ($existingValue -ge $regValue) {
    Write-Output "BitLocker recovery key is already set to 256 bits or higher."
} else {
    # Set the value
    Set-ItemProperty -Path $regPath -Name $regName -Value $regValue
    Write-Output "BitLocker recovery key has been set to 256 bits or higher."
}
# Omit Recovery Options from the BitLocker Setup Wizard
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\FVE"
$regName = "OmitRecoveryOptions"
$regValue = 1

# Check if recovery options are omitted from the BitLocker setup wizard
$existingValue = Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue | Select-Object -ExpandProperty OmitRecoveryOptions
if ($existingValue -eq $regValue) {
    Write-Output "Recovery options are already omitted from the BitLocker setup wizard."
} else {
    # Set the value
    Set-ItemProperty -Path $regPath -Name $regName -Value $regValue
    Write-Output "Recovery options have been omitted from the BitLocker setup wizard."
}
# Disable Saving BitLocker Recovery Information to AD DS for Fixed Data Drives
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\FVE"
$regName = "SaveRecoveryInfoToADDS"
$regValue = 0

# Check if saving recovery information to AD DS is disabled
$existingValue = Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue | Select-Object -ExpandProperty SaveRecoveryInfoToADDS
if ($existingValue -eq $regValue) {
    Write-Output "Saving BitLocker recovery information to AD DS for fixed data drives is already Disabled."
} else {
    # Set the value
    Set-ItemProperty -Path $regPath -Name $regName -Value $regValue
    Write-Output "Saving BitLocker recovery information to AD DS for fixed data drives has been Disabled."
}
# Configure Storage of BitLocker Recovery Information to AD DS
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\FVE"
$regName = "BackupRecoveryInfoToADDS"
$regValue = 1

# Check if backup recovery information to AD DS is configured
$existingValue = Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue | Select-Object -ExpandProperty BackupRecoveryInfoToADDS
if ($existingValue -eq $regValue) {
    Write-Output "Backup of BitLocker recovery information to AD DS is already Configured."
} else {
    # Set the value
    Set-ItemProperty -Path $regPath -Name $regName -Value $regValue
    Write-Output "Backup of BitLocker recovery information to AD DS has been Configured."
}
# Disable Requirement to Store BitLocker Recovery Information to AD DS Before Enabling BitLocker
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\FVE"
$regName = "RequireRecoveryInfoBeforeEnable"
$regValue = 0

# Check if storing recovery information to AD DS is required before enabling BitLocker
$existingValue = Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue | Select-Object -ExpandProperty RequireRecoveryInfoBeforeEnable
if ($existingValue -eq $regValue) {
    Write-Output "Requirement to store BitLocker recovery information to AD DS before enabling BitLocker is already Disabled."
} else {
    # Set the value
    Set-ItemProperty -Path $regPath -Name $regName -Value $regValue
    Write-Output "Requirement to store BitLocker recovery information to AD DS before enabling BitLocker has been Disabled."
}
# Disable Hardware-Based Encryption for Fixed Data Drives
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\FVE"
$regName = "UseHardwareEncryption"
$regValue = 0

# Check if hardware-based encryption is disabled
$existingValue = Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue | Select-Object -ExpandProperty UseHardwareEncryption
if ($existingValue -eq $regValue) {
    Write-Output "Hardware-based encryption for fixed data drives is already Disabled."
} else {
    # Set the value
    Set-ItemProperty -Path $regPath -Name $regName -Value $regValue
    Write-Output "Hardware-based encryption for fixed data drives has been Disabled."
}
# Disable Use of Passwords for Fixed Data Drives
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\FVE"
$regName = "UsePasswordForFixedDrives"
$regValue = 0

# Check if passwords are disabled for fixed data drives
$existingValue = Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue | Select-Object -ExpandProperty UsePasswordForFixedDrives
if ($existingValue -eq $regValue) {
    Write-Output "Use of passwords for fixed data drives is already Disabled."
} else {
    # Set the value
    Set-ItemProperty -Path $regPath -Name $regName -Value $regValue
    Write-Output "Use of passwords for fixed data drives has been Disabled."
}
# Enable Use of Smart Cards on Fixed Data Drives
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\FVE"
$regName = "UseSmartCardsForFixedDrives"
$regValue = 1

# Check if smart cards are enabled for fixed data drives
$existingValue = Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue | Select-Object -ExpandProperty UseSmartCardsForFixedDrives
if ($existingValue -eq $regValue) {
    Write-Output "Use of smart cards on fixed data drives is already Enabled."
} else {
    # Set the value
    Set-ItemProperty -Path $regPath -Name $regName -Value $regValue
    Write-Output "Use of smart cards on fixed data drives has been Enabled."
}
# Require Use of Smart Cards on Fixed Data Drives
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\FVE"
$regName = "RequireSmartCardForFixedDrives"
$regValue = 1

# Check if use of smart cards is required for fixed data drives
$existingValue = Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue | Select-Object -ExpandProperty RequireSmartCardForFixedDrives
if ($existingValue -eq $regValue) {
    Write-Output "Requirement for smart cards on fixed data drives is already Enabled."
} else {
    # Set the value
    Set-ItemProperty -Path $regPath -Name $regName -Value $regValue
    Write-Output "Requirement for smart cards on fixed data drives has been Enabled."
}
# Enable Enhanced PINs for Startup
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System"
$regName = "AllowEnhancedPINs"
$regValue = 1

# Check if enhanced PINs for startup are allowed
$existingValue = Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue | Select-Object -ExpandProperty AllowEnhancedPINs
if ($existingValue -eq $regValue) {
    Write-Output "Enhanced PINs for startup are already Allowed."
} else {
    # Set the value
    Set-ItemProperty -Path $regPath -Name $regName -Value $regValue
    Write-Output "Enhanced PINs for startup have been Allowed."
}
# Enable Secure Boot for Integrity Validation
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System"
$regName = "EnableSecureBoot"
$regValue = 1

# Check if Secure Boot for integrity validation is enabled
$existingValue = Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue | Select-Object -ExpandProperty EnableSecureBoot
if ($existingValue -eq $regValue) {
    Write-Output "Secure Boot for integrity validation is already Enabled."
} else {
    # Set the value
    Set-ItemProperty -Path $regPath -Name $regName -Value $regValue
    Write-Output "Secure Boot for integrity validation has been Enabled."
}
# Enable Recovery Options for BitLocker-Protected Operating System Drives
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\FVE"
$regName = "OSRecoveryOptions"
$regValue = 1

# Check if recovery options are enabled
$existingValue = Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue | Select-Object -ExpandProperty OSRecoveryOptions
if ($existingValue -eq $regValue) {
    Write-Output "BitLocker recovery options for operating system drives are already Enabled."
} else {
    # Set the value
    Set-ItemProperty -Path $regPath -Name $regName -Value $regValue
    Write-Output "BitLocker recovery options for operating system drives have been Enabled."
}
# Disable Data Recovery Agent for BitLocker-Protected Operating System Drives
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\FVE"
$regName = "AllowDataRecoveryAgentOS"
$regValue = 0

# Check if Data Recovery Agent is allowed
$existingValue = Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue | Select-Object -ExpandProperty AllowDataRecoveryAgentOS
if ($existingValue -eq $regValue) {
    Write-Output "Data Recovery Agent is already Disabled for BitLocker-protected operating system drives."
} else {
    # Set the value
    Set-ItemProperty -Path $regPath -Name $regName -Value $regValue
    Write-Output "Data Recovery Agent has been Disabled for BitLocker-protected operating system drives."
}
# Require 48-Digit Recovery Password for BitLocker-Protected Operating System Drives
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\FVE"
$regName = "RecoveryPasswordLengthOS"
$regValue = 48

# Check if the Recovery Password Length is set to 48 digits or higher
$existingValue = Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue | Select-Object -ExpandProperty RecoveryPasswordLengthOS
if ($existingValue -ge $regValue) {
    Write-Output "BitLocker recovery password length is already set to 48 digits or higher for operating system drives."
} else {
    # Set the value
    Set-ItemProperty -Path $regPath -Name $regName -Value $regValue
    Write-Output "BitLocker recovery password length has been set to 48 digits or higher for operating system drives."
}
# Do Not Allow 256-Bit Recovery Key for BitLocker-Protected Operating System Drives
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\FVE"
$regName = "Allow256BitRecoveryKeyOS"
$regValue = 0

# Check if 256-bit recovery key is allowed
$existingValue = Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue | Select-Object -ExpandProperty Allow256BitRecoveryKeyOS
if ($existingValue -eq $regValue) {
    Write-Output "256-bit recovery key is already Disallowed for BitLocker-protected operating system drives."
} else {
    # Set the value
    Set-ItemProperty -Path $regPath -Name $regName -Value $regValue
    Write-Output "256-bit recovery key has been Disallowed for BitLocker-protected operating system drives."
}
# Omit Recovery Options from the BitLocker Setup Wizard for Operating System Drives
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\FVE"
$regName = "OmitRecoveryOptionsOS"
$regValue = 1

# Check if recovery options are omitted from the BitLocker setup wizard
$existingValue = Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue | Select-Object -ExpandProperty OmitRecoveryOptionsOS
if ($existingValue -eq $regValue) {
    Write-Output "Recovery options are already omitted from the BitLocker setup wizard for operating system drives."
} else {
    # Set the value
    Set-ItemProperty -Path $regPath -Name $regName -Value $regValue
    Write-Output "Recovery options have been omitted from the BitLocker setup wizard for operating system drives."
}
# Enable Saving BitLocker Recovery Information to AD DS for Operating System Drives
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\FVE"
$regName = "SaveRecoveryInfoToADDSOS"
$regValue = 1

# Check if saving recovery information to AD DS is enabled
$existingValue = Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue | Select-Object -ExpandProperty SaveRecoveryInfoToADDSOS
if ($existingValue -eq $regValue) {
    Write-Output "Saving BitLocker recovery information to AD DS for operating system drives is already Enabled."
} else {
    # Set the value
    Set-ItemProperty -Path $regPath -Name $regName -Value $regValue
    Write-Output "Saving BitLocker recovery information to AD DS for operating system drives has been Enabled."
}
# Configure Storage of BitLocker Recovery Information to AD DS for Operating System Drives
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\FVE"
$regName = "BackupRecoveryInfoToADDSOS"
$regValue = 1

# Check if backup recovery information to AD DS is configured
$existingValue = Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue | Select-Object -ExpandProperty BackupRecoveryInfoToADDSOS
if ($existingValue -eq $regValue) {
    Write-Output "Backup of BitLocker recovery information to AD DS is already Configured for operating system drives."
} else {
    # Set the value
    Set-ItemProperty -Path $regPath -Name $regName -Value $regValue
    Write-Output "Backup of BitLocker recovery information to AD DS has been Configured for operating system drives."
}
# Require Recovery Information to be Stored to AD DS Before Enabling BitLocker for Operating System Drives
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\FVE"
$regName = "RequireRecoveryInfoBeforeEnableOS"
$regValue = 1

# Check if storing recovery information to AD DS is required before enabling BitLocker
$existingValue = Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue | Select-Object -ExpandProperty RequireRecoveryInfoBeforeEnableOS
if ($existingValue -eq $regValue) {
    Write-Output "Requirement to store BitLocker recovery information to AD DS before enabling BitLocker for operating system drives is already Enabled."
} else {
    # Set the value
    Set-ItemProperty -Path $regPath -Name $regName -Value $regValue
    Write-Output "Requirement to store BitLocker recovery information to AD DS before enabling BitLocker for operating system drives has been Enabled."
}
# Disable Hardware-Based Encryption for Operating System Drives
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\FVE"
$regName = "UseHardwareEncryptionOS"
$regValue = 0

# Check if hardware-based encryption is disabled
$existingValue = Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue | Select-Object -ExpandProperty UseHardwareEncryptionOS
if ($existingValue -eq $regValue) {
    Write-Output "Hardware-based encryption for operating system drives is already Disabled."
} else {
    # Set the value
    Set-ItemProperty -Path $regPath -Name $regName -Value $regValue
    Write-Output "Hardware-based encryption for operating system drives has been Disabled."
}
# Disable Use of Passwords for Operating System Drives
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\FVE"
$regName = "UsePasswordForOS"
$regValue = 0

# Check if passwords are disabled for operating system drives
$existingValue = Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue | Select-Object -ExpandProperty UsePasswordForOS
if ($existingValue -eq $regValue) {
    Write-Output "Use of passwords for operating system drives is already Disabled."
} else {
    # Set the value
    Set-ItemProperty -Path $regPath -Name $regName -Value $regValue
    Write-Output "Use of passwords for operating system drives has been Disabled."
}
# Enable Additional Authentication at Startup
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System"
$regName = "RequireAdditionalAuthentication"
$regValue = 1

# Check if additional authentication at startup is required
$existingValue = Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue | Select-Object -ExpandProperty RequireAdditionalAuthentication
if ($existingValue -eq $regValue) {
    Write-Output "Additional authentication at startup is already Enabled."
} else {
    # Set the value
    Set-ItemProperty -Path $regPath -Name $regName -Value $regValue
    Write-Output "Additional authentication at startup has been Enabled."
}
# Disallow BitLocker Without a Compatible TPM
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System"
$regName = "AllowBitLockerWithoutTPM"
$regValue = 0

# Check if BitLocker without TPM is allowed
$existingValue = Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue | Select-Object -ExpandProperty AllowBitLockerWithoutTPM
if ($existingValue -eq $regValue) {
    Write-Output "BitLocker without a compatible TPM is already Disallowed."
} else {
    # Set the value
    Set-ItemProperty -Path $regPath -Name $regName -Value $regValue
    Write-Output "BitLocker without a compatible TPM has been Disallowed."
}
# Disallow TPM for BitLocker Startup
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System"
$regName = "AllowTPMStartup"
$regValue = 0

# Check if TPM startup is allowed
$existingValue = Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue | Select-Object -ExpandProperty AllowTPMStartup
if ($existingValue -eq $regValue) {
    Write-Output "TPM startup is already Disallowed for BitLocker."
} else {
    # Set the value
    Set-ItemProperty -Path $regPath -Name $regName -Value $regValue
    Write-Output "TPM startup has been Disallowed for BitLocker."
}
# Require Startup PIN with TPM
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System"
$regName = "RequireTPMStartupPIN"
$regValue = 1

# Check if TPM startup PIN is required
$existingValue = Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue | Select-Object -ExpandProperty RequireTPMStartupPIN
if ($existingValue -eq $regValue) {
    Write-Output "Startup PIN with TPM is already Required."
} else {
    # Set the value
    Set-ItemProperty -Path $regPath -Name $regName -Value $regValue
    Write-Output "Startup PIN with TPM has been Required."
}
# Disallow Startup Key with TPM
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System"
$regName = "AllowTPMStartupKey"
$regValue = 0

# Check if TPM startup key is allowed
$existingValue = Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue | Select-Object -ExpandProperty AllowTPMStartupKey
if ($existingValue -eq $regValue) {
    Write-Output "Startup key with TPM is already Disallowed."
} else {
    # Set the value
    Set-ItemProperty -Path $regPath -Name $regName -Value $regValue
    Write-Output "Startup key with TPM has been Disallowed."
}
# Disallow Startup Key and PIN with TPM
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System"
$regName = "AllowTPMStartupKeyAndPIN"
$regValue = 0

# Check if TPM startup key and PIN are allowed
$existingValue = Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue | Select-Object -ExpandProperty AllowTPMStartupKeyAndPIN
if ($existingValue -eq $regValue) {
    Write-Output "Startup key and PIN with TPM are already Disallowed."
} else {
    # Set the value
    Set-ItemProperty -Path $regPath -Name $regName -Value $regValue
    Write-Output "Startup key and PIN with TPM have been Disallowed."
}
# Disable Access to BitLocker-Protected Removable Drives from Earlier Versions of Windows
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\FVE"
$regName = "AllowAccessToRemovableDataDrivesFromEarlierWindows"
$regValue = 0

# Check if access to removable data drives is allowed
$existingValue = Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue | Select-Object -ExpandProperty AllowAccessToRemovableDataDrivesFromEarlierWindows
if ($existingValue -eq $regValue) {
    Write-Output "Access to BitLocker-protected removable data drives from earlier versions of Windows is already Disabled."
} else {
    # Set the value
    Set-ItemProperty -Path $regPath -Name $regName -Value $regValue
    Write-Output "Access to BitLocker-protected removable data drives from earlier versions of Windows has been Disabled."
}
# Enable Recovery Options for BitLocker-Protected Removable Drives
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\FVE"
$regName = "RemovableDriveRecoveryOptions"
$regValue = 1

# Check if recovery options for removable drives are enabled
$existingValue = Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue | Select-Object -ExpandProperty RemovableDriveRecoveryOptions
if ($existingValue -eq $regValue) {
    Write-Output "BitLocker recovery options for removable drives are already Enabled."
} else {
    # Set the value
    Set-ItemProperty -Path $regPath -Name $regName -Value $regValue
    Write-Output "BitLocker recovery options for removable drives have been Enabled."
}
# Enable Data Recovery Agent for BitLocker-Protected Removable Drives
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\FVE"
$regName = "AllowDataRecoveryAgentRemovable"
$regValue = 1

# Check if Data Recovery Agent is allowed
$existingValue = Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue | Select-Object -ExpandProperty AllowDataRecoveryAgentRemovable
if ($existingValue -eq $regValue) {
    Write-Output "Data Recovery Agent is already Enabled for BitLocker-protected removable drives."
} else {
    # Set the value
    Set-ItemProperty -Path $regPath -Name $regName -Value $regValue
    Write-Output "Data Recovery Agent has been Enabled for BitLocker-protected removable drives."
}
# Disallow 48-Digit Recovery Password for BitLocker-Protected Removable Drives
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\FVE"
$regName = "Disallow48DigitRecoveryPasswordRemovable"
$regValue = 1

# Check if 48-digit recovery password is disallowed
$existingValue = Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue | Select-Object -ExpandProperty Disallow48DigitRecoveryPasswordRemovable
if ($existingValue -eq $regValue) {
    Write-Output "48-digit recovery password is already Disallowed for BitLocker-protected removable drives."
} else {
    # Set the value
    Set-ItemProperty -Path $regPath -Name $regName -Value $regValue
    Write-Output "48-digit recovery password has been Disallowed for BitLocker-protected removable drives."
}
# Disallow 256-Bit Recovery Key for BitLocker-Protected Removable Drives
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\FVE"
$regName = "Disallow256BitRecoveryKeyRemovable"
$regValue = 1

# Check if 256-bit recovery key is disallowed
$existingValue = Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue | Select-Object -ExpandProperty Disallow256BitRecoveryKeyRemovable
if ($existingValue -eq $regValue) {
    Write-Output "256-bit recovery key is already Disallowed for BitLocker-protected removable drives."
} else {
    # Set the value
    Set-ItemProperty -Path $regPath -Name $regName -Value $regValue
    Write-Output "256-bit recovery key has been Disallowed for BitLocker-protected removable drives."
}
# Omit Recovery Options from the BitLocker Setup Wizard for Removable Drives
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\FVE"
$regName = "OmitRecoveryOptionsRemovable"
$regValue = 1

# Check if recovery options are omitted from the BitLocker setup wizard
$existingValue = Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue | Select-Object -ExpandProperty OmitRecoveryOptionsRemovable
if ($existingValue -eq $regValue) {
    Write-Output "Recovery options are already omitted from the BitLocker setup wizard for removable drives."
} else {
    # Set the value
    Set-ItemProperty -Path $regPath -Name $regName -Value $regValue
    Write-Output "Recovery options have been omitted from the BitLocker setup wizard for removable drives."
}
# Disable Saving BitLocker Recovery Information to AD DS for Removable Data Drives
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\FVE"
$regName = "SaveRecoveryInfoToADDSRemovable"
$regValue = 0

# Check if saving recovery information to AD DS is enabled
$existingValue = Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue | Select-Object -ExpandProperty SaveRecoveryInfoToADDSRemovable
if ($existingValue -eq $regValue) {
    Write-Output "Saving BitLocker recovery information to AD DS for removable data drives is already Disabled."
} else {
    # Set the value
    Set-ItemProperty -Path $regPath -Name $regName -Value $regValue
    Write-Output "Saving BitLocker recovery information to AD DS for removable data drives has been Disabled."
}
# Backup Recovery Passwords and Key Packages to AD DS for BitLocker-Protected Removable Drives
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\FVE"
$regName = "BackupRecoveryInfoToADDSRemovable"
$regValue = 1

# Check if recovery information is backed up to AD DS
$existingValue = Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue | Select-Object -ExpandProperty BackupRecoveryInfoToADDSRemovable
if ($existingValue -eq $regValue) {
    Write-Output "Backup of BitLocker recovery information to AD DS for removable drives is already Enabled."
} else {
    # Set the value
    Set-ItemProperty -Path $regPath -Name $regName -Value $regValue
    Write-Output "Backup of BitLocker recovery information to AD DS for removable drives has been Enabled."
}
# Do Not Enable BitLocker Until Recovery Information is Stored to AD DS for Removable Data Drives
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\FVE"
$regName = "DoNotEnableBitLockerUntilADDSStoredRemovable"
$regValue = 0

# Check if enabling BitLocker until recovery information is stored to AD DS is enforced
$existingValue = Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue | Select-Object -ExpandProperty DoNotEnableBitLockerUntilADDSStoredRemovable
if ($existingValue -eq $regValue) {
    Write-Output "BitLocker is already allowed to be enabled even if recovery information is not stored to AD DS for removable data drives."
} else {
    # Set the value
    Set-ItemProperty -Path $regPath -Name $regName -Value $regValue
    Write-Output "BitLocker has been configured to allow enabling even if recovery information is not stored to AD DS for removable data drives."
}
# Disable Hardware-Based Encryption for Removable Data Drives
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\FVE"
$regName = "UseHardwareEncryptionRemovable"
$regValue = 0

# Check if hardware-based encryption is disabled for removable drives
$existingValue = Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue | Select-Object -ExpandProperty UseHardwareEncryptionRemovable
if ($existingValue -eq $regValue) {
    Write-Output "Hardware-based encryption for removable data drives is already Disabled."
} else {
    # Set the value
    Set-ItemProperty -Path $regPath -Name $regName -Value $regValue
    Write-Output "Hardware-based encryption for removable data drives has been Disabled."
}
# Disable Use of Passwords for Removable Data Drives
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\FVE"
$regName = "UsePasswordForRemovable"
$regValue = 0

# Check if passwords are disabled for removable data drives
$existingValue = Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue | Select-Object -ExpandProperty UsePasswordForRemovable
if ($existingValue -eq $regValue) {
    Write-Output "Use of passwords for removable data drives is already Disabled."
} else {
    # Set the value
    Set-ItemProperty -Path $regPath -Name $regName -Value $regValue
    Write-Output "Use of passwords for removable data drives has been Disabled."
}
# Enable Use of Smart Cards on Removable Data Drives
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\FVE"
$regName = "SmartCardRemovable"
$regValue = 1

# Check if smart card usage is enabled for removable drives
$existingValue = Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue | Select-Object -ExpandProperty SmartCardRemovable
if ($existingValue -eq $regValue) {
    Write-Output "Use of smart cards on removable data drives is already Enabled."
} else {
    # Set the value
    Set-ItemProperty -Path $regPath -Name $regName -Value $regValue
    Write-Output "Use of smart cards on removable data drives has been Enabled."
}
# Require Use of Smart Cards on Removable Data Drives
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\FVE"
$regName = "RequireSmartCardRemovable"
$regValue = 1

# Check if use of smart cards is required for removable drives
$existingValue = Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue | Select-Object -ExpandProperty RequireSmartCardRemovable
if ($existingValue -eq $regValue) {
    Write-Output "Use of smart cards on removable data drives is already Required."
} else {
    # Set the value
    Set-ItemProperty -Path $regPath -Name $regName -Value $regValue
    Write-Output "Use of smart cards on removable data drives has been Required."
}
# Enable Deny Write Access to Removable Drives Not Protected by BitLocker
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\RemovableStorageDevices"
$regName = "DenyWriteAccessNotProtected"
$regValue = 1

# Check if write access to unprotected drives is denied
$existingValue = Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue | Select-Object -ExpandProperty DenyWriteAccessNotProtected
if ($existingValue -eq $regValue) {
    Write-Output "Write access to removable drives not protected by BitLocker is already Denied."
} else {
    # Set the value
    Set-ItemProperty -Path $regPath -Name $regName -Value $regValue
    Write-Output "Write access to removable drives not protected by BitLocker has been Denied."
}
# Disallow Write Access to Devices Configured in Another Organization
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\RemovableStorageDevices"
$regName = "AllowWriteAccessOtherOrg"
$regValue = 0

# Check if write access to devices configured in another organization is allowed
$existingValue = Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue | Select-Object -ExpandProperty AllowWriteAccessOtherOrg
if ($existingValue -eq $regValue) {
    Write-Output "Write access to devices configured in another organization is already Disallowed."
} else {
    # Set the value
    Set-ItemProperty -Path $regPath -Name $regName -Value $regValue
    Write-Output "Write access to devices configured in another organization has been Disallowed."
}
# Enable Disable New DMA Devices When Computer is Locked
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System"
$regName = "DisableNewDMADevicesWhenLocked"
$regValue = 1

# Check if new DMA devices are disabled when computer is locked
$existingValue = Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue | Select-Object -ExpandProperty DisableNewDMADevicesWhenLocked
if ($existingValue -eq $regValue) {
    Write-Output "New DMA devices are already Disabled when the computer is locked."
} else {
    # Set the value
    Set-ItemProperty -Path $regPath -Name $regName -Value $regValue
    Write-Output "New DMA devices have been Disabled when the computer is locked."
}
# Disable Use of Camera
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Camera"
$regName = "AllowCamera"
$regValue = 0

# Check if use of the camera is disabled
$existingValue = Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue | Select-Object -ExpandProperty AllowCamera
if ($existingValue -eq $regValue) {
    Write-Output "Use of the camera is already Disabled."
} else {
    # Set the value
    Set-ItemProperty -Path $regPath -Name $regName -Value $regValue
    Write-Output "Use of the camera has been Disabled."
}
# Enable Turn Off Cloud Consumer Account State Content
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent"
$regName = "DisableCloudConsumerAccountStateContent"
$regValue = 1

# Check if cloud consumer account state content is turned off
$existingValue = Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue | Select-Object -ExpandProperty DisableCloudConsumerAccountStateContent
if ($existingValue -eq $regValue) {
    Write-Output "Cloud consumer account state content is already Disabled."
} else {
    # Set the value
    Set-ItemProperty -Path $regPath -Name $regName -Value $regValue
    Write-Output "Cloud consumer account state content has been Disabled."
}
# Enable Turn Off Cloud Optimized Content
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent"
$regName = "DisableCloudOptimizedContent"
$regValue = 1

# Check if cloud optimized content is turned off
$existingValue = Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue | Select-Object -ExpandProperty DisableCloudOptimizedContent
if ($existingValue -eq $regValue) {
    Write-Output "Cloud optimized content is already Disabled."
} else {
    # Set the value
    Set-ItemProperty -Path $regPath -Name $regName -Value $regValue
    Write-Output "Cloud optimized content has been Disabled."
}
# Enable Turn Off Microsoft Consumer Experiences
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent"
$regName = "DisableMicrosoftConsumerExperiences"
$regValue = 1

# Check if Microsoft consumer experiences are turned off
$existingValue = Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue | Select-Object -ExpandProperty DisableMicrosoftConsumerExperiences
if ($existingValue -eq $regValue) {
    Write-Output "Microsoft consumer experiences are already Disabled."
} else {
    # Set the value
    Set-ItemProperty -Path $regPath -Name $regName -Value $regValue
    Write-Output "Microsoft consumer experiences have been Disabled."
}
# Enable Require PIN for Pairing
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Bluetooth"
$regName = "RequirePinForPairing"
$regValue = 1 # 1 for First Time, 2 for Always

# Check if PIN is required for pairing
$existingValue = Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue | Select-Object -ExpandProperty RequirePinForPairing
if ($existingValue -eq $regValue) {
    Write-Output "PIN requirement for pairing is already Enabled."
} else {
    # Set the value
    Set-ItemProperty -Path $regPath -Name $regName -Value $regValue
    Write-Output "PIN requirement for pairing has been Enabled."
}
# Enable Do Not Display the Password Reveal Button
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System"
$regName = "HidePasswordRevealButton"
$regValue = 1

# Check if the password reveal button is hidden
$existingValue = Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue | Select-Object -ExpandProperty HidePasswordRevealButton
if ($existingValue -eq $regValue) {
    Write-Output "Password reveal button is already Hidden."
} else {
    # Set the value
    Set-ItemProperty -Path $regPath -Name $regName -Value $regValue
    Write-Output "Password reveal button has been Hidden."
}
# Disable Enumeration of Administrator Accounts on Elevation
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System"
$regName = "EnumerateAdministratorAccounts"
$regValue = 0

# Check if administrator accounts enumeration is disabled
$existingValue = Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue | Select-Object -ExpandProperty EnumerateAdministratorAccounts
if ($existingValue -eq $regValue) {
    Write-Output "Enumeration of administrator accounts on elevation is already Disabled."
} else {
    # Set the value
    Set-ItemProperty -Path $regPath -Name $regName -Value $regValue
    Write-Output "Enumeration of administrator accounts on elevation has been Disabled."
}
# Enable Prevention of Security Questions for Local Accounts
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System"
$regName = "PreventSecurityQuestions"
$regValue = 1

# Check if security questions are prevented for local accounts
$existingValue = Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue | Select-Object -ExpandProperty PreventSecurityQuestions
if ($existingValue -eq $regValue) {
    Write-Output "Use of security questions for local accounts is already Prevented."
} else {
    # Set the value
    Set-ItemProperty -Path $regPath -Name $regName -Value $regValue
    Write-Output "Use of security questions for local accounts has been Prevented."
}
# Enable Allow Diagnostic Data
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection"
$regName = "AllowDiagnosticData"
$regValue = 1 # 1 for Diagnostic data off (not recommended), 2 for Send required diagnostic data

# Check if diagnostic data is allowed
$existingValue = Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue | Select-Object -ExpandProperty AllowDiagnosticData
if ($existingValue -eq $regValue) {
    Write-Output "Diagnostic data settings are already as required."
} else {
    # Set the value
    Set-ItemProperty -Path $regPath -Name $regName -Value $regValue
    Write-Output "Diagnostic data settings have been configured."
}
