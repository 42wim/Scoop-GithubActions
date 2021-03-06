Join-Path $PSScriptRoot 'Helpers.psm1' | Import-Module
Join-Path $PSScriptRoot 'Action' | Get-ChildItem -Filter '*.psm1' | Import-Module

function Invoke-Action {
    switch ($EVENT_TYPE) {
        'pull_request' { Initialize-PR }
        'issue_comment' { Initialize-PR }
        'schedule' { Initialize-Scheduled }
        'issues' { Initialize-Issue }
        default { Initialize-Scheduled }
    }
}

Export-ModuleMember -Function Invoke-Action
