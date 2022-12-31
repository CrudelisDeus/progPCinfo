if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

# meny main-info
function get-main-info {
    clear
    # var
    $CPU = Get-WmiObject win32_Processor
    $RAM = Get-CimInstance Win32_PhysicalMemory
    $RAMsize = ($RAM | Measure-Object -Property capacity -Sum).sum /1gb
    # info
    Write-Host "[PC info]`n"
    # Get CPU info
    Write-Host "[CPU]: "
    Write-Host "  Full-Name: " -NoNewline
    Write-Host $CPU.name
    Write-Host "  Core: " -NoNewline
    Write-Host $CPU.NumberOfCores
    Write-Host "  Logical Core: " -NoNewline
    Write-Host $CPU.NumberOfLogicalProcessors
    # Get RAM info
    Write-Host "`n[RAM]: "
    Write-Host "  Full-name: " -NoNewline
    Write-Host $RAM.PartNumber
    Write-Host "  Sum: " -NoNewline
    Write-Host $RAMsize
    Write-Host "  Speed: " -NoNewline
    Write-Host $RAM.speed

    #Write-Host "`n[Matherboard]: "
    #Write-Host "  |Full-name| " -NoNewline
    #Write-Host "`n[OS]: "
    #Write-Host "  |User-Name| " -NoNewline
    #Write-Host "  |PC-Name| " -NoNewline
    #Write-Host "  |Date| " -NoNewline
    # meny
    Write-Host "`n[1] Save file"
    Write-Host "[2] Back"
    $userInput = Read-Host "`n[>]"
    switch($userInput) {
        1 {
            ### not_work)
         }
        2 { 
           get-main 
        }
        default {
          get-main-info  
        }
    }
}

# main meny
function get-main {
    clear
    # meny
    Write-Host "[PC info]`n"
    Write-Host "[1] View PC info"
    Write-Host "[2] Exit"
    $userInput = Read-Host "`n[>]"
    switch($userInput) {
        1 {
            get-main-info
        }
        2 {
            clear
        }
        default {
            get-main
        }
    }
}

# start main meny
get-main