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
spec.containers[].ports[].protocol    String   
```
