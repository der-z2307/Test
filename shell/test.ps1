$token = "xxx"
$owner = "der-z2307"
$repo = "Test"

$body = @{
    event_type = "mein-event"
    client_payload = @{
        ref = "refs/heads/main"
        environment = "staging"
        version = "2.0.0"
        features = @("featureA", "featureB")
        metadata = @{
            build_id = 98765
            timestamp = "2025-11-13T19:53:00Z"
        }
        delivery_type = "fileshare"
            Elements = @{
                DropLocation = "\\deerls6fsa05.ad001.siemens.net\tia\TPE.System_EP_W.rgl.ERL\8373_21.00.00.00_01.16.0007\input"
                ResultLocation = "\\deerls6fsa05.ad001.siemens.net\tia\TPE.System_EP_W.rgl.ERL\8373_21.00.00.00_01.16.0007\output"
                build = "21.00.00.00_01.16.0007"
                bifrostPipelineID = "bifrostPipelineID-12345"
        }
    }
} | ConvertTo-Json -Depth 10

Invoke-RestMethod `
    -Uri "https://github.com/api/v3/repos/$owner/$repo/dispatches" `
    -Method Post `
    -Headers @{
        Authorization = "Bearer $token"
        Accept = "application/vnd.github+json"
    } `
    -Body $body
