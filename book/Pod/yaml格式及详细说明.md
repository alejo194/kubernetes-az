```bash
apiVersion: v1
kind: Pod
metadata:
  name: string
  namespace: string
  labels:
    - name: string
  annotations:
    - name: string
spec:
  containers:
    - name: string
      image: string
      imagePullPolicy: [Always | Never | IfNotPresent]
      command: [string]
      args: [string]
      workingDir: string
      volumeMounts:
        - name: string
          mountPath: string
          readOnly: string
      port:
        - name: string
          containerPort: int
          hostPort: int
          protocol: string
      env:
        - name: string
          value: string
      resources:
        limits:
          cpu: string
          memory: string
        requests:
          cpu: string
          memory: string
      livenessProbe:
        exec:
          command: [string]
        httpGet:
          path: string
          port: number
          host: string
          scheme: string
          httpHeaders:
            - name: string
              value: string
          tcpSocket:
            port: number
          initialDelaySeconds: 0
          timeoutSeconds: 0
          periodSeconds: 0
          successThreshold: 0
          failureThreshold: 0
      securityContext:
        privileged: false
  restartPolicy: [Always | Never | OnFailure]
  nodeSelector: object
  imagePullSecrets:
    - name: string
  hostNetwork: false
  volumes:
    - name: string
      emptyDir: {}
      hostPath:
        path: string
      secret:
        secretName: string
        items:
          - key: string
            path: string
      configMap:
        name: string
        items:
          - key: string
            path: string
```

#### 对Pod定义文件模板中各属性的详细说明
```bash
apiVersion   String   版本号，例如v1
kind   String   Pod
metadata  Object  元数据
metadata.name   String   Pod的名称，命名规范需符合RFC 1035规范
metadata.namespace   String  Pod所属的命令空间，默认为“default”
metadata.labels[]   List    自定义标签列表
metadata.annotation[]   List   自定义注解列表
Spec    Object    Pod中容器的详细定义
spec.containers[]   List    Pod中的容器列表
spec.containers[].name    String   容器的名称，需符合RFC 1035规范
spec.containers[].image   String   容器的镜像名称
spec.containers[].imagePullPolicy    String    获取镜像的策略，可选值包括：Always、Never、IfNotPresent,默认值为Always.
                                               Always: 表示每次都尝试重新下载镜像。
                                               IfNotPresent：表示如果本地有该镜像，则使用本地镜像，本地不存在时下载镜像。
                                               Never：表示仅使用本地镜像
spec.containers[].command[]     List     容器的启动命令列表，如果不指定，则使用镜像打包时使用的启动命令
spec.containers[].args[]       List      容器的启动命令参数列表
spec.containers[].workingDir    String   容器的工作目录
spec.containers[].volumeMounts[]    List   挂载到容器内部的存储卷配置
spec.containers[].volumeMounts[].name   String   引用Pod定义的共享存储卷的名称，需使用volumes[]部分定义的共享存储卷名称
spec.containers[].volumeMounts[].mountPath   String   存储卷在容器内Mount的绝对路径，应少于512个字符
spec.containers[].volumeMounts[].readOnly    Boolean   是否为只读模式，默认为读写模式
spec.containers[].ports[]      List     容器需要暴露的端口号列表
spec.containers[].ports[].name    String   端口的名称
spec.containers[].ports[].containerPort   Int   容器需要监听的端口号
spec.containers[].ports[].hostPort     Int    容器所在主机需要监听的端口号，默认与containerPort相同。设置hostPort时，同一台宿主机将
                                              无法启动该容器的第2份副本
spec.containers[].ports[].protocol    String   端口协议，支持TCP和UDP，默认为TCP
spec.containers[].env[]           List     容器运行前需设置的环境变量列表
spec.containers[].env[].name      String   环境变量的名称
spec.containers[].env[].value     String   环境变量的值
spec.containers[].resources       Object   资源限制和资源请求的设置
spec.containers[].resources.limits   Object  资源限制的设置
spec.containers[].resources.limits.cpu    String    CPU限制，单位为core数，将用于docker run --cpu-shares参数
spec.containers[].resources.limits.memory   String   内存限制，单位可以为MiB/GiB等，将用于docker run --memory参数
spec.containers[].resources.requests Object   资源限制的设置
spec.containers[].resources.requests.cpu    String    CPU请求，单位为core数，容器启动的初始可用数量
spec.containers[].resources.requests.memory   String   内存请求，单位可以为MiB，GiB等，容器启动的初始可用数量
spec.volumes[]       List    在该Pod上定义的共享存储卷列表
spec.volumes[].name    String     共享存储卷的名称，在一个Pod中每个存储卷定义一个名称。容器定义部分的containers[].volumeMounts[].name
                                  将引用该共享存储卷的名称。
                                  volume的类型包括：emptyDir、hostPath、gecPersistentDisk、awsElasticBlockStore、gitRepo、secret、nfs、
                                  iscsi、glusterfs、persistentVolumeClaim、rbd、flexVolume、cinder、cephfs、flocker、downwardAPI、fc、
                                  azureFile、configMap、vsphereVolume,可以定义多个volume,每个volume的name保持唯一。
spec.volumes[].emptyDir    Object    类型为emptyDir的存储卷，表示与Pod同生命周期的一个临时目录，其值为一个空对象：emptyDir:{}
spec.volumes[].hostPath    Object    类型为hostPath的存储卷，表示挂载Pod宿主机的目录，通过volumes[].hostPath.path指定
spec.volumes[].hostPath.path   String    Pod所在主机的目录，将被用于容器中mount的目录
spec.volumes[].secret     Object     类型为secret的存储卷，表示挂载集群预定义的secret对象到容器内部
spec.volumes[].configMap    Object   类型为configMap的存储卷，表示挂载集群预定义的configMap对象到容器内部
spec.volumes[].livenessProbe    Object   对Pod内各容器健康检查的设置，当探测无响应几次之后，系统将自动重启该容器。可以设置的方法包括：exec、
                                         httpGet和tcpSocket。对一个容器仅需设置一种健康检查方法
spec.volumes[].livenessProbe.exec      Object   对Pod内各容器健康检查的设置，exec方法
spec.volumes[].livenessProbe.exec.command[]   String    exec方式需要指定的命令或脚本
spec.volumes[].livenessProbe.httpGet    Object   对Pod内各容器健康检查的设置，HTTPGet方式。需指定path、port
sepc.volumes[].livenessProbe.tcpSocket    Object   对Pod内各容器健康检查的设置，tcpSocket方式
spec.volumes[].livenessProbe.initialDelaySeconds   Number     容器启动完成后进行首次探测的时间，单位为秒
spec.volumes[].livenessProbe.timeoutSeconds     Number        对容器健康检查的探测等待响应的超时时间设置，单位为秒，默认为1秒。超过该超时
                                                              时间设置，将认为该容器不健康，将重启该容器。
spec.volumes[].livenessProbe.periodSeconds     Number         对容器健康检查的定期探测时间设置，单位为秒。默认为10秒探测一次
spec.restartPolicy    String    Pod的重启策略，可选值为Always、OnFailure，默认为Always。
                                Always: Pod一旦终止运行，则无论容器是如何终止的，kubelet都将重启它。
                                OnFailure: 只有Pod以非零退出码终止时，kubelet才会重启该容器。如果容器正常退出（退出码为0），kubelet不会重启它
                                Never: Pod终止后，kubelet将退出码报告给Master,不会再重启该Pod
spec.nodeSelector    Object     设置NodeSelector表示将该Pod调度到包含这些label的Node上，以key:value格式指定
spec.imagePullSecrets   Object   Pull镜像时使用的secret名称，以name:secretkey格式指定
spec.hostNetwork     Boolean    是否使用主机网络模式，默认为false.如果设置为true,这表示容器使用宿主机网络，不再使用docker 网桥，该Pod将无法在
                                同一台宿主机上启动第2个副本
```
