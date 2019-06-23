# Creating refnet client on docker:
#### Cloning the repository

build the docker from github
```sh
$ docker build --tag "refnet" https://github.com/DVH1990/refnet.git
```

##### Now run the image in the background
```sh
$ docker run -td --name refnet -p 11332:11332 -p 21332:21332 -p 21443:21443 -p 11334:11333 docker_id
```

#### And to run a bash terminal inside the docker:
```sh
$ docker exec -it sigbit /bin/bash
```

### now you will want to pull yehuda_new branch
```sh
$ cd refnet
$ git pull origin yehuda_new
```

### now build the node
```sh
$ ./autogen.sh
$ ./configure --disable-tests --disable-bench --disable-static --without-gui --disable-zmq --with-incompatible-bdb  CFLAGS='-w' CXXFLAGS='-w'
$ make
```
