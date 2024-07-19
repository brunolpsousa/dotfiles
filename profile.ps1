# function Invoke-Starship-PreCommand {
#   $host.ui.RawUI.WindowTitle = ((Get-Location) | Get-Item).Name
# }
# Invoke-Expression (&starship init powershell)

oh-my-posh init pwsh --config C:\Users\bruno\.config\omp.json | Invoke-Expression

$env:GPG_TTY = "$(tty)"
$env:SSH_AGENT_PID = ""
$env:SSH_AUTH_SOCK = "$(gpgconf --list-dirs agent-ssh-socket)"
$env:GNUPGHOME = "/C/Users/bruno/.local/share/gnupg"
gpg-connect-agent updatestartuptty /bye >$null
