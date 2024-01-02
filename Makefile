.PHONY: dbgen

STAGE_DIR = stage

all:
	go build -ldflags='-s -w' -o dbgen

db:
	@echo "Making $@ ..."
	@docker pull neuvector/build_fleet
	@docker run --rm -ia STDOUT --name build -e VULN_VER=1.0 -e NVD_KEY=$(NVD_KEY) -v $(CURDIR):/go/src/github.com/neuvector/vul-dbgen -w /go/src/github.com/neuvector/vul-dbgen --entrypoint ./make_db.sh neuvector/build_fleet
