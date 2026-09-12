
Types of Sandboxes
- [Standard Sandboxes](https://modal.com/docs/guide/sandboxes) : Do not support docker
- [VM Sandboxes](https://modal.com/docs/guide/vm-sandboxes): Supports docker

Sandbox pricing: 
- Ref: https://modal.com/pricing -> under FAQ: `How are CPU and memory usage metered?`
- Concepts:
	- Requested amount: 
		- The dedicated allocation reserved for the container/sandbox on the host machine. The container is guaranteed these resources. It can burst above this value if spare host capacity exists upto Limit Amount.
	- [Limit Amount](https://modal.com/docs/guide/resources#resource-limits): 
		- The maximum capacity the container is permitted to consume. Host throttles execution after this amount.
	- Spare resources: If your sandbox processes needs more resources than your request amount, modal automatically provides that to your sandbox (if resources are available to modal). But this will not cross the **Limit Amount**
	- Your bill = Requested Amount + Spare resources you used
		- You'll be charged based on whichever is higher: the amount you request or the amount you actually use. 
- Each container has a minimum request of 128 MiB of memory and 0.125 CPU cores, which you can increase if you need more resources.
- Advantage of setting request for resources:
	- When you set a request, Modal schedules your container on a host machine with enough dedicated capacity. 
	- Without an adequate request, your container might get placed on a heavily loaded host and face CPU throttling or memory starvation under sudden load.
- **Suggestion**: Do not set request for resources, as CPU throuttling or memory starvation almost never happens, so you can use sufficient amount of resources by not setting resources, setting resources will normally lead to overpaying for the resources you did not used.

Code for setting request and limit amount:
```python
# cpu
cpu_request = 1.0
cpu_limit = 4.0
@app.function(cpu=(cpu_request, cpu_limit))


# memory / RAM
mem_request = 1024
mem_limit = 2048
@app.function(memory=(mem_request, mem_limit))
```


## Products offered by Modal

| Product Category                                         | Offering                                                                                           | Runtime / Isolation Architecture      | Primary Use Case & Characteristics                                                                                                                      |
| -------------------------------------------------------- | -------------------------------------------------------------------------------------------------- | ------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **[Sandboxes](https://modal.com/products/sandboxes)**    | **[Standard / Regular Sandboxes](https://modal.com/docs/guide/sandboxes)**                         | Container-based (gVisor isolation)    | Sub-second cold starts, dynamic execution of LLM-generated or untrusted code, filesystem snapshotting, and running concurrent agent or RL environments. |
|                                                          | **[VM Sandboxes](https://modal.com/docs/guide/vm-sandboxes)**                                      | Hardware-isolated Virtual Machine     | Dedicated guest Linux kernel; enables Docker-in-Docker, systemd / custom init systems (via `vm_init`), eBPF, loopback filesystems, and FUSE.            |
| **[Inference](https://modal.com/products/inference)**    | **[Web Functions / Endpoints](https://modal.com/docs/guide/webhooks)**                             | Standard serverless container runtime | Synchronous or streaming HTTP APIs (`@app.web_endpoint()`, `@app.fastapi_endpoint()`) autoscaling from zero with optimized cold starts.                 |
|                                                          | **[Shared Endpoints](https://modal.com/docs/guide/shared-endpoints)**                              | Multi-tenant HTTP ingress             | Routes requests to an elastically shared pool of container instances to maximize hardware utilization.                                                  |
|                                                          | **[Dedicated Endpoints](https://modal.com/docs/guide/dedicated-endpoints)**                        | Isolated HTTP ingress                 | Pins traffic to dedicated, isolated container instances for predictable latency and zero noisy-neighbor impact.                                         |
| **[Batch](https://modal.com/products/batch)**            | **[Batch Processing](https://modal.com/docs/guide/batch-processing)** (`Function.map` / `starmap`) | Serverless container workers          | High-throughput fan-out across hundreds or thousands of parallel containers for offline jobs and media processing.                                      |
|                                                          | **[Job Queues](https://modal.com/docs/guide/job-queue)**                                           | Queue-backed worker pools             | Decoupled asynchronous task consumption with native scheduling, concurrency controls, and retries.                                                      |
|                                                          | **[Dynamic Batching](https://modal.com/docs/guide/dynamic-batching)**                              | Batched worker loops                  | Automatically aggregates concurrent inbound calls into single execution batches to maximize GPU throughput.                                             |
| **[Training](https://modal.com/products/training)**      | **Single-Node Training**                                                                           | High-spec GPU containers              | Fast-spin GPU workloads (H100, A100, L40S) for model fine-tuning with local NVMe caching and shared storage.                                            |
|                                                          | **[Multi-Node Clusters](https://modal.com/docs/guide/multi-node-training)**                        | Distributed interconnected nodes      | Multi-node cluster orchestration for large-scale distributed training using technologies like torchrun and RDMA/InfiniBand networking.                  |
| **[Notebooks](https://modal.com/products/notebooks)**    | **[Jupyter Notebooks](https://modal.com/docs/guide/jupyter-notebooks)**                            | Interactive cloud container           | Cloud-backed interactive development environments connecting directly to remote GPU memory and persistent volumes.                                      |
| **[Core Platform](https://modal.com/products/platform)** | **[Functions](https://modal.com/docs/guide/functions)** (`@app.function()`)                        | Core serverless execution engine      | Autoscaling, pay-per-second compute units executing arbitrary Python functions.                                                                         |
|                                                          | **[Sidecars](https://modal.com/docs/guide/sandbox-sidecars)**                                      | Auxiliary container pattern           | Supporting processes running alongside the primary container (e.g., local proxy caches, log shippers).                                                  |
|                                                          | **[Storage - Volumes](https://modal.com/docs/guide/volumes)**                                      | Distributed read-write filesystem     | Low-latency shared filesystem optimized for model weight caching and fast reads across tasks.                                                           |
|                                                          | **[Storage - Cloud Bucket Mounts](https://modal.com/docs/guide/cloud-bucket-mounts)**              | Object storage integration            | Direct streaming mounts of external S3 or Google Cloud Storage buckets into container paths.                                                            |
|                                                          | **[State - Dicts & Queues](https://modal.com/docs/guide/dicts)**                                   | Distributed data structures           | Low-latency key-value stores (`modal.Dict`) and FIFO queues (`modal.Queue`) for inter-task coordination.                                                |
|                                                          | **[Networking - Tunnels & Proxies](https://modal.com/docs/guide/tunnels)**                         | Network primitives                    | Exposes ports on running containers to the public internet via encrypted TLS tunnels or routes traffic through static proxies.                          |


| Offering / Primitive | Architectural Nature | Primary Purpose & Characteristics |
| --- | --- | --- |
| **[Apps](https://modal.com/docs/guide/apps)** (`modal.App`) | Orchestration & Deployment Boundary | The top-level namespace grouping Functions, Sandboxes, Images, Volumes, and Secrets. An App defines how code is deployed, managed, and monitored. |
| **[Functions](https://modal.com/docs/guide/functions)** (`@app.function()`) | Serverless Compute Engine | Python code executed in the cloud on-demand. Manages autoscaling to zero, concurrency, batch processing, and retries. |
| **Containers** | Execution Substrate | The underlying runtime environment spun up dynamically to execute Functions or Sandboxes based on your specified [Image](https://modal.com/docs/guide/images) (e.g., Debian slim, custom CUDA images). |
| **[Standard / Regular Sandboxes](https://modal.com/docs/guide/sandboxes)** (`modal.Sandbox.create()`) | Runtime-Defined Container Sandbox | Dedicated, isolated container environments scheduled in sub-seconds (using gVisor isolation). Designed for untrusted user/agent code execution, running shell commands, and snapshotting. |
| **[VM Sandboxes](https://modal.com/docs/guide/vm-sandboxes)** (`vm_runtime=True`) | Hardware-Isolated Virtual Machine | Sandboxes running on a full virtual machine with a real Linux kernel instead of gVisor. Intended for running Docker-in-Docker, custom init systems (systemd), eBPF, loopback filesystems, and FUSE. |
| **[Endpoints / Web Functions](https://modal.com/docs/guide/webhooks)** | HTTP Interface | Functions exposed via public or private URLs (`@app.web_endpoint()`, `@app.fastapi_endpoint()`, streaming endpoints) for serving web APIs and webhooks. |
| **[Sidecars](https://modal.com/docs/guide/sandbox-sidecars)** | Auxiliary Container Pattern | Supporting processes running alongside your main Function or Sandbox container to handle secondary tasks (e.g., local proxies, background log shippers). |
| **[Volumes](https://modal.com/docs/guide/volumes)** & **[Cloud Bucket Mounts](https://modal.com/docs/guide/cloud-bucket-mounts)** | Persistent Storage Primitives | Read-write distributed filesystems (`modal.Volume`) optimized for fast model weight caching, alongside S3/GCS bucket mounting directly into container directories. |
| **[Dicts](https://modal.com/docs/guide/dicts)** & **[Queues](https://modal.com/docs/guide/queues)** | Distributed Data Sharing | Cloud-native primitives for low-latency state sharing, producer-consumer coordination, and inter-task communication. |

## Pricing

| Modal Offering / Primitive | Minimum CPU Request | Default CPU Request | Default CPU Limit | Minimum Memory Request | Default Memory Request | Default Memory Limit | Default Ephemeral Disk Quota |
| --- | --- | --- | --- | --- | --- | --- | --- |
| **Functions** (`@app.function`) | 0.125 cores | 0.125 cores | 16.125 cores *(request + 16)* | 128 MiB | 128 MiB | None *(unbounded)* | 512 GiB |
| **Endpoints / Web Functions** | 0.125 cores | 0.125 cores | 16.125 cores *(request + 16)* | 128 MiB | 128 MiB | None *(unbounded)* | 512 GiB |
| **Standard Sandboxes** (`modal.Sandbox`) | 0.125 cores | 0.125 cores | 16.125 cores *(request + 16)* | 128 MiB | 128 MiB | None *(unbounded)* | 512 GiB |
| **VM Sandboxes** (`vm_runtime=True`) | 0.125 cores | 0.125 cores | 16.125 cores *(request + 16)* | 1 GiB *(1024 MiB)* | 1 GiB *(1024 MiB)* | None *(unbounded)* | 512 GiB |
| **Sidecars** | 0.125 cores | 0.125 cores | 16.125 cores *(request + 16)* | 128 MiB | 128 MiB | None *(unbounded)* | Inherits parent container disk |
| **Volumes / Storage / Queues** | N/A | N/A | N/A | N/A | N/A | N/A | N/A *(managed storage)* |

* **Minimum vs. Default Request:** On Modal, the default requested baseline is identical to the platform's minimum allowed request. You cannot provision a container or standard sandbox with less than 0.125 CPU cores or 128 MiB of RAM (or 1 GiB RAM for VM Sandboxes).
* **Request Floor Behavior:** Any request below these amounts is either rounded up to the platform minimum or rejected at definition time.
* **Default CPU & Memory Baseline:** The [Configuring CPU, memory, and disk guide](https://www.google.com/search?q=https://modal.com/docs/guide/resources%23configuring-cpu-memory-and-disk) documents that every standard Function or Sandbox container defaults to a request baseline of **0.125 CPU cores** and **128 MiB RAM**.
* **Soft CPU Limit:** The [CPU Limits section](https://modal.com/docs/guide/resources#cpu-limits) notes that Modal automatically applies a soft CPU limit set at **16 physical cores above your requested amount** (yielding **16.125 cores** by default).
* **Hard Memory Limit:** Detailed under [Memory Limits](https://modal.com/docs/guide/resources#memory-limits), Modal containers do not enforce a hard limit unless explicitly configured via `memory=(request, limit)`, allowing containers to burst up to the host worker's capacity.
* **Ephemeral Disk Quotas:** The [Disk Limits section](https://modal.com/docs/guide/resources#disk-limits) specifies the per-container disk quota default of **512 GiB**.
* **VM Sandbox Exceptions:** The [VM Sandboxes Resource Model](https://modal.com/docs/guide/vm-sandboxes#resource-model) notes that memory provisioning is static: VM sandboxes default to and receive exactly **1 GiB of RAM** (bursting is CPU-only). Its root image limit is capped at **512 GiB** under [VM Sandbox Limitations](https://modal.com/docs/guide/vm-sandboxes#limitations).

The values come from two core guides:

1. **[Configuring CPU, memory, and disk](https://modal.com/docs/guide/resources)** (covers Functions, Web Endpoints, Standard Sandboxes, and Sidecars)
2. **[VM Sandboxes](https://modal.com/docs/guide/vm-sandboxes)** (covers VM-specific overrides and behaviors)

---

### 1. Default & Minimum Request: 0.125 Cores and 128 MiB RAM

* **Source:** [modal.com/docs/guide/resources](https://modal.com/docs/guide/resources)
* **Location on page:** Right under the top heading **"Configuring CPU, memory, and disk"** (first paragraph).
* **Exact Text in Docs:**
> *"Each Modal Function or Sandbox container has a default request of **0.125 CPU cores** and **128 MiB of memory**. Containers can exceed this minimum if the worker has available CPU or memory."*


* **Why it's also the "Minimum":** Modal does not allow specifying a floor below this default baseline request.

---

### 2. Default CPU Limit: 16.125 Cores (Request + 16)

* **Source:** [modal.com/docs/guide/resources#cpu-limits](https://modal.com/docs/guide/resources#cpu-limits)
* **Location on page:** Under the **"Resource limits" → "CPU limits"** subsection.
* **Exact Text in Docs:**
> *"Modal containers have a default soft CPU limit that is set at 16 physical cores above the CPU request. Given that the default CPU request is 0.125 cores, the default soft CPU limit is **16.125 cores**. Above this limit, the host will begin to throttle the CPU usage of the container."*



---

### 3. Default Memory Limit: None / Unbounded

* **Source:** [modal.com/docs/guide/resources#memory-limits](https://modal.com/docs/guide/resources#memory-limits)
* **Location on page:** Under the **"Resource limits" → "Memory limits"** subsection.
* **Exact Text in Docs:**
> *"Modal containers can have a hard memory limit which will 'Out of Memory' (OOM) kill containers which attempt to exceed the limit... Specify this limit using the memory parameter on `@app.function()` or `Sandbox.create()`: `mem_request = 1024; mem_limit = 2048`"*


* **Why it's listed as "None / Unbounded":** Modal only applies a hard memory limit if you pass a tuple `(mem_request, mem_limit)`. By default, no ceiling is imposed until the host worker exhausts physical RAM.

---

### 4. Ephemeral Disk Quota: 512 GiB

* **Source:** [modal.com/docs/guide/resources#disk-limits](https://modal.com/docs/guide/resources#disk-limits)
* **Location on page:** Under the **"Resource limits" → "Disk limits"** subsection.
* **Exact Text in Docs:**
> *"Running Modal containers have access to many GBs of SSD disk, but the amount of writes is limited by: ... A per-container disk quota that defaults to **512 GiB**."*



---

### 5. VM Sandbox Memory: Static 1 GiB Default

* **Source:** [modal.com/docs/guide/vm-sandboxes#resource-model](https://modal.com/docs/guide/vm-sandboxes#resource-model)
* **Location on page:** Under the **"Resource model"** subsection.
* **Exact Text in Docs:**
> *"Unlike resource provisioning in other runtimes, memory provisioning is static for VM Sandboxes: you get exactly as much RAM as you request via memory argument to Sandbox.create. **By default, VM sandboxes get 1GiB of RAM.** However, CPU provisioning is elastic. You can burst above your requested amount."*



---

### 6. VM Sandbox Disk Ceiling: 512 GiB

* **Source:** [modal.com/docs/guide/vm-sandboxes#limitations](https://modal.com/docs/guide/vm-sandboxes#limitations)
* **Location on page:** Under the **"Limitations"** bullet list at the bottom.
* **Exact Text in Docs:**
> *"Root images ≥ 512 GiB are not supported. The VM root filesystem is currently limited to **512 GiB**."*