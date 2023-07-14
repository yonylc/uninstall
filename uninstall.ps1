powershell.exe -command Set-ExecutionPolicy -Scope Process -ExecutionPolicy Unrestricted -Force

# Remove Symantec and Write log files

#Variable Declaration
$log = "C:\temp\Symantec_Unistall.log"

echo "+++++++++++++++++++++++++++++++++++" | Out-File -FilePath $log -Append
echo "Host: $Env:computername" | Out-File -FilePath $log -Append
(Get-WmiObject -Class Win32_Product -Filter "Name='Symantec Endpoint Protection'" -ComputerName . ).Uninstall() | Out-File -FilePath $log -Append
echo "+++++++++++++++++++++++++++++++++++" | Out-File -FilePath $log -Append
