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
```
