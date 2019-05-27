
kubectl -n hadoop-spark create -f hadoop-env-configmap.yaml -f sparkmaster-worker-configmap.yaml

kubectl -n hadoop-spark create -f redis-deployment.yaml -f redis-service.yaml

kubectl -n hadoop-spark create -f sparkmaster-StatefulSet.yaml -f sparkmaster-service.yaml


kubectl -n hadoop-spark create -f worker-StatefulSet-autoscale.yaml

kubectl -n hadoop-spark create -f namenode-StatefulSet.yaml -f namenode-service.yaml



kubectl -n hadoop-spark create -f datanode-StatefulSet.yaml -f datanode-service.yaml



kubectl -n hadoop-spark create -f resourcemanager-StatefulSet.yaml -f resourcemanager-service.yaml



kubectl -n hadoop-spark create -f nodemanager1-StatefulSet.yaml  -f nodemanager1-service.yaml




kubectl -n hadoop-spark create -f historyserver-StatefulSet.yaml -f historyserver-service.yaml

 kubectl -n hadoop-spark create -f hue-deployment.yaml -f hue-service.yaml

 -----------------
 Dashboard per namespace

 $ kubectl -n hadoop-spark apply -f kubernetes-dashboard-role.yaml -n default
$ kubectl -n hadoop-spark apply -f kubernetes-dashboard-rolebinding.yaml -n default
$ kubectl -n hadoop-spark apply -f kubernetes-dashboard-secret.yaml -n default

$ helm install --name dash \
    --namespace hadoop-spark \
    -f values-dashboard.yaml \
    stable/kubernetes-dashboard
