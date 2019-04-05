#Install-Module -Name Az -AllowClobber
#Import-Module -Name Az

#Connect-AzAccount
Get-ChildItem -File -Recurse | Set-AzStorageBlobContent -Container "armtemplates" -Blob "armtemplatesvo"

$context = New-AzureStorageContext -ConnectionString "DefaultEndpointsProtocol=https;AccountName=armstoragevo;AccountKey=KTUASgXDbNLrfXsRZyN8qb27VUBR33ESvLl6gibPBq4rBC3+Gxs+lMTgoGIDOah33L/G7lZwRC2R+D+NvaNjfw==;EndpointSuffix=core.windows.net"
$blobs = Get-AzStorageBlob -Container "armtemplates" -Context $context
Set-AzStorageBlobContent -Blob "armtemplatesvo" -Container "armtemplates" -File ".\main.json" -Force

Get-AzureStorageContainer -Container "armtemplates" | Set-AzureStorageBlobContent -File ".\main.json" -Blob "armtemplatesvo"

Get-AzStorageBlob -Container "armtemplates" -Context $context | select Name

Get-AzureStorageBlob -Container "armtemplatesvo"

Install-Module -Name Az -AllowClobber -Scope CurrentUser