# README

If you don't have Ruby and Rails installed in your machine, you can follow the
steps below:

# Required

* [Docker Engine](https://docs.docker.com/installation/)
* [Docker Compose](https://docs.docker.com/compose/install/)

To run the application do:

1-)

```
  docker-compose build
```

After you finish as useful images, you can run an application using the command below:

2-)

```
  docker-compose up
```

3-) To create the database, in other terminal run the command:

```
  docker-compose run web rake db:setup
```

The application can now be accessed by the host http://localhost:3000

## Scripts

run the command:

It'll start a robot with commands in script/commands.txt

```
  docker-compose run web rails runner script/robot_simulator.rb
```

## Tests

run the command:

```
  docker-compose run web rspec
```
