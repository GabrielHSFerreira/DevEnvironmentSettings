# Powerline
Import-Module posh-git
Import-Module oh-my-posh
Set-PoshPrompt -Theme "~\PoshThemes\customagnosterplus.json"

# Autocomplete
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward

# Functions
Function Clear-Branches { 
  git branch | Select-String -NotMatch -Pattern "\*[\w\d-\/]*" | ForEach-Object -Process { git branch -D $_.ToString().Trim() } 
}

# Alias
Set-Alias -Name "gbpurge" -Value Clear-Branches