# scalable-qa-with-docker

[![Join the chat at https://gitter.im/xebia/scalable-qa-with-docker](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/xebia/scalable-qa-with-docker?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

_This clusters is configured to use a significant amount of resources.
Current set up allocates 6 CPU and 6 GB of memory._

####Prerequisites

- Download [data.tar.gz](http://bit.ly/scale-qa-data-online) and unzip, place in root of this project (_overwrite data directory_)
- [Vagrant](https://www.vagrantup.com/) + [VirtualBox](https://www.virtualbox.org/)
- For linux users: install nfs-kernel services, for example ```apt-get install nfs-kernel-server```

####Given:

    $ git clone https://github.com/xebia/scalable-qa-with-docker.git
    $ cd scalable-qa-with-docker

####When:

    $ vagrant up

####Then:

You have to start services yourself with ```systemctl```, a utility baked into CoreOs designed to stop, start and manage processes defined in [unit files](https://coreos.com/docs/launching-containers/launching/getting-started-with-systemd/), for example let's start gitbucket:

    $ vagrant ssh core-01
    $ sudo systemctl start gitbucket

You can follow the progress of services booting when logging on to a core, for example core-01:

    $ vagrant ssh core-01
    $ journalctl -u gitbucket -f

## Services Provided

_Once a sevice is started below links will point to your local instance of the running service._

### core-01

- docker.service
- docker-registry.service - URL: [Docker Registry](http://172.17.8.101:5000/v2/_catalog)
- jenkins.service - URL: [Jenkins](http://172.17.8.101:8080)
- gitbucket.service - URL: [GitBucket](http://172.17.8.101:8081) (login:root-root)
- Selenium Hub.service - URL: [Selenium Hub](http://172.17.8.101:4444/grid/console)
- mesos-master.service - URL: [Mesos Master](http://172.17.8.101:5050)
- marathon.service - URL: [Marathon](http://172.17.8.101:8082)

### core-02

- docker.service
- mesos-slave.service
- chrome-debug.service - URL: [Chrome Debug](http://172.17.8.101:4448/grid/console)
