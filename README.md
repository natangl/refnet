# Creating refnet client on docker:
#### Cloning the repository

build the docker from github
```sh
$ docker build --tag "refnet" https://github.com/natangl/refnet.git
```

##### Now run the image in the background
```sh
$ docker run -td --name refnet -p 11332:11332 -p 21332:21332 -p 21443:21443 -p 11334:11333 docker_id
```

#### And to run a bash terminal inside the docker:
```sh
$ docker exec -it refnet /bin/bash
```

# Deploying to Heroku
#### 1. Pull repository and Go to Folder

Pull repo & Navigate to refnet folder

#### 2. Create App
Login and create Heroku app
```sh
heroku login
heroku create
```
#### 3. Preparing App
Set container stack
```sh
heroku stack:set container
git push heroku master
```

#### 4. Building Refnet on Heroku
Go to app on Heroku web, click More and run console (or find a way to SSH)
```sh
cd refnet
./autogen.sh
./configure --disable-tests --disable-bench --disable-static --without-gui --disable-zmq --with-incompatible-bdb  CFLAGS='-w' CXXFLAGS='-w'
make
```

#### 5. Run
```sh
cd src/
./refnetd
```
