# Sherpa ttbar @ 13 TeV


# build (requires docker)
```
git clone https://github.com/kreczko/sherpa_ttbar_13TeV.git
cd sherpa_ttbar_13TeV
make
```

# run
```
docker run --rm -t -d --name sherpa_ttbar_13TeV -e NUMBER_OF_CORES=42 -v <path to output on host>/:/output --privileged kreczko/sherpa:ttbar_13TeV
```
