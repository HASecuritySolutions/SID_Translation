$rules = get-content -Path /etc/nsm/rules/*.rules | Where-Object { $_ -notmatch "^#" }

Remove-Item -Force -Path /opt/elastic_stack/logstash/translate/rules.csv
foreach($rule in $rules){
    if($sid = [regex]::match($rule, "sid:(?<sid>[0-9]+);").Groups[1].Value){
        $modified_rule = $rule -replace "'","" -replace '"','' -replace ",",""
        "$($sid),$($modified_rule)" | Out-File -FilePath /opt/elastic_stack/logstash/translate/rules.csv -Append -Encoding utf8
    }
}
