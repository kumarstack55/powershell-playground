Function Test-CommandExists {
    Param($Name)

    try {
        Get-Command -Name $Name -ErrorAction Stop | Out-Null
        return $True
    } catch [System.Management.Automation.ActionPreferenceStopException] {
        $e = $_.Exception
        if ($e -is [System.Management.Automation.CommandNotFoundException]) {
            return $False
        }
        Throw $_
    }
}

Test-CommandExists nvim
Test-CommandExists notexists
#$_.Exception.GetType().FullName
