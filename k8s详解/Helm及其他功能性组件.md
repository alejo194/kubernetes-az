##### 什么是Helm
> Helm本质就是让K8s的应用管理（Deployment,Service等）可配置，能动态生成。通过动态生成K8s资源清单文件（deployment.yaml,service.yaml）。
然后调用Kubectl自动执行K8s资源部署
```bash
    helm install -n zk zookeeper .
    helm delete -n zk zookeeper
    helm install -n zk zookeeper .
    helm install -n zk kafka .
    helm list
    helm repo list
```

##### dashboard

##### prometheus
相关地址信息
> Prometheus github 地址： https://github.com/coreos/kube-prometheus

组件说明
> 1.MetricServer: 是kubernetes集群资源使用情况的聚合器，收集数据给kubernetes集群内使用，如kubectl,pha,schedule等。
> 2.PrometheusOperator：是一个系统监测和警报工具箱，用来存储监控数据。
> 3.NodeExporter：用于各node的关键度量指标状态数据。
> 4.KubeStateMetrics：收集kubernetes集群内资源对象数据，制定警告规则。
> 5.Prometheus: 采用pull方式收集apiserver, scheduler, controller-manager, kubelet组件数据，通过http协议传输。
> 6.Grafana: 是可视化数据统计和监控平台。

##### ELK
