<!--按这个来
http://blog.csdn.net/yin_pengpeng/article/details/62237024
-->

1、General setup 
代码成熟度选项，它又有子项：  
1.1、prompt for development and/or incomplete code/drivers  
该选项是对那些还在测试阶段的代码，驱动模块等的支持。一般应该选这个选项，除非你只是想使用 Linux 中已经完全稳定的东西。但这样有时对系统性能影响挺大。 

暂时选
 
1.2、Cross-compiler tool prefix   
交叉编译工具前缀，例如：Cross-compiler tool prefix值为: (arm-Linux-)  

默认不选
 
1.3、Local version - append to kernel release 
内核显示的版本信息，填入 64字符以内的字符串，你在这里填上的字符口串可以用uname -a命令看到。 

默认不选
 
1.4、 Automatically append version information to the version string 
自动在版本字符串后面添加版本信息,编译时需要有perl以及Git仓库支持 

不选
 
1.5、Kernel compression mode (Gzip) ---> 
有四个选项，这个选项是说内核镜像要用的压缩模式，回车一下，可以看到gzip,bzip2,lzma,lxo,一般可以按默认的gzip,如果要用bzip2,lzma,lxo要先装上支持

默认不选

1.6、Support for paging of anonymous memory (swap)  
使用交换分区或交换文件来做为虚拟内存，一定要选上。 

默认不选

1.7、System V IPC   
表示系统的进程间通信Inter Process Communication，它用于处理器在程序之间同步和交换信息，如果不选这项，很多程序运行不起来。

必选
 
1.8、POSIX Message Queues    
POSIX标准的消息队列，它同样是一种IPC。

默认不选
 
1.9、BSD Process Accounting       
用户进程访问内核时将进程信息写入文件中。通常主要包括进程的创建时间/创建者/内存占用等信息。建议最好选上。 

BSD Process Accounting version 3 file format 
使用新的第三版文件格式,可以包含每个进程的PID和其父进程的PID,但是不兼容老版本的文件格式。 

默认不选

1.10 默认不选

1.11、Export task/process statistics through netlink (EXPERIMENTAL) 
通过netlink接口向用户空间导出任务/进程的统计信息,与BSD Process Accounting的不同之处在于这些统计信息在整个任务/进程生存期都是可用的

Enable per-task delay accounting (EXPERIMENTAL)   
在统计信息中包含进程等候系统资源(cpu,IO同步,内存交换等)所花费的时间 

Enable extended accounting over taskstats (EXPERIMENTAL) 
在统计信息中包含扩展进程所花费的时间 

默认不选

 1.12、Auditing support 
审记支持，用于和内核的某些子模块同时工作，例如Security Enhanced linux。只有选择此项及它的子项，才能调用有关审记的系统调用。 

默认选
 
1.13、Enable system-call auditing support 
 支持对系统调用的审计 

默认选

+1.14 Make audit loginuid immutable

默认不选

1.14、IRQ subsystem  --->   
中断子系统 
    Support sparse irq numbering   
    <=== 支持稀有的中断编号，关闭

默认不选

1.15、RCU Subsystem  --->    
非对称读写锁系统 是一种高性能的kernel 锁机制，适用于读多写少环境 
RCU Implementation (Tree-based hierarchical RCU)  ---> 
RCU 实现机制 Tree(X) Tree-based hierarchical RCU 基本数按等级划分 
Enable tracing for RCU 
激活跟踪 
(32) Tree-based hierarchical RCU fanout value 
基本数按等级划分分列值 
Disable tree-based hierarchical RCU auto-balancing 
 
默认不选

1.16、< > Kernel .config support 
这个选项允许.config文件（即编译LINUX时的配置文件）保存在内核当中 

不选
 
1.17、(17) Kernel log buffer size (16 => 64KB, 17 => 128KB) 
 
1.18、[ ] Control Group support  --->     
cgroups 支持， 文档资料 ，cgroups 主要作用是给进程分组，并可以动态调控进程组的CPU 占用率。比如A 进程分到apple 组，给予20%CPU 占用率，E 进程分easy 组，给予50%CPU 占用率，最高100% 。我目前没有此类应用场景，用到时会选择将其编译进去。 
CPU bandwidth provisioning for FAIR_GROUP_SCHED 
此选项允许用户定义的CPU带宽速率（限制）在公平的组调度运行的任务。组没有限制设置被认为是无约束和运行没有限制。 

Group scheduling for SCHED_RR/FIFO 
此功能可以让您显式地分配真实的CPU带宽任务组。 
 
默认选

+1.18 Checkpoint/restore support

默认不选

1.19、-*- Namespaces support  --->  
命名空间支持，允许服务器为不同的用户信息提供不 同的用户名空间服务 
    [*]   UTS namespace      
    通用终端系统的命名空间。它允许容器，比如Vservers利用UTS命名空间来为不同的服务器提供不同的UTS。如果不清楚，选N。 
    [*]   IPC namespace   
    IPC命名空间，不确定可以不选 
    [*]   User namespace (EXPERIMENTAL) 
    User命名空间，不确定可以不选 
    [*]   PID Namespaces   
    PID命名空间，不确定可以不选 
    [*]   Network namespace   

默认不选

1.20、Automatic process group scheduling    自动进程组调度 

默认不选
 
1.21、[ ] enable deprecated sysfs features to support old userspace tools 

默认不选不选 

1.22、-*- Kernel->user space relay support (formerly relayfs)   
在某些文件系统上( 比如debugfs ) 提供从内核空间向用户空间传递大量数据的接口，我目前没有此类应用场景 

默认不选
 
1.23、   [*] Initial RAM filesystem and RAM disk (initramfs/initrd) support    
用于在真正内核装载前，做一些操作（俗称两阶段启动），比如加载module ，mount 一些非root 分区，提供灾难恢复shell 环境等， 资料 ，我是期望直接从kernel image 直接启动，所以没选它 

不选

<!--1.24、Initramfs source file(s)    
initrd已经被initramfs取代,如果你不明白这是什么意思,请保持空白 -->
 
1.25、Optimize for size 
这个选项将在GCC 命令后用 “-Os ” 代替 “-O2 ″参数，这样可以得到更小的内核。没必要选。选上了有时会产生错误的二进制代码。 

默认不选
 
1.26、Enable full-sized data structures for core：在内核中使用全尺寸的数据结构.禁用它将使得某些内核的数据结构减小以节约内存,但是将会降低性能。 

默认选
 
1.27、Enable futex support：快速用户空间互斥体可以使线程串行化以避免竞态条件,也提高了响应速度.禁用它将导致内核不能正确的运行基于glibc的程序。 

默认选
 
1.28、Enable eventpoll support：支持事件轮循的系统调用。 

默认选

+1.28 Enable signalfd() system call

+1.28 Enable timerfd() system call

+1.28 Enable eventfd() system call

以上系统调用都用不到，不选

1.29、Use full shmem filesystem：除非你在很少的内存且不使用交换内存时，才不要选择这项。后面的这四项都是在编译时内存中的对齐方式，0 表示 
编译器的默认方式。使用内存对齐能提高程序的运行速度，但是会增加程序对内存的使用量。内核也是一组程序呀。 

Enable VM event counters for /proc/vmstat：允许在/proc/vmstat中包含虚拟内存事件记数器。 
[*] Disable heap randomization 
禁用随机heap（heap堆是一个应用层的概念，即堆对CPU是不可见的，它的实现方式有多种，可以由OS实现，也可以由运行库实现,如果你愿意，你也可以在一个栈中来实现一个堆） 

默认选

+1.29 Enable AIO support
默认不选

+1.29 Embedded system
不选

+1.29 Kernel Performance Events And Counters
不选

+1.29 Enable VM event counters for /proc/vmstat

不选

+1.29 Enable SLUB  debugging support
不选

+1.29 Display heap randomization



 
1.30、Choose SLAB allocator (SLAB)  ---> 
选择内存分配管理器（强烈推荐使用SLUB） 

<!--
1.31、[ ] Configure standard kernel features (for small systems)  --- >  
这个选项可以让内核的基本选项和设置无效或者扭曲。这是用于特定环境中的，它允许“非标准”内核。你要是选它，你一定要明白自己在干什么。这是为了编译某 些特殊用途的内核使用的，例如引导盘系统。配置标准的内核特性(为小型系统) 
    Enable 16-bit UID system calls：允许对UID系统调用进行过时的16-bit包装。 
    Sysctl syscall support  几乎使用不到这一选项，不选它可以轻微使内核变小 
    Include all symbols in kallsyms：在kallsyms中包含内核知道的所有符号,内核将会增大300K。 
    Enable support for printk：允许内核向终端打印字符信息,在需要诊断内核为什么不能运行时选择。 
    BUG() support：显示故障和失败条件(BUG 和WARN),禁用它将可能导致隐含的错误被忽略。 
    Enable ELF core dumps：内存转储支持,可以帮助调试ELF格式的程序。 
 -->

1.32、[ ] Profiling support 
不选剖面支持，用一个工具来扫描和提供计算机的剖面图。支持系统评测（对于大多数用户来说并不是必须的）

不选 
 
<!--1.33、OProfile system profiling 
OProfile评测和性能监控工具 
 
1.35、[ ]   OProfile multiplexing support (EXPERIMENTAL)   -->
 
1.34、Kprobes 
调试内核除非开发人员，否则不选 

不选

 
1.35、Optimize trace point call sites   

不选 

1.36、GCOV-based kernel profiling  
        [ ] Enable gcov-based kernel profiling 不选 


2、Enable loadable module support   

整个不选

2.1 Forced module loading  
允许强制加载模块 
 
2.2 Module unloading   
允许卸载已经加载的模块 
 
2.3 Forced module unloading 
允许强制卸载正在使用中的模块(比较危险)这个选项允许你强行卸除模块，即使内核认为这不安全。内核将会立即移除模块，而不管是否有人在使用它（用 rmmod -f 命令）。这主要是针对开发者和冲动的用户提供的功能。如果不清楚，选N。 
 
2.4 Module versioning support 
有时候，你需要编译模块。选这项会添加一些版本信息，来给编译的模块提供独立的特性，以使不同的内核在使用同一模块时区别于它原有的模块。这有时可能会有点用。如果不清楚，选N。允许使用其他内核版本的模块(可能会出问题) 
 
2.5 Source checksum for all modules 
为所有的模块校验源码,如果你不是自己编写内核模块就不需要它这个功能是为了防止你在编译模块时不小心更改了内核模块的源代码但忘记更改版本号而造成版本冲突。如果不清楚，选N。 


3、Enable the block layer  
     块设备支持,使用硬盘/USB/SCSI设备者必选这选项使得块设备可以从内核移除。如果不选，那么 blockdev 文件将不可用，一些文件系统比如 ext3 将不可用。这个选项会禁止 SCSI 字符设备和 USB 储存设备，如果它们使用不同的块设备。选Y，除非你知道你不需要挂载硬盘和其他类似的设备。不过此项无可选项 
 
3.1 Support for large (2TB+) block devices and files 
仅在使用大于2TB的块设备时需要 

不选
 
3.2 Block layer SG support v4 
通用scsi块设备第4版支持 
选上
 
3.3 Block layer data integrity support  
块设备数据完整性支持 

不选
 
3.4 Block layer bio throttling support  
可用于限制设备的IO速度 

不选

3.5 Partition Types 
    Advanced partition selection 
    如果你想要在linux上使用一个在其他的介质上运行着操作系统的硬盘时，选择Y，如果你不确定时可以选N 
    
不选
 
3.6 IO Schedulers 
    IO调度器I／O是输入输出带宽控制，主要针对硬盘，是核心的必须的东西。这里提供了三个IO调度器。 
    
 Deadline I/O scheduler  
 使用轮询的调度器,简洁小巧,提供了最小的读取延迟和尚佳的吞吐量,特别适合于读取较多的环境(比如数据库)Deadline I／O调度器简单而又紧密，在性能上和抢先式调度器不相上下，在一些数据调入时工作得更好。至于在单进程I／O磁盘调度上，它的工作方式几乎和抢先式调度器相同，因此也是一个好的选择。 

 CFQ I/O scheduler 
 使用QoS策略为所有任务分配等量的带宽,避免进程被饿死并实现了较低的延迟,可以认为是上述两种调度器的折中.适用于有大量进程的多用户系统CFQ调度器尝试为所有进程提供相同的带宽。它将提供平等的工作环境，对于桌面系统很合适。 

 Default I/O scheduler (CFQ) 
 默认IO调度器我这样理解上面三个IO调度器： 
抢先式是传统的，它的原理是一有响应，就优先考虑调度。如果你的硬盘此时在运行一项工作，它也会暂停下来先响应用户。    期限式则是：所有的工作都有最终期限，在这之前必须完成。当用户有响应时，它会根据自己的工作能否完成，来决定是否响应用户。    CFQ则是平均分配资源，不管你的响应多急，也不管它的工作量是多少，它都是平均分配，一视同仁的。 
( *) Deadline     
(  ) CFQ   
(  ) No-op 

4、System Type
未动

5、FIQ Mode Serial Debugger
不选

6、Bus Support
 PCCcard Support
 不选

7、kernel Features
未动

8、Boot Options
不选

9、CPU Power Management


 CPU Frequency scaling
 
 
 CPU idle PM support
 都不选

10、Floating point emulation 选一个
VFP-format floating point maths

11、userpace 

12、power management options
 12.1 Suspend to ram and standly
 待机 选择
 
 12.2 Run-time PM core functionality
 不选

 12.3 power management debug support
 不选

 12.4 Advanced power management emulation
 选择

 12.5 Log time spend in suspend
 不选
