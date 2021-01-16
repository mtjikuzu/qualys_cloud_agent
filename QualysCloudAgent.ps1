$source = "https://github.com/mtjikuzu/qualys_cloud_agent/blob/main/QualysCloudAgent.exe";
$destination = "c:\temp\QualysCloudAgent.exe"

#Check if software is installed. If installed terminate script

if ((Test-Path "C:\Program Files\Qualys\QualysAgent\QualysAgent.exe") -Or (Test-Path "C:\Program Files (x86)\Qualys\QualysAgent\QualysAgent.exe")){
write-host "Software already installed" 
Exit
}

#Check if the installer is in the folder. If installer exist, replace it
 
If ((Test-Path $destination) -eq $false) {
    New-Item -ItemType File -Path $destination -Force
} 

#install software

Invoke-WebRequest $source -OutFile $destination

$pathvargs = {C:\temp\QualysCloudAgent.exe /S /v/qn }
Invoke-Command -ScriptBlock $pathvargs 
