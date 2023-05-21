


# Create VN
az network vnet create \
    --name \
    --resource-group \
    --address-prefixes 

# Create peering between two VNs
az network vnet peering create \
    --name \
    --remote-vnet \
    --resource-group \
    --vnet-name \
    --allow-vnet-access 

az network vnet peering list \
    --resource-group \
    --vnet-name \
    --query "[].{Name:name, Resource:resourceGroup, PeeringState:peeringState, AllowVnetAccess:allowVirtualNetworkAccess}"\
    --output table

# Check effective routes between NICs
az network nic show-effective-route-table
    --resource-group \
    --name \
    --output table

# List NICs
az network nic list \
    --output table 