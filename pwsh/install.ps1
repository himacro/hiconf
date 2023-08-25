New-Item -ItemType SymbolicLink -Path ([Environment]::GetFolderPath("MyDocuments") + "\PowerShell") -Target $PSScriptRoot

