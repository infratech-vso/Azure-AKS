Param
(
    [Parameter (Mandatory= $true)]
    [string]$AKSResourceGroup,
    [Parameter (Mandatory= $true)]
    [string]$AKSName,
    [Parameter (Mandatory= $true)]
    [string]$subscriptionID,
    [Parameter (Mandatory= $true,HelpMessage="start or stop")]
    [string]$Action
)

Connect-AzAccount -Identity
Set-AzContext -SubscriptionId $subscriptionID

if ($Actig -eq "start") {
    Get-AzAksCluster -Name $AKSName -ResourceGroupName $AKSResourceGroup
    ####################
    Start-AzAksCluster -Name $AKSName -ResourceGroupName $AKSResourceGroup
}
elseif ($Action -eq "stop") {
    Get-AzAksCluster -Name $AKSName -ResourceGroupName $AKSResourceGroup
    ####################
    Stop-AzAksCluster -Name $AKSName -ResourceGroupName $AKSResourceGroup
}
