The `docker build` command is used to **create a Docker image** from a set of instructions defined in a `Dockerfile`.

---
## 🔹 Basic Syntax

```bash
docker build [OPTIONS] PATH | URL | -
```

* **PATH** → directory containing the `Dockerfile` (usually `.` for current folder)
* **OPTIONS** → flags to customize the build

---

```bash
# build docker image with tag 'myapp' and version '1.0'
# "." at the end represents path of build context
docker build -t myapp:1.0 .

# specify dockerfile path, here Dockerfile.dev; defualt: dockerfile
docker build -f Dockerfile.dev .

# disable cache
docker build --no-cache .

docker build --platform linux/amd64 .
```

---
## 🔹 Build Process (Step-by-Step)

1. Docker reads the `Dockerfile`
2. Sends build context to Docker daemon
3. Executes instructions one by one
4. Caches layers when possible
5. Produces a final **image**

---
## 🔹 Example Workflow

```bash
# 1. Build image
docker build -t my-node-app .

# 2. Run container
docker run -p 3000:3000 my-node-app
```

---
