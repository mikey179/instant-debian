# Instant Debian

Simple Dockerfile based on Debian Jessie, including [Oh My ZSH!](http://ohmyz.sh)
and my own [dotfiles](https://github.com/mikey179/dotfiles).


## Installation

```
curl -sS  https://raw.githubusercontent.com/mikey179/instant-debian/master/setup/install.sh | sh
```

I recommend you verify the contents of the downloaded file first, before piping
it into your shell. ;-)


## Update

Simply do the installation again. This will update the Docker image.


## Startup on OS X

Here is a small script which makes starting the container very easy on a OS X.
It will ensure your SSH key and your list of known hosts is available in the
container, use the current directory name as the hostname (so you can
differentiate between different instances if you have more than one) and mount
the current directory into the container.

```
#!/bin/bash
HOSTNAME=$(basename $(pwd))
docker-machine ssh default -A -t "docker run -it --rm -v \$SSH_AUTH_SOCK:/root/ssh-agent -e SSH_AUTH_SOCK=/root/ssh-agent -h $HOSTNAME -v $(pwd):/root/workspace -v $HOME/.ssh/known_hosts:/root/.ssh/known_hosts mikey179/instant-debian"
```
