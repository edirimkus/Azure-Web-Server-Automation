# Create DSC configuration
Configuration WebServer {
    Node $AllNodes.NodeName {
        WindowsFeature 'IIS' {
            Ensure = 'Present'
            Name = 'Web-Server'
        }
        File 'DefaultPage' {
            DestinationPath = 'C:\inetpub\wwwroot\index.html'
            SourcePath = 'C:\Config\index.html'
            DependsOn = '[WindowsFeature]IIS'
        }
    }
}

# Define server nodes
$nodes = @()
for ($i = 1; $i -le 3; $i++) {
    $nodes += New-PSNode -NodeName "$vmNamePrefix$i"
}

# Apply DSC configuration
WebServer -OutputPath C:\Config
Start-DscConfiguration -Path C:\Config -Wait -Force -Verbose -ComputerName $nodes
