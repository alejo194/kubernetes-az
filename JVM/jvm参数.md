
-Xms </br>
JVM启动时申请的初始Heap值，默认为操作系统物理内存的1/64但小于1G。默认当空余堆内存大于70%时，JVM会减小heap的大小到-Xms指定大小，可通过-XX：MaxHeapFreeRation=来指定这个比例，Server端JVM最好将-Xms和-Xmx设为相同值，避免每次垃圾回收完成后JVM重新分配内存，也可以减少来家回收次数；开发测试机JVM可以保留默认值。（例如：-Xms4g）</br>
-Xms </br>
JVM可以申请的最大heap值，默认值为物理内存的1/4但小于1G。</br>
-Xmn </br>
新生代内存大小 </br>
-Xss </br>
线程绑定栈内存的大小 </br>
