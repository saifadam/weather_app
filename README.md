## Pre-requisites...
1. Cloud provider creds should be configured
2. Access to a k8s cluster is available to deploy the application
example on eks `aws eks --region us-east-1 update-kubeconfig --name saif-eks`
3. The cluster node group should have policy to allow fluentbit agent to send logs to Cloudwatch (on EKS)

## Steps (suggested)
### To deploy service
```
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
```

### Kong installation and ingress controller configuration
```
kubectl create -f https://bit.ly/k4k8s
export PROXY_IP=$(kubectl get -o jsonpath="{.status.loadBalancer.ingress[0].hostname}" service -n kong kong-proxy)
kubectl apply -f k8s/ingress/kong-ingress.yaml (or kong-ingress-jwt.yaml for enabling JWT plugin)
```

### Enabling Rate Limit Plugin
```
kubectl apply -f k8s/ingress/plugins/rate-limit.yaml
```

### (EKS) Configuring Fluentbit to connect to Cloudwatch/ContainerInsights
```
chmod +x k8s/fluent-bit-container-insights.sh
./k8s/fluent-bit-container-insights.sh <cluster-name> <region-name>
```
refer - https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/Container-Insights-prerequisites.html

### (Optional) Enabling JWT
```
  # Enable jwt-auth
  kubectl apply -f k8s/ingress/plugins/jwt-auth.yaml

  kubectl apply -f k8s/ingress/kong-ingress-jwt.yaml

  #Provision Consumers
  kubectl apply -f k8s/ingress/plugins/kong-consumer-admin.yaml

  #Load secret 
  chmod +x k8s/ingress/plugins/admin-jwt-key.sh
  sh k8s/ingress/plugins/admin-jwt-key.sh
```
