# Sherpa ttbar @ 13 TeV


# build (requires docker)
```
git clone https://github.com/BristolTopGroup/sherpa_ttbar_13TeV.git
cd sherpa_ttbar_13TeV

export DOCKERHUB_USER=<your dockerhub user name>
# use `export DOCKERHUB_USER=local` if you do not plan to upload the image
make
# to upload to dockerhub
docker login
make push
```

# run
```
docker run --rm -t -d --name sherpa_ttbar_13TeV -e NUMBER_OF_CORES=42 -v <path to output on host>/:/output --privileged kreczko/sherpa:ttbar_13TeV
```
