Configuration Main
{

Param ( [string] $nodeName )

Import-DscResource -ModuleName xStorage, xTimeZone, cChoco

Node $nodeName
  {
	LocalConfigurationManager
	{
	  DebugMode = 'ForceModuleImport'
	}
	xWaitforDisk Disk2
	{
		DiskNumber = 2
	}
	xDisk FVolume
	{
		DiskNumber = 2
		DriveLetter = 'F'
	    DependsOn = "[xWaitforDisk]Disk2"
	}
	xTimeZone SetTimeZone
	{
		IsSingleInstance = "Yes"
		TimeZone = "Mountain Standard Time"
		DependsOn = "[xDisk]FVolume" 
	}
    File C_Temp
	{
		Ensure = "Present"
		DestinationPath = "C:\temp"
		Type = "Directory"
	}
    File C_Applications
	{
		Ensure = "Present"
		DestinationPath = "C:\Applications"
		Type = "Directory"
	}
    File F_Downloads
	{
		Ensure = "Present"
		DestinationPath = "F:\Downloads"
		Type = "Directory"
		DependsOn = "[xDisk]FVolume" 
	}
    File F_Applications
	{
		Ensure = "Present"
		DestinationPath = "F:\Applications"
		Type = "Directory"
		DependsOn = "[File]F_Downloads" 
	}
    WindowsFeature WebServerRole
    {
      Name = "Web-Server"
      Ensure = "Present"
    }
    WindowsFeature WebManagementConsole
    {
      Name = "Web-Mgmt-Console"
      Ensure = "Present"
    }
    WindowsFeature WebManagementService
    {
      Name = "Web-Mgmt-Service"
      Ensure = "Present"
    }
    WindowsFeature ASPNet45
    {
      Name = "Web-Asp-Net45"
      Ensure = "Present"
    }
    WindowsFeature HTTPRedirection
    {
      Name = "Web-Http-Redirect"
      Ensure = "Present"
    }
    WindowsFeature RequestMonitor
    {
      Name = "Web-Request-Monitor"
      Ensure = "Present"
    }
    WindowsFeature Tracing
    {
      Name = "Web-Http-Tracing"
      Ensure = "Present"
    }
    WindowsFeature BasicAuthentication
    {
      Name = "Web-Basic-Auth"
      Ensure = "Present"
    }
    WindowsFeature WindowsAuthentication
    {
      Name = "Web-Windows-Auth"
      Ensure = "Present"
    }
    WindowsFeature ApplicationInitialization
    {
      Name = "Web-AppInit"
      Ensure = "Present"
    }
    cChocoInstaller installChoco
    {
	  InstallDir = "C:\Applications\choco"
	  DependsOn = "[File]C_Applications"
    }
	cChocoPackageInstaller installChrome
	{
		Name = "googlechrome"
		DependsOn = "[cChocoInstaller]installChoco"
	}
	cChocoPackageInstaller pscx 
	{
		Name = "pscx"
		DependsOn = "[cChocoInstaller]installChoco"
	}
	cChocoPackageInstaller installGit
	{
		 Name = "git"
		 DependsOn = "[cChocoInstaller]installChoco"
	}
	cChocoPackageInstaller gitcredentials 
	{
		 Name = "git-credential-manager-for-windows"
		DependsOn = "[cChocoInstaller]installChoco"
	}
	cChocoPackageInstaller visualstudiocode
	{
		 Name = "visualstudiocode"
		DependsOn = "[cChocoInstaller]installChoco"
	}
	cChocoPackageInstaller 7zip 
	{
		Name = "7zip"
		DependsOn = "[cChocoInstaller]installChoco"
	}
	cChocoPackageInstaller vimdwiw2015
	{
		Name = "vim-dwiw2015"
		DependsOn = "[cChocoInstaller]installChoco"
	}
	cChocoPackageInstaller beyondcompare
	{
		Name = "beyondcompare"
		DependsOn = "[cChocoInstaller]installChoco"
	}
  }
}