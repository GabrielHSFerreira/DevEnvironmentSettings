# Environment Variables
$DefaultUser = '{your-windows-user}'

# Powerline
Import-Module posh-git
Import-Module oh-my-posh
Set-Theme Agnoster

# Autocomplete
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward

# Alias
Function Clear-Branches { 
  git branch | Select-String -NotMatch -Pattern "\*[\w\d-\/]*" | ForEach-Object -Process { git branch -D $_.ToString().Trim() } 
}
Set-Alias -Name "gbpurge" -Value Clear-Branches