$computerSystemInfo = Get-WmiObject -Class Win32_ComputerSystem

$biosInfo = Get-CimInstance -ClassName Win32_Bios

if ($computerSystemInfo.Model -match "Virtual") {
  Write-Output "This Machine is likely running in a virtual machine."
} else {
  if ($biosInfo) {
    Write-Output "This Machine could be physical. BIOS information found: $biosInfo.Manufacturer - $biosInfo.SerialNumber"
  } else {
    Write-Output "This Machine could be physical or virtual. BIOS information unavailable."
  }
}
   








