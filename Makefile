service-name := simulator-front
image := $(service-name)-img
container := $(service-name)-con
port_in := 80
port_out := 61014

all: build run

clean:
	-docker stop $(container)
	-docker rm $(container)

build: 
	docker build -t ${image} -f Dockerfile .

run:
	docker run -t -d -i -p ${port_out}:${port_in} --name ${container} ${image} &	

runlocal: clean build run

