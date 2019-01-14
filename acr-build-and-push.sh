# AZURE PARAMETERS
SUBSCRIPTIONID={subscriptionId}
ACRNAME={azureContainerRegistryName}
DOCKERIMAGE={dockerImageName:withTag}

# SCRIPT
az account set -s $SUBSCRIPTIONID
az acr build -r $ACRNAME --image $DOCKERIMAGE ./src