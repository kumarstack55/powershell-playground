try {
    1/0
} catch [System.Management.Automation.ErrorRecord] {
    "実行されない。PowerShellの言語仕様は変だと思う。"
} catch [System.Management.Automation.ActionPreferenceStopException] {
    "実行されない。ゼロ除算は -ErrorAction Stop とは別の例外であるため。"
} catch [System.Management.Automation.RuntimeException] {
    $_.GetType().FullName
        # --> System.Management.Automation.RuntimeException
}
