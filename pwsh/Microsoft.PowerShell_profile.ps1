Set-PsReadlineOption -EditMode "Emacs"

# NOTE: Put `starship` before `zoxide` because `starship init` could overwrite the hook `zoxide init` creates
try {
  if (Get-Command starship) {
    Invoke-Expression (&starship init powershell --print-full-init | Out-String)
  }
}
catch {
  Write-Host "Starship is not installed"
}

# NOTE: Put `zoxide` after `starship` because `starship init` could overwrite the hook `zoxide init` creates
try {
  if (Get-Command zoxide) {
    Invoke-Expression (& { $hook = if ($PSVersionTable.PSVersion.Major -ge 6) { 'pwd' } else { 'prompt' } (zoxide init powershell --hook $hook --cmd j | Out-String) })
  }
}
catch {
  Write-Host "Zoxide is not installed"
}


try {
  if (Get-Command nvim) {
    $Env:EDITOR = "nvim"
  }
}
catch {
  Write-Host "Neovim is not installed"
}

