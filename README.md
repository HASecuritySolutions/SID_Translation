# SID_Translation
This script is designed to look at all signatures (Snort GPL or ET... also works with Suricata rules) and translates them into the format of sid,rule for Logstash translation. The logstash-filter-translate plugin can use this CSV format for memory lookups to pull in the rule information any time an alert is triggered for a specific SID. Example output below:

```bash
2230018,alert tls any any -> any any (msg:SURICATA TLS invalid SNI length; flow:establishedto_server; app-layer-event:tls.invalid_sni_length; flowint:tls.anomaly.count+1; classtype:protocol-command-decode; sid:2230018; rev:1;)
2230019,alert tls any any -> any any (msg:SURICATA TLS handshake invalid length; flow:established; app-layer-event:tls.handshake_invalid_length; flowint:tls.anomaly.count+1; classtype:protocol-command-decode; sid:2230019; rev:1;)
2230020,alert tls any any -> any any (msg:SURICATA TLS too many records in packet; flow:established; app-layer-event:tls.too_many_records_in_packet; flowint:tls.anomaly.count+1; classtype:protocol-command-decode; sid:2230020; rev:1;)
```

Requires either PowerShell on Linux or Docker. Below are examples of running the translation script. Assumption is the script is in **/opt/elastic_stack/scripts**, signatures are in **/etc/nsm**, and that it will be saving to **/opt/elastic_stack/logstash/translate/rules.csv**.

**Using PowerShell on Linux**

pwsh /opt/elastic_stack/scripts/sid_translation.ps1

**Using Docker**

sudo /usr/bin/docker run -it --rm -v /opt/elastic_stack:/opt/elastic_stack -v /etc/nsm:/etc/nsm mcr.microsoft.com/powershell pwsh /opt/elastic_stack/scripts/sid_translation.ps1
