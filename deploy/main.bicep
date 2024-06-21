@description('Location for all resources.')
param location string = resourceGroup().location

@description('Import VNET module file that deploys all VNETs and VNET peerings')
module vnetModule 'vnetModule.bicep' = {
  name: 'vnetModuleDeployment'
  params: {
    location: location
  }
}

