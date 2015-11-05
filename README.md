# scalable-qa-with-docker

[![Join the chat at https://gitter.im/xebia/scalable-qa-with-docker](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/xebia/scalable-qa-with-docker?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

_This clusters is configured to use a significant amount of resources.
Current set up allocates 6 CPU and 6 GB of memory._

This project just works out of the box with but needs an active internet connection to download docker images and github projects. If you want to use this project _offline_ please checkout the branch **"offline"**.

####Prerequisites

- [Vagrant](https://www.vagrantup.com/) + [VirtualBox](https://www.virtualbox.org/)
- _For linux users_: install nfs-kernel services, for example ```apt-get install nfs-kernel-server```

####Given:

    $ git clone https://github.com/xebia/scalable-qa-with-docker.git
    $ cd scalable-qa-with-docker

####When:

    $ vagrant up

####Then:

You have to start services yourself with [systemctl](https://coreos.com/docs/launching-containers/launching/getting-started-with-systemd/), a utility baked into CoreOs designed to start, stop and manage processes defined in unit files. Let's start mesos:

    $ vagrant ssh core-01
    $ sudo systemctl start mesos-master

You can follow the progress of services booting when logging on to a core, for example core-01:

    $ vagrant ssh core-01
    $ journalctl -u mesos-master -f

## Services Provided

_Once a sevice is started these links below will point to your local instance of the running service._

### core-01

- docker.service
- jenkins.service - URL: [Jenkins](http://172.17.8.101:8080)
- selenium-hub.service - URL: [Selenium Hub](http://172.17.8.101:4444/grid/console)
- mesos-master.service - URL: [Mesos Master](http://172.17.8.101:5050)
- mesos-slave.service
- marathon.service - URL: [Marathon](http://172.17.8.101:8082)
- node-chrome.service
- node-firefox.service

### core-02

- docker.service
- mesos-slave.service
- chrome-debug.service - URL: [Chrome Debug](http://172.17.8.101:4448/grid/console)
- node-chrome.service
- node-firefox.service
