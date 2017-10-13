## Hadoop Cluster Launch Issue ##

Hadoop Job is started with the following command:
[root@host3 h2o-3.14.0.6-hdp2.6]# sudo -u hdfs hadoop jar h2odriver.jar -nodes 3 -mapperXmx 6g -output h2o-test

### Root Cause ###
2017-10-13 07:49:22,079 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskAttemptImpl: Job jar is not present. Not adding any jar to the list of resources.

### Reason ###
The h2odriver.jar is not accessible when you pass the "hadoop har h2odriver.jar" command.

### Solution ###
1. Make sure h2odriver.jar is accessible from the folder where you are launching the hadoop command.
2. It is not suggested to launch "hadoop" commands as SUDO or ROOT user. You should manage your cluster in a way, that you can launch all of these commands as regular user. 

This is how the command was issues:

```
[root@host3 h2o-3.14.0.6-hdp2.6]# sudo -u hdfs hadoop jar h2odriver.jar -nodes 3 -mapperXmx 6g -output h2o-test
Determining driver host interface for mapper->driver callback...
[Possible callback IP address: 192.168.20.35]
[Possible callback IP address: 127.0.0.1]
Using mapper->driver callback IP address and port: 192.168.20.35:46619
(You can override these with -driverif and -driverport/-driverportrange.)
Memory Settings:
mapreduce.map.java.opts:     -Xms6g -Xmx6g -verbose:gc -XX:+PrintGCDetails -XX:+PrintGCTimeStamps -Dlog4j.defaultInitOverride=true
Extra memory percent:        10
mapreduce.map.memory.mb:     6758
17/10/13 07:49:14 INFO client.RMProxy: Connecting to ResourceManager at host2/192.168.20.34:8050
17/10/13 07:49:14 INFO client.AHSProxy: Connecting to Application History server at host2/192.168.20.34:10200
17/10/13 07:49:15 WARN mapreduce.JobResourceUploader: No job jar file set.  User classes may not be found. See Job or Job#setJar(String).

17/10/13 07:49:15 INFO mapreduce.JobSubmitter: number of splits:3
17/10/13 07:49:15 INFO mapreduce.JobSubmitter: Submitting tokens for job: job_1507793796947_0002
17/10/13 07:49:15 INFO mapred.YARNRunner: Job jar is not present. Not adding any jar to the list of resources.
17/10/13 07:49:15 INFO impl.YarnClientImpl: Submitted application application_1507793796947_0002
17/10/13 07:49:15 INFO mapreduce.Job: The url to track the job: http://host2:8088/proxy/application_1507793796947_0002/
Job name 'H2O_86929' submitted
JobTracker job ID is 'job_1507793796947_0002'
For YARN users, logs command is 'yarn logs -applicationId application_1507793796947_0002'
Waiting for H2O cluster to come up...
17/10/13 07:49:29 INFO client.RMProxy: Connecting to ResourceManager at host2/192.168.20.34:8050
17/10/13 07:49:29 INFO client.AHSProxy: Connecting to Application History server at host2/192.168.20.34:10200

----- YARN cluster metrics -----
Number of YARN worker nodes: 3

----- Nodes -----
Node: http://host5:8042 Rack: /default-rack, RUNNING, 1 containers used, 4,0 / 16,0 GB used, 1 / 3 vcores used
Node: http://host4:8042 Rack: /default-rack, RUNNING, 0 containers used, 0,0 / 16,0 GB used, 0 / 3 vcores used
Node: http://host3:8042 Rack: /default-rack, RUNNING, 0 containers used, 0,0 / 16,0 GB used, 0 / 3 vcores used

----- Queues -----
Queue name:            default
Queue state:       RUNNING
Current capacity:  0,11
Capacity:          1,00
Maximum capacity:  1,00
Application count: 1
----- Applications in this queue -----
Application ID:                  application_1507793796947_0002 (H2O_86929)
    Started:                     hdfs (Fri Oct 13 07:49:15 CEST 2017)
    Application state:           FINISHED
    Tracking URL:                http://host2:8088/proxy/application_1507793796947_0002/
    Queue name:                  default
    Used/Reserved containers:    1 / 0
    Needed/Used/Reserved memory: 4,0 GB / 4,0 GB / 0,0 GB
    Needed/Used/Reserved vcores: 1 / 1 / 0

Queue 'default' approximate utilization: 4,0 / 48,0 GB used, 1 / 9 vcores used

----------------------------------------------------------------------

ERROR: Unable to start any H2O nodes; please contact your YARN administrator.

   A common cause for this is the requested container size (6,6 GB)
   exceeds the following YARN settings:

       yarn.nodemanager.resource.memory-mb
       yarn.scheduler.maximum-allocation-mb
```

This is the YARN log:

```

Logged in as: dr.who 
Application
About
Jobs
Tools
Log Type: syslog
Log Upload Time: Fr Okt 13 07:49:32 +0200 2017
Log Length: 38482
2017-10-13 07:49:16,996 INFO [main] org.apache.hadoop.mapreduce.v2.app.MRAppMaster: Created MRAppMaster for application appattempt_1507793796947_0002_000001
2017-10-13 07:49:17,168 WARN [main] org.apache.hadoop.util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
2017-10-13 07:49:17,193 INFO [main] org.apache.hadoop.security.SecurityUtil: Updating Configuration
2017-10-13 07:49:17,202 INFO [main] org.apache.hadoop.mapreduce.v2.app.MRAppMaster: Executing with tokens:
2017-10-13 07:49:17,202 INFO [main] org.apache.hadoop.mapreduce.v2.app.MRAppMaster: Kind: YARN_AM_RM_TOKEN, Service: , Ident: (appAttemptId { application_id { id: 2 cluster_timestamp: 1507793796947 } attemptId: 1 } keyId: 505950196)
2017-10-13 07:49:17,430 INFO [main] org.apache.hadoop.mapreduce.v2.app.MRAppMaster: Using mapred newApiCommitter.
2017-10-13 07:49:17,431 INFO [main] org.apache.hadoop.mapreduce.v2.app.MRAppMaster: OutputCommitter set in config null
2017-10-13 07:49:17,465 INFO [main] org.apache.hadoop.mapreduce.lib.output.FileOutputCommitter: File Output Committer Algorithm version is 1
2017-10-13 07:49:17,466 INFO [main] org.apache.hadoop.mapreduce.lib.output.FileOutputCommitter: FileOutputCommitter skip cleanup _temporary folders under output directory:false, ignore cleanup failures: false
2017-10-13 07:49:17,997 WARN [main] org.apache.hadoop.hdfs.shortcircuit.DomainSocketFactory: The short-circuit local reads feature cannot be used because libhadoop cannot be loaded.
2017-10-13 07:49:18,006 INFO [main] org.apache.hadoop.mapreduce.v2.app.MRAppMaster: OutputCommitter is org.apache.hadoop.mapreduce.lib.output.FileOutputCommitter
2017-10-13 07:49:18,143 INFO [main] org.apache.hadoop.yarn.event.AsyncDispatcher: Registering class org.apache.hadoop.mapreduce.jobhistory.EventType for class org.apache.hadoop.mapreduce.jobhistory.JobHistoryEventHandler
2017-10-13 07:49:18,143 INFO [main] org.apache.hadoop.yarn.event.AsyncDispatcher: Registering class org.apache.hadoop.mapreduce.v2.app.job.event.JobEventType for class org.apache.hadoop.mapreduce.v2.app.MRAppMaster$JobEventDispatcher
2017-10-13 07:49:18,144 INFO [main] org.apache.hadoop.yarn.event.AsyncDispatcher: Registering class org.apache.hadoop.mapreduce.v2.app.job.event.TaskEventType for class org.apache.hadoop.mapreduce.v2.app.MRAppMaster$TaskEventDispatcher
2017-10-13 07:49:18,144 INFO [main] org.apache.hadoop.yarn.event.AsyncDispatcher: Registering class org.apache.hadoop.mapreduce.v2.app.job.event.TaskAttemptEventType for class org.apache.hadoop.mapreduce.v2.app.MRAppMaster$TaskAttemptEventDispatcher
2017-10-13 07:49:18,144 INFO [main] org.apache.hadoop.yarn.event.AsyncDispatcher: Registering class org.apache.hadoop.mapreduce.v2.app.commit.CommitterEventType for class org.apache.hadoop.mapreduce.v2.app.commit.CommitterEventHandler
2017-10-13 07:49:18,145 INFO [main] org.apache.hadoop.yarn.event.AsyncDispatcher: Registering class org.apache.hadoop.mapreduce.v2.app.speculate.Speculator$EventType for class org.apache.hadoop.mapreduce.v2.app.MRAppMaster$SpeculatorEventDispatcher
2017-10-13 07:49:18,145 INFO [main] org.apache.hadoop.yarn.event.AsyncDispatcher: Registering class org.apache.hadoop.mapreduce.v2.app.rm.ContainerAllocator$EventType for class org.apache.hadoop.mapreduce.v2.app.MRAppMaster$ContainerAllocatorRouter
2017-10-13 07:49:18,146 INFO [main] org.apache.hadoop.yarn.event.AsyncDispatcher: Registering class org.apache.hadoop.mapreduce.v2.app.launcher.ContainerLauncher$EventType for class org.apache.hadoop.mapreduce.v2.app.MRAppMaster$ContainerLauncherRouter
2017-10-13 07:49:18,168 INFO [main] org.apache.hadoop.mapreduce.v2.jobhistory.JobHistoryUtils: Default file system is set solely by core-default.xml therefore -  ignoring
2017-10-13 07:49:18,187 INFO [main] org.apache.hadoop.mapreduce.v2.jobhistory.JobHistoryUtils: Default file system is set solely by core-default.xml therefore -  ignoring
2017-10-13 07:49:18,205 INFO [main] org.apache.hadoop.mapreduce.v2.jobhistory.JobHistoryUtils: Default file system is set solely by core-default.xml therefore -  ignoring
2017-10-13 07:49:18,225 INFO [main] org.apache.hadoop.mapreduce.jobhistory.JobHistoryEventHandler: Emitting job history data to the timeline server is not enabled
2017-10-13 07:49:18,253 INFO [main] org.apache.hadoop.yarn.event.AsyncDispatcher: Registering class org.apache.hadoop.mapreduce.v2.app.job.event.JobFinishEvent$Type for class org.apache.hadoop.mapreduce.v2.app.MRAppMaster$JobFinishEventHandler
2017-10-13 07:49:18,303 WARN [main] org.apache.hadoop.metrics2.impl.MetricsConfig: Cannot locate configuration: tried hadoop-metrics2-mrappmaster.properties,hadoop-metrics2.properties
2017-10-13 07:49:18,358 INFO [main] org.apache.hadoop.metrics2.impl.MetricsSystemImpl: Scheduled snapshot period at 10 second(s).
2017-10-13 07:49:18,358 INFO [main] org.apache.hadoop.metrics2.impl.MetricsSystemImpl: MRAppMaster metrics system started
2017-10-13 07:49:18,365 INFO [main] org.apache.hadoop.mapreduce.v2.app.job.impl.JobImpl: Adding job token for job_1507793796947_0002 to jobTokenSecretManager
2017-10-13 07:49:18,470 INFO [main] org.apache.hadoop.mapreduce.v2.app.job.impl.JobImpl: Not uberizing job_1507793796947_0002 because: not enabled; too much RAM;
2017-10-13 07:49:18,481 INFO [main] org.apache.hadoop.mapreduce.v2.app.job.impl.JobImpl: Input size for job job_1507793796947_0002 = 0. Number of splits = 3
2017-10-13 07:49:18,481 INFO [main] org.apache.hadoop.mapreduce.v2.app.job.impl.JobImpl: Number of reduces for job job_1507793796947_0002 = 0
2017-10-13 07:49:18,481 INFO [main] org.apache.hadoop.mapreduce.v2.app.job.impl.JobImpl: job_1507793796947_0002Job Transitioned from NEW to INITED
2017-10-13 07:49:18,482 INFO [main] org.apache.hadoop.mapreduce.v2.app.MRAppMaster: MRAppMaster launching normal, non-uberized, multi-container job job_1507793796947_0002.
2017-10-13 07:49:18,500 INFO [main] org.apache.hadoop.ipc.CallQueueManager: Using callQueue: class java.util.concurrent.LinkedBlockingQueue scheduler: class org.apache.hadoop.ipc.DefaultRpcScheduler
2017-10-13 07:49:18,509 INFO [Socket Reader #1 for port 34213] org.apache.hadoop.ipc.Server: Starting Socket Reader #1 for port 34213
2017-10-13 07:49:18,551 INFO [main] org.apache.hadoop.yarn.factories.impl.pb.RpcServerFactoryPBImpl: Adding protocol org.apache.hadoop.mapreduce.v2.api.MRClientProtocolPB to the server
2017-10-13 07:49:18,551 INFO [IPC Server Responder] org.apache.hadoop.ipc.Server: IPC Server Responder: starting
2017-10-13 07:49:18,551 INFO [IPC Server listener on 34213] org.apache.hadoop.ipc.Server: IPC Server listener on 34213: starting
2017-10-13 07:49:18,552 INFO [main] org.apache.hadoop.mapreduce.v2.app.client.MRClientService: Instantiated MRClientService at host5/192.168.20.37:34213
2017-10-13 07:49:18,619 INFO [main] org.mortbay.log: Logging to org.slf4j.impl.Log4jLoggerAdapter(org.mortbay.log) via org.mortbay.log.Slf4jLog
2017-10-13 07:49:18,626 INFO [main] org.apache.hadoop.security.authentication.server.AuthenticationFilter: Unable to initialize FileSignerSecretProvider, falling back to use random secrets.
2017-10-13 07:49:18,630 INFO [main] org.apache.hadoop.http.HttpRequestLog: Http request log for http.requests.mapreduce is not defined
2017-10-13 07:49:18,636 INFO [main] org.apache.hadoop.http.HttpServer2: Added global filter 'safety' (class=org.apache.hadoop.http.HttpServer2$QuotingInputFilter)
2017-10-13 07:49:18,641 INFO [main] org.apache.hadoop.http.HttpServer2: Added filter AM_PROXY_FILTER (class=org.apache.hadoop.yarn.server.webproxy.amfilter.AmIpFilter) to context mapreduce
2017-10-13 07:49:18,641 INFO [main] org.apache.hadoop.http.HttpServer2: Added filter AM_PROXY_FILTER (class=org.apache.hadoop.yarn.server.webproxy.amfilter.AmIpFilter) to context static
2017-10-13 07:49:18,643 INFO [main] org.apache.hadoop.http.HttpServer2: adding path spec: /mapreduce/*
2017-10-13 07:49:18,643 INFO [main] org.apache.hadoop.http.HttpServer2: adding path spec: /ws/*
2017-10-13 07:49:18,879 INFO [main] org.apache.hadoop.yarn.webapp.WebApps: Registered webapp guice modules
2017-10-13 07:49:18,881 INFO [main] org.apache.hadoop.http.HttpServer2: Jetty bound to port 46567
2017-10-13 07:49:18,881 INFO [main] org.mortbay.log: jetty-6.1.26.hwx
2017-10-13 07:49:18,908 INFO [main] org.mortbay.log: Extract jar:file:/hadoop/yarn/local/filecache/10/mapreduce.tar.gz/hadoop/share/hadoop/yarn/hadoop-yarn-common-2.7.3.2.6.2.0-205.jar!/webapps/mapreduce to /hadoop/yarn/local/usercache/hdfs/appcache/application_1507793796947_0002/container_e08_1507793796947_0002_01_000001/tmp/Jetty_0_0_0_0_46567_mapreduce____hhyds5/webapp
2017-10-13 07:49:19,777 INFO [main] org.mortbay.log: Started HttpServer2$SelectChannelConnectorWithSafeStartup@0.0.0.0:46567
2017-10-13 07:49:19,778 INFO [main] org.apache.hadoop.yarn.webapp.WebApps: Web app mapreduce started at 46567
2017-10-13 07:49:19,781 INFO [main] org.apache.hadoop.ipc.CallQueueManager: Using callQueue: class java.util.concurrent.LinkedBlockingQueue scheduler: class org.apache.hadoop.ipc.DefaultRpcScheduler
2017-10-13 07:49:19,782 INFO [Socket Reader #1 for port 40503] org.apache.hadoop.ipc.Server: Starting Socket Reader #1 for port 40503
2017-10-13 07:49:19,786 INFO [IPC Server Responder] org.apache.hadoop.ipc.Server: IPC Server Responder: starting
2017-10-13 07:49:19,786 INFO [IPC Server listener on 40503] org.apache.hadoop.ipc.Server: IPC Server listener on 40503: starting
2017-10-13 07:49:19,805 INFO [main] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerRequestor: nodeBlacklistingEnabled:true
2017-10-13 07:49:19,806 INFO [main] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerRequestor: maxTaskFailuresPerNode is 3
2017-10-13 07:49:19,806 INFO [main] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerRequestor: blacklistDisablePercent is 33
2017-10-13 07:49:19,842 INFO [main] org.apache.hadoop.yarn.client.RMProxy: Connecting to ResourceManager at host2/192.168.20.34:8030
2017-10-13 07:49:19,901 INFO [main] org.apache.hadoop.mapreduce.v2.app.rm.RMCommunicator: maxContainerCapability: <memory:16384, vCores:3>
2017-10-13 07:49:19,901 INFO [main] org.apache.hadoop.mapreduce.v2.app.rm.RMCommunicator: queue: default
2017-10-13 07:49:19,904 INFO [main] org.apache.hadoop.mapreduce.v2.app.launcher.ContainerLauncherImpl: Upper limit on the thread pool size is 500
2017-10-13 07:49:19,904 INFO [main] org.apache.hadoop.mapreduce.v2.app.launcher.ContainerLauncherImpl: The thread pool initial size is 10
2017-10-13 07:49:19,906 INFO [main] org.apache.hadoop.yarn.client.api.impl.ContainerManagementProtocolProxy: yarn.client.max-cached-nodemanagers-proxies : 0
2017-10-13 07:49:19,911 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.JobImpl: job_1507793796947_0002Job Transitioned from INITED to SETUP
2017-10-13 07:49:19,913 INFO [CommitterEvent Processor #0] org.apache.hadoop.mapreduce.v2.app.commit.CommitterEventHandler: Processing the event EventType: JOB_SETUP
2017-10-13 07:49:19,921 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.JobImpl: job_1507793796947_0002Job Transitioned from SETUP to RUNNING
2017-10-13 07:49:19,933 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskImpl: task_1507793796947_0002_m_000000 Task Transitioned from NEW to SCHEDULED
2017-10-13 07:49:19,933 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskImpl: task_1507793796947_0002_m_000001 Task Transitioned from NEW to SCHEDULED
2017-10-13 07:49:19,933 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskImpl: task_1507793796947_0002_m_000002 Task Transitioned from NEW to SCHEDULED
2017-10-13 07:49:19,934 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskAttemptImpl: attempt_1507793796947_0002_m_000000_0 TaskAttempt Transitioned from NEW to UNASSIGNED
2017-10-13 07:49:19,934 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskAttemptImpl: attempt_1507793796947_0002_m_000001_0 TaskAttempt Transitioned from NEW to UNASSIGNED
2017-10-13 07:49:19,934 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskAttemptImpl: attempt_1507793796947_0002_m_000002_0 TaskAttempt Transitioned from NEW to UNASSIGNED
2017-10-13 07:49:19,936 INFO [Thread-53] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerAllocator: mapResourceRequest:<memory:6758, vCores:1>
2017-10-13 07:49:19,967 INFO [eventHandlingThread] org.apache.hadoop.mapreduce.jobhistory.JobHistoryEventHandler: Event Writer setup for JobId: job_1507793796947_0002, File: hdfs://host1:8020/user/hdfs/.staging/job_1507793796947_0002/job_1507793796947_0002_1.jhist
2017-10-13 07:49:20,906 INFO [RMCommunicator Allocator] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerAllocator: Before Scheduling: PendingReds:0 ScheduledMaps:3 ScheduledReds:0 AssignedMaps:0 AssignedReds:0 CompletedMaps:0 CompletedReds:0 ContAlloc:0 ContRel:0 HostLocal:0 RackLocal:0
2017-10-13 07:49:20,944 INFO [RMCommunicator Allocator] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerRequestor: getResources() for application_1507793796947_0002: ask=1 release= 0 newContainers=0 finishedContainers=0 resourcelimit=<memory:45056, vCores:8> knownNMs=3
2017-10-13 07:49:21,970 INFO [RMCommunicator Allocator] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerAllocator: Got allocated containers 3
2017-10-13 07:49:21,993 INFO [RMCommunicator Allocator] org.apache.hadoop.yarn.util.RackResolver: Resolved host4 to /default-rack
2017-10-13 07:49:22,014 INFO [RMCommunicator Allocator] org.apache.hadoop.yarn.util.RackResolver: Resolved host3 to /default-rack
2017-10-13 07:49:22,034 INFO [RMCommunicator Allocator] org.apache.hadoop.yarn.util.RackResolver: Resolved host5 to /default-rack
2017-10-13 07:49:22,035 INFO [RMCommunicator Allocator] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerAllocator: Assigned container container_e08_1507793796947_0002_01_000002 to attempt_1507793796947_0002_m_000000_0
2017-10-13 07:49:22,036 INFO [RMCommunicator Allocator] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerAllocator: Assigned container container_e08_1507793796947_0002_01_000003 to attempt_1507793796947_0002_m_000001_0
2017-10-13 07:49:22,036 INFO [RMCommunicator Allocator] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerAllocator: Assigned container container_e08_1507793796947_0002_01_000004 to attempt_1507793796947_0002_m_000002_0
2017-10-13 07:49:22,036 INFO [RMCommunicator Allocator] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerAllocator: After Scheduling: PendingReds:0 ScheduledMaps:0 ScheduledReds:0 AssignedMaps:3 AssignedReds:0 CompletedMaps:0 CompletedReds:0 ContAlloc:3 ContRel:0 HostLocal:0 RackLocal:0
2017-10-13 07:49:22,079 INFO [AsyncDispatcher event handler] org.apache.hadoop.yarn.util.RackResolver: Resolved host4 to /default-rack
2017-10-13 07:49:22,079 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskAttemptImpl: Job jar is not present. Not adding any jar to the list of resources.
2017-10-13 07:49:22,092 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskAttemptImpl: The job-conf file on the remote FS is /user/hdfs/.staging/job_1507793796947_0002/job.xml
2017-10-13 07:49:22,094 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskAttemptImpl: Adding #0 tokens and #1 secret keys for NM use for launching container
2017-10-13 07:49:22,095 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskAttemptImpl: Size of containertokens_dob is 1
2017-10-13 07:49:22,095 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskAttemptImpl: Putting shuffle token in serviceData
2017-10-13 07:49:22,115 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskAttemptImpl: attempt_1507793796947_0002_m_000000_0 TaskAttempt Transitioned from UNASSIGNED to ASSIGNED
2017-10-13 07:49:22,117 INFO [AsyncDispatcher event handler] org.apache.hadoop.yarn.util.RackResolver: Resolved host3 to /default-rack
2017-10-13 07:49:22,117 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskAttemptImpl: attempt_1507793796947_0002_m_000001_0 TaskAttempt Transitioned from UNASSIGNED to ASSIGNED
2017-10-13 07:49:22,118 INFO [AsyncDispatcher event handler] org.apache.hadoop.yarn.util.RackResolver: Resolved host5 to /default-rack
2017-10-13 07:49:22,118 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskAttemptImpl: attempt_1507793796947_0002_m_000002_0 TaskAttempt Transitioned from UNASSIGNED to ASSIGNED
2017-10-13 07:49:22,120 INFO [ContainerLauncher #0] org.apache.hadoop.mapreduce.v2.app.launcher.ContainerLauncherImpl: Processing the event EventType: CONTAINER_REMOTE_LAUNCH for container container_e08_1507793796947_0002_01_000002 taskAttempt attempt_1507793796947_0002_m_000000_0
2017-10-13 07:49:22,120 INFO [ContainerLauncher #1] org.apache.hadoop.mapreduce.v2.app.launcher.ContainerLauncherImpl: Processing the event EventType: CONTAINER_REMOTE_LAUNCH for container container_e08_1507793796947_0002_01_000003 taskAttempt attempt_1507793796947_0002_m_000001_0
2017-10-13 07:49:22,122 INFO [ContainerLauncher #1] org.apache.hadoop.mapreduce.v2.app.launcher.ContainerLauncherImpl: Launching attempt_1507793796947_0002_m_000001_0
2017-10-13 07:49:22,122 INFO [ContainerLauncher #2] org.apache.hadoop.mapreduce.v2.app.launcher.ContainerLauncherImpl: Processing the event EventType: CONTAINER_REMOTE_LAUNCH for container container_e08_1507793796947_0002_01_000004 taskAttempt attempt_1507793796947_0002_m_000002_0
2017-10-13 07:49:22,122 INFO [ContainerLauncher #2] org.apache.hadoop.mapreduce.v2.app.launcher.ContainerLauncherImpl: Launching attempt_1507793796947_0002_m_000002_0
2017-10-13 07:49:22,123 INFO [ContainerLauncher #1] org.apache.hadoop.yarn.client.api.impl.ContainerManagementProtocolProxy: Opening proxy : host3:45454
2017-10-13 07:49:22,123 INFO [ContainerLauncher #0] org.apache.hadoop.mapreduce.v2.app.launcher.ContainerLauncherImpl: Launching attempt_1507793796947_0002_m_000000_0
2017-10-13 07:49:22,139 INFO [ContainerLauncher #0] org.apache.hadoop.yarn.client.api.impl.ContainerManagementProtocolProxy: Opening proxy : host4:45454
2017-10-13 07:49:22,141 INFO [ContainerLauncher #2] org.apache.hadoop.yarn.client.api.impl.ContainerManagementProtocolProxy: Opening proxy : host5:45454
2017-10-13 07:49:22,187 INFO [ContainerLauncher #1] org.apache.hadoop.mapreduce.v2.app.launcher.ContainerLauncherImpl: Shuffle port returned by ContainerManager for attempt_1507793796947_0002_m_000001_0 : 13562
2017-10-13 07:49:22,188 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskAttemptImpl: TaskAttempt: [attempt_1507793796947_0002_m_000001_0] using containerId: [container_e08_1507793796947_0002_01_000003 on NM: [host3:45454]
2017-10-13 07:49:22,191 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskAttemptImpl: attempt_1507793796947_0002_m_000001_0 TaskAttempt Transitioned from ASSIGNED to RUNNING
2017-10-13 07:49:22,191 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskImpl: task_1507793796947_0002_m_000001 Task Transitioned from SCHEDULED to RUNNING
2017-10-13 07:49:22,204 INFO [ContainerLauncher #2] org.apache.hadoop.mapreduce.v2.app.launcher.ContainerLauncherImpl: Shuffle port returned by ContainerManager for attempt_1507793796947_0002_m_000002_0 : 13562
2017-10-13 07:49:22,205 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskAttemptImpl: TaskAttempt: [attempt_1507793796947_0002_m_000002_0] using containerId: [container_e08_1507793796947_0002_01_000004 on NM: [host5:45454]
2017-10-13 07:49:22,205 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskAttemptImpl: attempt_1507793796947_0002_m_000002_0 TaskAttempt Transitioned from ASSIGNED to RUNNING
2017-10-13 07:49:22,205 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskImpl: task_1507793796947_0002_m_000002 Task Transitioned from SCHEDULED to RUNNING
2017-10-13 07:49:22,397 INFO [ContainerLauncher #0] org.apache.hadoop.mapreduce.v2.app.launcher.ContainerLauncherImpl: Shuffle port returned by ContainerManager for attempt_1507793796947_0002_m_000000_0 : 13562
2017-10-13 07:49:22,398 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskAttemptImpl: TaskAttempt: [attempt_1507793796947_0002_m_000000_0] using containerId: [container_e08_1507793796947_0002_01_000002 on NM: [host4:45454]
2017-10-13 07:49:22,398 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskAttemptImpl: attempt_1507793796947_0002_m_000000_0 TaskAttempt Transitioned from ASSIGNED to RUNNING
2017-10-13 07:49:22,398 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskImpl: task_1507793796947_0002_m_000000 Task Transitioned from SCHEDULED to RUNNING
2017-10-13 07:49:23,042 INFO [RMCommunicator Allocator] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerRequestor: getResources() for application_1507793796947_0002: ask=1 release= 0 newContainers=0 finishedContainers=0 resourcelimit=<memory:23552, vCores:5> knownNMs=3
2017-10-13 07:49:23,665 INFO [Socket Reader #1 for port 40503] SecurityLogger.org.apache.hadoop.ipc.Server: Auth successful for job_1507793796947_0002 (auth:SIMPLE)
2017-10-13 07:49:23,685 INFO [IPC Server handler 2 on 40503] org.apache.hadoop.mapred.TaskAttemptListenerImpl: JVM with ID : jvm_1507793796947_0002_m_8796093022212 asked for a task
2017-10-13 07:49:23,685 INFO [IPC Server handler 2 on 40503] org.apache.hadoop.mapred.TaskAttemptListenerImpl: JVM with ID: jvm_1507793796947_0002_m_8796093022212 given task: attempt_1507793796947_0002_m_000002_0
2017-10-13 07:49:23,809 INFO [Socket Reader #1 for port 40503] SecurityLogger.org.apache.hadoop.ipc.Server: Auth successful for job_1507793796947_0002 (auth:SIMPLE)
2017-10-13 07:49:23,824 INFO [IPC Server handler 2 on 40503] org.apache.hadoop.mapred.TaskAttemptListenerImpl: JVM with ID : jvm_1507793796947_0002_m_8796093022211 asked for a task
2017-10-13 07:49:23,824 INFO [IPC Server handler 2 on 40503] org.apache.hadoop.mapred.TaskAttemptListenerImpl: JVM with ID: jvm_1507793796947_0002_m_8796093022211 given task: attempt_1507793796947_0002_m_000001_0
2017-10-13 07:49:24,486 INFO [IPC Server handler 0 on 40503] org.apache.hadoop.mapred.TaskAttemptListenerImpl: Progress of TaskAttempt attempt_1507793796947_0002_m_000002_0 is : 0.0
2017-10-13 07:49:24,505 FATAL [IPC Server handler 1 on 40503] org.apache.hadoop.mapred.TaskAttemptListenerImpl: Task: attempt_1507793796947_0002_m_000002_0 - exited : java.lang.RuntimeException: java.lang.ClassNotFoundException: Class water.hadoop.h2omapper not found
	at org.apache.hadoop.conf.Configuration.getClass(Configuration.java:2241)
	at org.apache.hadoop.mapreduce.task.JobContextImpl.getMapperClass(JobContextImpl.java:186)
	at org.apache.hadoop.mapred.MapTask.runNewMapper(MapTask.java:745)
	at org.apache.hadoop.mapred.MapTask.run(MapTask.java:341)
	at org.apache.hadoop.mapred.YarnChild$2.run(YarnChild.java:170)
	at java.security.AccessController.doPrivileged(Native Method)
	at javax.security.auth.Subject.doAs(Subject.java:422)
	at org.apache.hadoop.security.UserGroupInformation.doAs(UserGroupInformation.java:1866)
	at org.apache.hadoop.mapred.YarnChild.main(YarnChild.java:164)
Caused by: java.lang.ClassNotFoundException: Class water.hadoop.h2omapper not found
	at org.apache.hadoop.conf.Configuration.getClassByName(Configuration.java:2147)
	at org.apache.hadoop.conf.Configuration.getClass(Configuration.java:2239)
	... 8 more

2017-10-13 07:49:24,506 INFO [IPC Server handler 1 on 40503] org.apache.hadoop.mapred.TaskAttemptListenerImpl: Diagnostics report from attempt_1507793796947_0002_m_000002_0: Error: java.lang.RuntimeException: java.lang.ClassNotFoundException: Class water.hadoop.h2omapper not found
	at org.apache.hadoop.conf.Configuration.getClass(Configuration.java:2241)
	at org.apache.hadoop.mapreduce.task.JobContextImpl.getMapperClass(JobContextImpl.java:186)
	at org.apache.hadoop.mapred.MapTask.runNewMapper(MapTask.java:745)
	at org.apache.hadoop.mapred.MapTask.run(MapTask.java:341)
	at org.apache.hadoop.mapred.YarnChild$2.run(YarnChild.java:170)
	at java.security.AccessController.doPrivileged(Native Method)
	at javax.security.auth.Subject.doAs(Subject.java:422)
	at org.apache.hadoop.security.UserGroupInformation.doAs(UserGroupInformation.java:1866)
	at org.apache.hadoop.mapred.YarnChild.main(YarnChild.java:164)
Caused by: java.lang.ClassNotFoundException: Class water.hadoop.h2omapper not found
	at org.apache.hadoop.conf.Configuration.getClassByName(Configuration.java:2147)
	at org.apache.hadoop.conf.Configuration.getClass(Configuration.java:2239)
	... 8 more

2017-10-13 07:49:24,507 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskAttemptImpl: Diagnostics report from attempt_1507793796947_0002_m_000002_0: Error: java.lang.RuntimeException: java.lang.ClassNotFoundException: Class water.hadoop.h2omapper not found
	at org.apache.hadoop.conf.Configuration.getClass(Configuration.java:2241)
	at org.apache.hadoop.mapreduce.task.JobContextImpl.getMapperClass(JobContextImpl.java:186)
	at org.apache.hadoop.mapred.MapTask.runNewMapper(MapTask.java:745)
	at org.apache.hadoop.mapred.MapTask.run(MapTask.java:341)
	at org.apache.hadoop.mapred.YarnChild$2.run(YarnChild.java:170)
	at java.security.AccessController.doPrivileged(Native Method)
	at javax.security.auth.Subject.doAs(Subject.java:422)
	at org.apache.hadoop.security.UserGroupInformation.doAs(UserGroupInformation.java:1866)
	at org.apache.hadoop.mapred.YarnChild.main(YarnChild.java:164)
Caused by: java.lang.ClassNotFoundException: Class water.hadoop.h2omapper not found
	at org.apache.hadoop.conf.Configuration.getClassByName(Configuration.java:2147)
	at org.apache.hadoop.conf.Configuration.getClass(Configuration.java:2239)
	... 8 more

2017-10-13 07:49:24,508 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskAttemptImpl: attempt_1507793796947_0002_m_000002_0 TaskAttempt Transitioned from RUNNING to FAIL_CONTAINER_CLEANUP
2017-10-13 07:49:24,509 INFO [ContainerLauncher #3] org.apache.hadoop.mapreduce.v2.app.launcher.ContainerLauncherImpl: Processing the event EventType: CONTAINER_REMOTE_CLEANUP for container container_e08_1507793796947_0002_01_000004 taskAttempt attempt_1507793796947_0002_m_000002_0
2017-10-13 07:49:24,511 INFO [ContainerLauncher #3] org.apache.hadoop.mapreduce.v2.app.launcher.ContainerLauncherImpl: KILLING attempt_1507793796947_0002_m_000002_0
2017-10-13 07:49:24,511 INFO [ContainerLauncher #3] org.apache.hadoop.yarn.client.api.impl.ContainerManagementProtocolProxy: Opening proxy : host5:45454
2017-10-13 07:49:24,531 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskAttemptImpl: attempt_1507793796947_0002_m_000002_0 TaskAttempt Transitioned from FAIL_CONTAINER_CLEANUP to FAIL_TASK_CLEANUP
2017-10-13 07:49:24,532 INFO [CommitterEvent Processor #1] org.apache.hadoop.mapreduce.v2.app.commit.CommitterEventHandler: Processing the event EventType: TASK_ABORT
2017-10-13 07:49:24,546 WARN [CommitterEvent Processor #1] org.apache.hadoop.mapreduce.lib.output.FileOutputCommitter: Could not delete hdfs://host1:8020/user/hdfs/h2o-test/_temporary/1/_temporary/attempt_1507793796947_0002_m_000002_0
2017-10-13 07:49:24,549 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskAttemptImpl: attempt_1507793796947_0002_m_000002_0 TaskAttempt Transitioned from FAIL_TASK_CLEANUP to FAILED
2017-10-13 07:49:24,556 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskImpl: task_1507793796947_0002_m_000002 Task Transitioned from RUNNING to FAILED
2017-10-13 07:49:24,557 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.JobImpl: Num completed Tasks: 1
2017-10-13 07:49:24,557 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.JobImpl: Job failed as tasks failed. failedMaps:1 failedReduces:0
2017-10-13 07:49:24,558 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.JobImpl: job_1507793796947_0002Job Transitioned from RUNNING to FAIL_WAIT
2017-10-13 07:49:24,558 INFO [Thread-53] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerRequestor: 1 failures on node host5
2017-10-13 07:49:24,558 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskImpl: task_1507793796947_0002_m_000000 Task Transitioned from RUNNING to KILL_WAIT
2017-10-13 07:49:24,558 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskImpl: task_1507793796947_0002_m_000001 Task Transitioned from RUNNING to KILL_WAIT
2017-10-13 07:49:24,559 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskAttemptImpl: attempt_1507793796947_0002_m_000000_0 TaskAttempt Transitioned from RUNNING to KILL_CONTAINER_CLEANUP
2017-10-13 07:49:24,559 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskAttemptImpl: attempt_1507793796947_0002_m_000001_0 TaskAttempt Transitioned from RUNNING to KILL_CONTAINER_CLEANUP
2017-10-13 07:49:24,573 INFO [ContainerLauncher #4] org.apache.hadoop.mapreduce.v2.app.launcher.ContainerLauncherImpl: Processing the event EventType: CONTAINER_REMOTE_CLEANUP for container container_e08_1507793796947_0002_01_000002 taskAttempt attempt_1507793796947_0002_m_000000_0
2017-10-13 07:49:24,576 INFO [ContainerLauncher #4] org.apache.hadoop.mapreduce.v2.app.launcher.ContainerLauncherImpl: KILLING attempt_1507793796947_0002_m_000000_0
2017-10-13 07:49:24,576 INFO [ContainerLauncher #4] org.apache.hadoop.yarn.client.api.impl.ContainerManagementProtocolProxy: Opening proxy : host4:45454
2017-10-13 07:49:24,577 INFO [ContainerLauncher #5] org.apache.hadoop.mapreduce.v2.app.launcher.ContainerLauncherImpl: Processing the event EventType: CONTAINER_REMOTE_CLEANUP for container container_e08_1507793796947_0002_01_000003 taskAttempt attempt_1507793796947_0002_m_000001_0
2017-10-13 07:49:24,578 INFO [ContainerLauncher #5] org.apache.hadoop.mapreduce.v2.app.launcher.ContainerLauncherImpl: KILLING attempt_1507793796947_0002_m_000001_0
2017-10-13 07:49:24,578 INFO [ContainerLauncher #5] org.apache.hadoop.yarn.client.api.impl.ContainerManagementProtocolProxy: Opening proxy : host3:45454
2017-10-13 07:49:24,594 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskAttemptImpl: attempt_1507793796947_0002_m_000001_0 TaskAttempt Transitioned from KILL_CONTAINER_CLEANUP to KILL_TASK_CLEANUP
2017-10-13 07:49:24,595 INFO [CommitterEvent Processor #2] org.apache.hadoop.mapreduce.v2.app.commit.CommitterEventHandler: Processing the event EventType: TASK_ABORT
2017-10-13 07:49:24,596 WARN [CommitterEvent Processor #2] org.apache.hadoop.mapreduce.lib.output.FileOutputCommitter: Could not delete hdfs://host1:8020/user/hdfs/h2o-test/_temporary/1/_temporary/attempt_1507793796947_0002_m_000001_0
2017-10-13 07:49:24,597 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskAttemptImpl: attempt_1507793796947_0002_m_000001_0 TaskAttempt Transitioned from KILL_TASK_CLEANUP to KILLED
2017-10-13 07:49:24,597 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskImpl: task_1507793796947_0002_m_000001 Task Transitioned from KILL_WAIT to KILLED
2017-10-13 07:49:24,794 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskAttemptImpl: attempt_1507793796947_0002_m_000000_0 TaskAttempt Transitioned from KILL_CONTAINER_CLEANUP to KILL_TASK_CLEANUP
2017-10-13 07:49:24,795 INFO [CommitterEvent Processor #3] org.apache.hadoop.mapreduce.v2.app.commit.CommitterEventHandler: Processing the event EventType: TASK_ABORT
2017-10-13 07:49:24,796 WARN [CommitterEvent Processor #3] org.apache.hadoop.mapreduce.lib.output.FileOutputCommitter: Could not delete hdfs://host1:8020/user/hdfs/h2o-test/_temporary/1/_temporary/attempt_1507793796947_0002_m_000000_0
2017-10-13 07:49:24,797 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskAttemptImpl: attempt_1507793796947_0002_m_000000_0 TaskAttempt Transitioned from KILL_TASK_CLEANUP to KILLED
2017-10-13 07:49:24,797 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskImpl: task_1507793796947_0002_m_000000 Task Transitioned from KILL_WAIT to KILLED
2017-10-13 07:49:24,798 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.JobImpl: job_1507793796947_0002Job Transitioned from FAIL_WAIT to FAIL_ABORT
2017-10-13 07:49:24,798 INFO [CommitterEvent Processor #4] org.apache.hadoop.mapreduce.v2.app.commit.CommitterEventHandler: Processing the event EventType: JOB_ABORT
2017-10-13 07:49:24,804 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.JobImpl: job_1507793796947_0002Job Transitioned from FAIL_ABORT to FAILED
2017-10-13 07:49:24,809 INFO [Thread-72] org.apache.hadoop.mapreduce.v2.app.MRAppMaster: We are finishing cleanly so this is the last retry
2017-10-13 07:49:24,809 INFO [Thread-72] org.apache.hadoop.mapreduce.v2.app.MRAppMaster: Notify RMCommunicator isAMLastRetry: true
2017-10-13 07:49:24,809 INFO [Thread-72] org.apache.hadoop.mapreduce.v2.app.rm.RMCommunicator: RMCommunicator notified that shouldUnregistered is: true
2017-10-13 07:49:24,809 INFO [Thread-72] org.apache.hadoop.mapreduce.v2.app.MRAppMaster: Notify JHEH isAMLastRetry: true
2017-10-13 07:49:24,809 INFO [Thread-72] org.apache.hadoop.mapreduce.jobhistory.JobHistoryEventHandler: JobHistoryEventHandler notified that forceJobCompletion is true
2017-10-13 07:49:24,809 INFO [Thread-72] org.apache.hadoop.mapreduce.v2.app.MRAppMaster: Calling stop for all the services
2017-10-13 07:49:24,810 INFO [Thread-72] org.apache.hadoop.mapreduce.jobhistory.JobHistoryEventHandler: Stopping JobHistoryEventHandler. Size of the outstanding queue size is 1
2017-10-13 07:49:24,814 INFO [Thread-72] org.apache.hadoop.mapreduce.jobhistory.JobHistoryEventHandler: In stop, writing event JOB_FAILED
2017-10-13 07:49:24,866 INFO [Thread-72] org.apache.hadoop.mapreduce.jobhistory.JobHistoryEventHandler: Copying hdfs://host1:8020/user/hdfs/.staging/job_1507793796947_0002/job_1507793796947_0002_1.jhist to hdfs://host1:8020/mr-history/tmp/hdfs/job_1507793796947_0002-1507873755618-hdfs-H2O_86929-1507873764557-0-0-FAILED-default-1507873759907.jhist_tmp
2017-10-13 07:49:24,896 INFO [Thread-72] org.apache.hadoop.mapreduce.jobhistory.JobHistoryEventHandler: Copied to done location: hdfs://host1:8020/mr-history/tmp/hdfs/job_1507793796947_0002-1507873755618-hdfs-H2O_86929-1507873764557-0-0-FAILED-default-1507873759907.jhist_tmp
2017-10-13 07:49:24,898 INFO [Thread-72] org.apache.hadoop.mapreduce.jobhistory.JobHistoryEventHandler: Copying hdfs://host1:8020/user/hdfs/.staging/job_1507793796947_0002/job_1507793796947_0002_1_conf.xml to hdfs://host1:8020/mr-history/tmp/hdfs/job_1507793796947_0002_conf.xml_tmp
2017-10-13 07:49:24,928 INFO [Thread-72] org.apache.hadoop.mapreduce.jobhistory.JobHistoryEventHandler: Copied to done location: hdfs://host1:8020/mr-history/tmp/hdfs/job_1507793796947_0002_conf.xml_tmp
2017-10-13 07:49:24,936 INFO [Thread-72] org.apache.hadoop.mapreduce.jobhistory.JobHistoryEventHandler: Moved tmp to done: hdfs://host1:8020/mr-history/tmp/hdfs/job_1507793796947_0002.summary_tmp to hdfs://host1:8020/mr-history/tmp/hdfs/job_1507793796947_0002.summary
2017-10-13 07:49:24,939 INFO [Thread-72] org.apache.hadoop.mapreduce.jobhistory.JobHistoryEventHandler: Moved tmp to done: hdfs://host1:8020/mr-history/tmp/hdfs/job_1507793796947_0002_conf.xml_tmp to hdfs://host1:8020/mr-history/tmp/hdfs/job_1507793796947_0002_conf.xml
2017-10-13 07:49:24,941 INFO [Thread-72] org.apache.hadoop.mapreduce.jobhistory.JobHistoryEventHandler: Moved tmp to done: hdfs://host1:8020/mr-history/tmp/hdfs/job_1507793796947_0002-1507873755618-hdfs-H2O_86929-1507873764557-0-0-FAILED-default-1507873759907.jhist_tmp to hdfs://host1:8020/mr-history/tmp/hdfs/job_1507793796947_0002-1507873755618-hdfs-H2O_86929-1507873764557-0-0-FAILED-default-1507873759907.jhist
2017-10-13 07:49:24,941 INFO [Thread-72] org.apache.hadoop.mapreduce.jobhistory.JobHistoryEventHandler: Stopped JobHistoryEventHandler. super.stop()
2017-10-13 07:49:24,943 INFO [Thread-72] org.apache.hadoop.mapreduce.v2.app.rm.RMCommunicator: Setting job diagnostics to Task failed task_1507793796947_0002_m_000002
Job failed as tasks failed. failedMaps:1 failedReduces:0

2017-10-13 07:49:24,944 INFO [Thread-72] org.apache.hadoop.mapreduce.v2.app.rm.RMCommunicator: History url is http://host2:19888/jobhistory/job/job_1507793796947_0002
2017-10-13 07:49:24,951 INFO [Thread-72] org.apache.hadoop.mapreduce.v2.app.rm.RMCommunicator: Waiting for application to be successfully unregistered.
2017-10-13 07:49:25,953 INFO [Thread-72] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerAllocator: Final Stats: PendingReds:0 ScheduledMaps:0 ScheduledReds:0 AssignedMaps:3 AssignedReds:0 CompletedMaps:0 CompletedReds:0 ContAlloc:3 ContRel:0 HostLocal:0 RackLocal:0
2017-10-13 07:49:25,954 INFO [Thread-72] org.apache.hadoop.mapreduce.v2.app.MRAppMaster: Deleting staging directory hdfs://host1:8020 /user/hdfs/.staging/job_1507793796947_0002
2017-10-13 07:49:25,957 INFO [Thread-72] org.apache.hadoop.ipc.Server: Stopping server on 40503
2017-10-13 07:49:25,958 INFO [IPC Server listener on 40503] org.apache.hadoop.ipc.Server: Stopping IPC Server listener on 40503
2017-10-13 07:49:25,959 INFO [TaskHeartbeatHandler PingChecker] org.apache.hadoop.mapreduce.v2.app.TaskHeartbeatHandler: TaskHeartbeatHandler thread interrupted
```
