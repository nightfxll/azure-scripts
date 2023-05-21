# list VMs

az vm list \
    --resource-group \
    --query "[*].{Name:name, PrivateIP:privateIps, PublicIP: publicIps}" \
    --show-details \
    --output table

