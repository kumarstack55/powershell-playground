try {
    Remove-Item C:\nonexistent\file.txt -ErrorAction Stop
} catch [System.Management.Automation.ErrorRecord] {
    "実行されない。PowerShellの言語仕様は変だと思う。"
} catch [System.Management.Automation.ItemNotFoundException] {
    "実行されない。PowerShellの言語仕様は変だと思う。"
} catch [System.Management.Automation.ActionPreferenceStopException] {
    # -ErrorAction で、エラー時、 ActionPreferenceStopException が投げられる
    # ActionPreferenceStopException オブジェクトを得る手段はわからない
    if ($_.Exception -is [System.Management.Automation.ItemNotFoundException]) {
        # catch句で、例外にアクセスするには $_ を使う。
        # このオブジェクトは、 ErrorRecord である。
        $_.GetType().FullName
            # --> System.Management.Automation.ErrorRecord

        # より具体的な例外は Exception プロパティが持つ。
        $_.Exception.GetType().FullName
            # --> System.Management.Automation.ItemNotFoundException
    } else {
        Throw $_
    }
}
