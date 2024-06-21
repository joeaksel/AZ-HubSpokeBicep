/// Hub and Spoke VNETs

@description('Location for all resources.')
param location string = resourceGroup().location

@description('Hub vnet that all spoke vnets will peer with')
resource hubvnet 'Microsoft.Network/virtualNetworks@2023-11-01' = {
  name: 'hubvnet'
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.0.0.0/16'
      ]
    }
    subnets: [
      {
        name: 'hubsubnet'
        properties: {
          addressPrefix: '10.0.1.0/24'
        }
      }
    ]
  }
}

@description('Spoke 1 production vnet')
resource spoke1vnet 'Microsoft.Network/virtualNetworks@2023-11-01' = {
  name: 'spoke1vnet'
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.1.0.0/16'
      ]
    }
    subnets: [
      {
        name: 'spoke1subnet'
        properties: {
          addressPrefix: '10.1.1.0/24'
        }
      }
    ]
  }
}

@description('Spoke 2 production vnet')
resource spoke2vnet 'Microsoft.Network/virtualNetworks@2023-11-01' = {
  name: 'spoke2vnet'
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.2.0.0/16'
      ]
    }
    subnets: [
      {
        name: 'spoke2subnet'
        properties: {
          addressPrefix: '10.2.1.0/24'
        }
      }
    ]
  }
}

@description('Spoke 3 production vnet')
resource spoke3vnet 'Microsoft.Network/virtualNetworks@2023-11-01' = {
  name: 'spoke3vnet'
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.3.0.0/16'
      ]
    }
    subnets: [
      {
        name: 'spoke3subnet'
        properties: {
          addressPrefix: '10.3.1.0/24'
        }
      }
    ]
  }
}

/// VNet Peerings

@description('Peer hubvnet with spoke1vnet')
resource hubvnetToSpoke1vnet 'Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2023-11-01' = {
  parent: hubvnet
  name: 'hubToSpoke1Peering'
  properties: {
    allowVirtualNetworkAccess: true
    allowForwardedTraffic: false
    allowGatewayTransit: false
    useRemoteGateways: false
    remoteVirtualNetwork: {
      id: spoke1vnet.id
    }
  }
}

@description('Peer spoke1vnet with hubvnet')
resource spoke1ToHubPeering 'Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2023-11-01' = {
  parent: spoke1vnet
  name: 'spokeToHubPeering'
  properties: {
    allowVirtualNetworkAccess: true
    allowForwardedTraffic: false
    allowGatewayTransit: false
    useRemoteGateways: false
    remoteVirtualNetwork: {
      id: hubvnet.id
    }
  }
}

@description('Peer hubvnet with spoke2vnet')
resource hubvnetToSpoke2vnet 'Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2023-11-01' = {
  parent: hubvnet
  name: 'hubToSpoke2Peering'
  properties: {
    allowVirtualNetworkAccess: true
    allowForwardedTraffic: false
    allowGatewayTransit: false
    useRemoteGateways: false
    remoteVirtualNetwork: {
      id: spoke2vnet.id
    }
  }
}

@description('Peer spoke2vnet with hubvnet')
resource spoke2ToHubPeering 'Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2023-11-01' = {
  parent: spoke2vnet
  name: 'spokeToHubPeering'
  properties: {
    allowVirtualNetworkAccess: true
    allowForwardedTraffic: false
    allowGatewayTransit: false
    useRemoteGateways: false
    remoteVirtualNetwork: {
      id: hubvnet.id
    }
  }
}

@description('Peer hubvnet with spoke3vnet')
resource hubvnetToSpoke3vnet 'Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2023-11-01' = {
  parent: hubvnet
  name: 'hubToSpoke3Peering'
  properties: {
    allowVirtualNetworkAccess: true
    allowForwardedTraffic: false
    allowGatewayTransit: false
    useRemoteGateways: false
    remoteVirtualNetwork: {
      id: spoke3vnet.id
    }
  }
}

@description('Peer spoke3vnet with hubvnet')
resource spoke3ToHubPeering 'Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2023-11-01' = {
  parent: spoke3vnet
  name: 'spokeToHubPeering'
  properties: {
    allowVirtualNetworkAccess: true
    allowForwardedTraffic: false
    allowGatewayTransit: false
    useRemoteGateways: false
    remoteVirtualNetwork: {
      id: hubvnet.id
    }
  }
}



@description('Outputs')
output hubvnetId string = hubvnet.id
output spoke1vnetId string = spoke1vnet.id
output spoke2vnetId string = spoke2vnet.id
output spoke3vnetId string = spoke3vnet.id
output hubvnetToSpoke1vnetId string = hubvnetToSpoke1vnet.id
output hubvnetToSpoke2vnetId string = hubvnetToSpoke2vnet.id
output hubvnetToSpoke3vnetId string = hubvnetToSpoke3vnet.id
