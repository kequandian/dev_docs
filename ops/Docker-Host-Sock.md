Enable TCP port 2375 for external connection to Docker
------------------------------------------------------

See this [issue](https://github.com/moby/moby/issues/25471).  
Docker best practise to [Control and configure Docker with systemd](https://docs.docker.com/engine/admin/systemd/#/custom-docker-daemon-options).  

1. Create `daemon.json` file in `/etc/docker`:

        {"hosts": ["tcp://0.0.0.0:2375", "unix:///var/run/docker.sock"]}

2. Add `/lib/systemd/system/docker.service`

        [Service]
        # ExecStart=/usr/bin/dockerd -H fd:// --containerd=/run/containerd/containerd.sock
        ExecStart=/usr/bin/dockerd --containerd=/run/containerd/containerd.sock

3.     Optional: Add `/etc/systemd/system/docker.service.d/override.conf`

        [Service]
        ExecStart=
        ExecStart=/usr/bin/dockerd

4. Reload the systemd daemon:

        systemctl daemon-reload

5. Restart docker:

        systemctl restart docker.service

6. Verify:

        docker -H unix:///var/run/docker.sock images
        docker -H tcp://0.0.0.0:2375 images
        
        export DOCKER_HOST=unix:///var/run/docker.sock
        docker images
        export DOCKER_HOST=tcp://0.0.0.0:2375
        docker images
        
        curl --unix-socket /var/run/docker.sock http://localhost/images/json
        curl http://localhost:2375/images/json
        
Use SSH to protect the Docker daemon socket
-------------------------------------------
https://docs.docker.com/engine/security/protect-access/
