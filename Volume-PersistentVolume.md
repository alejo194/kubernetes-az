#### Volume
+ **1.概念**<br/>
1）K8s中的Volume定义在Pod上，然后被一个Pod里的多个容器挂载到具体的文件目录下；<br/>
2）K8s中的Volume与Pod的生命周期相同；<br/>
3）K8s支持多种类型的Volume，如GlusterFS、Ceph等先进的分布式文件系统；<br/>

+ **2.Volume类型**<br/>
***1.emptyDir***<br/>
一个emptyDir Volume是在Pod分配到Node时创建的。<br/>
***2.hostPath***<br/>
***3.gcePersistentDisk***<br/>
***4.awsElasticBlockStore***<br/>
***5.NFS***<br/>
***6.其他类型的Volume***<br/>


#### Persistent Volume
