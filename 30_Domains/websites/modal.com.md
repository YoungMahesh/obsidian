## Sandboxes

- [Standard Sandboxes](https://modal.com/docs/guide/sandboxes): do not support Docker
- [VM Sandboxes](https://modal.com/docs/guide/vm-sandboxes): support Docker

## Sandbox timeouts

Ref: [Sandbox SDK](https://modal.com/docs/sdk/py/latest/Sandbox)

| Parameter      |                                             Default | Minimum |                          Maximum |
| -------------- | --------------------------------------------------: | ------: | -------------------------------: |
| `timeout`      |                                        300 s (5 min) |      1 s |                86,400 s (24 h) |
| `idle_timeout` | `None` (disabled; stays active until `timeout`)     |      1 s | `timeout` value (up to 24 h)   |

- `timeout` = **absolute maximum total lifetime** from creation — **not** a command or API-call timeout; Modal terminates the Sandbox when reached, even if still running. For work beyond 24 h, save state via filesystem snapshots and resume in a new Sandbox.
- `idle_timeout` = terminate after that much idleness; default `None`. Active means an `sb.exec(...)` process is running, data is written to `sb.stdin`, or a TCP tunnel connection is open.
- With both set, whichever occurs first terminates the Sandbox.

```python
sandbox = modal.Sandbox.create(
    ...,
    timeout=24 * 60 * 60,  # absolute lifetime: 24 h
    idle_timeout=30 * 60,  # kill after 30 min idle
)
```

## Sandbox pricing

- Ref: https://modal.com/pricing -> under FAQ: `How are CPU and memory usage metered?`
- Concepts:
  - **Requested amount**: the dedicated allocation reserved for the container/sandbox on the host machine — the container is guaranteed these resources, and can burst above them up to the Limit Amount if spare host capacity exists.
  - **[Limit Amount](https://modal.com/docs/guide/resources#resource-limits)**: the maximum capacity the container may consume — the host throttles execution above it.
  - **Spare resources**: extra resources Modal provides automatically when usage exceeds the request and host capacity is available — never beyond the Limit Amount.
  - **Bill** = Requested Amount + Spare resources used = `max(requested, actually used)`.
- Trade-off: a request reserves dedicated capacity on a host (without it, a heavily loaded host can cause CPU throttling or memory starvation under sudden load), but you pay for the reservation even when unused. **Suggestion**: don't set requests — throttling/starvation almost never happens, so setting one normally means overpaying for resources you didn't use.

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

| Product Category                                         | Offering                                                                                                                  | Runtime / Isolation Architecture                      | Primary Use Case & Characteristics                                                                                                                                                               |
| -------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| **[Sandboxes](https://modal.com/products/sandboxes)**    | **[Standard / Regular Sandboxes](https://modal.com/docs/guide/sandboxes)** (`modal.Sandbox.create()`)                     | Container-based (gVisor isolation)                    | Sub-second cold starts, dynamic execution of LLM-generated or untrusted code, running shell commands, filesystem snapshotting, and concurrent agent or RL environments. Does not support Docker. |
|                                                          | **[VM Sandboxes](https://modal.com/docs/guide/vm-sandboxes)** (`vm_runtime=True`)                                         | Hardware-isolated virtual machine (real Linux kernel) | Dedicated guest kernel; enables Docker-in-Docker, systemd / custom init systems (via `vm_init`), eBPF, loopback filesystems, and FUSE.                                                           |
| **[Inference](https://modal.com/products/inference)**    | **[Web Functions / Endpoints](https://modal.com/docs/guide/webhooks)** (`@app.web_endpoint()`, `@app.fastapi_endpoint()`) | Standard serverless container runtime                 | Synchronous or streaming HTTP APIs autoscaling from zero with optimized cold starts.                                                                                                             |
|                                                          | **[Shared Endpoints](https://modal.com/docs/guide/shared-endpoints)**                                                     | Multi-tenant HTTP ingress                             | Routes requests to an elastically shared pool of container instances to maximize hardware utilization.                                                                                           |
|                                                          | **[Dedicated Endpoints](https://modal.com/docs/guide/dedicated-endpoints)**                                               | Isolated HTTP ingress                                 | Pins traffic to dedicated, isolated container instances for predictable latency and zero noisy-neighbor impact.                                                                                  |
| **[Batch](https://modal.com/products/batch)**            | **[Batch Processing](https://modal.com/docs/guide/batch-processing)** (`Function.map` / `starmap`)                        | Serverless container workers                          | High-throughput fan-out across hundreds or thousands of parallel containers for offline jobs and media processing.                                                                               |
|                                                          | **[Job Queues](https://modal.com/docs/guide/job-queue)**                                                                  | Queue-backed worker pools                             | Decoupled asynchronous task consumption with native scheduling, concurrency controls, and retries.                                                                                               |
|                                                          | **[Dynamic Batching](https://modal.com/docs/guide/dynamic-batching)**                                                     | Batched worker loops                                  | Automatically aggregates concurrent inbound calls into single execution batches to maximize GPU throughput.                                                                                      |
| **[Training](https://modal.com/products/training)**      | **Single-Node Training**                                                                                                  | High-spec GPU containers                              | Fast-spin GPU workloads (H100, A100, L40S) for model fine-tuning with local NVMe caching and shared storage.                                                                                     |
|                                                          | **[Multi-Node Clusters](https://modal.com/docs/guide/multi-node-training)**                                               | Distributed interconnected nodes                      | Multi-node cluster orchestration for large-scale distributed training using technologies like torchrun and RDMA/InfiniBand networking.                                                           |
| **[Notebooks](https://modal.com/products/notebooks)**    | **[Jupyter Notebooks](https://modal.com/docs/guide/jupyter-notebooks)**                                                   | Interactive cloud container                           | Cloud-backed interactive development environments connecting directly to remote GPU memory and persistent volumes.                                                                               |
| **[Core Platform](https://modal.com/products/platform)** | **[Apps](https://modal.com/docs/guide/apps)** (`modal.App`)                                                               | Orchestration & deployment boundary                   | Top-level namespace grouping Functions, Sandboxes, Images, Volumes, and Secrets; defines how code is deployed, managed, and monitored.                                                           |
|                                                          | **[Functions](https://modal.com/docs/guide/functions)** (`@app.function()`)                                               | Core serverless execution engine                      | Python code executed in the cloud on-demand as autoscaling, pay-per-second compute units; manages autoscaling to zero, concurrency, batch processing, and retries.                               |
|                                                          | **Containers**                                                                                                            | Execution substrate                                   | Runtime environment spun up dynamically to execute Functions or Sandboxes based on your specified [Image](https://modal.com/docs/guide/images) (e.g. Debian slim, custom CUDA images).           |
|                                                          | **[Sidecars](https://modal.com/docs/guide/sandbox-sidecars)**                                                             | Auxiliary container pattern                           | Supporting processes running alongside the primary container (e.g. local proxy caches, log shippers).                                                                                            |
|                                                          | **[Storage - Volumes](https://modal.com/docs/guide/volumes)**                                                             | Distributed read-write filesystem (`modal.Volume`)    | Low-latency shared filesystem optimized for model weight caching and fast reads across tasks.                                                                                                    |
|                                                          | **[Storage - Cloud Bucket Mounts](https://modal.com/docs/guide/cloud-bucket-mounts)**                                     | Object storage integration                            | Direct streaming mounts of external S3 or Google Cloud Storage buckets into container paths.                                                                                                     |
|                                                          | **[State - Dicts & Queues](https://modal.com/docs/guide/dicts)** ([Queues](https://modal.com/docs/guide/queues))          | Distributed data structures                           | Low-latency key-value stores (`modal.Dict`) and FIFO queues (`modal.Queue`) for inter-task coordination.                                                                                         |
|                                                          | **[Networking - Tunnels & Proxies](https://modal.com/docs/guide/tunnels)**                                                | Network primitives                                    | Exposes ports on running containers to the public internet via encrypted TLS tunnels or routes traffic through static proxies.                                                                   |

## Pricing

| Modal Offering / Primitive               | Minimum CPU Request | Default CPU Request | Default CPU Limit             | Minimum Memory Request | Default Memory Request | Default Memory Limit | Default Ephemeral Disk Quota   |
| ---------------------------------------- | ------------------- | ------------------- | ----------------------------- | ---------------------- | ---------------------- | -------------------- | ------------------------------ |
| **Functions** (`@app.function`)          | 0.125 cores         | 0.125 cores         | 16.125 cores _(request + 16)_ | 128 MiB                | 128 MiB                | None _(unbounded)_   | 512 GiB                        |
| **Endpoints / Web Functions**            | 0.125 cores         | 0.125 cores         | 16.125 cores _(request + 16)_ | 128 MiB                | 128 MiB                | None _(unbounded)_   | 512 GiB                        |
| **Standard Sandboxes** (`modal.Sandbox`) | 0.125 cores         | 0.125 cores         | 16.125 cores _(request + 16)_ | 128 MiB                | 128 MiB                | None _(unbounded)_   | 512 GiB                        |
| **VM Sandboxes** (`vm_runtime=True`)     | 0.125 cores         | 0.125 cores         | 16.125 cores _(request + 16)_ | 1 GiB _(1024 MiB)_     | 1 GiB _(1024 MiB)_     | Memory requested     | 512 GiB                        |
| **Sidecars**                             | 0.125 cores         | 0.125 cores         | 16.125 cores _(request + 16)_ | 128 MiB                | 128 MiB                | None _(unbounded)_   | Inherits parent container disk |
| **Volumes / Storage / Queues**           | N/A                 | N/A                 | N/A                           | N/A                    | N/A                    | N/A                  | N/A _(managed storage)_        |

Semantics and sources:

- **Minimum vs. default request:** the default requested baseline is identical to the platform minimum — you cannot provision less than 0.125 CPU cores or 128 MiB RAM (1 GiB RAM for VM Sandboxes). Any smaller request is rounded up or rejected at definition time. — [Configuring CPU, memory, and disk](https://modal.com/docs/guide/resources)
- **Soft CPU limit:** Modal applies a soft limit of 16 physical cores above the request (16.125 by default); the host throttles above it. — [CPU limits](https://modal.com/docs/guide/resources#cpu-limits)
- **Hard memory limit:** none by default, so containers can burst up to the host worker's capacity; a hard limit is applied only via `memory=(request, limit)`. — [Memory limits](https://modal.com/docs/guide/resources#memory-limits)
- **Ephemeral disk quota:** 512 GiB per container. — [Disk limits](https://modal.com/docs/guide/resources#disk-limits)
- **VM Sandbox exceptions:** memory provisioning is static — a VM Sandbox gets exactly the RAM requested (default 1 GiB), so a process exceeding it is killed; only CPU bursts. Root images are capped at 512 GiB. — [Resource model](https://modal.com/docs/guide/vm-sandboxes#resource-model), [Limitations](https://modal.com/docs/guide/vm-sandboxes#limitations)
