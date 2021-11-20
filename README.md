# jambox-debs
Package creation for repo.jambox-project.com

The jambox-project apt repo contains recent armhf builds of music and jamming-related software packaged from upstream sources.  Includes jackd2, alsa-lib, alsa-utils, and mididings. Jamming apps include jamulus, sonobus, jamtaba, jacktrip, hpsjam, and jammernetz. 

To use:
```
# add gpg key and repo to apt
sudo apt-key adv --fetch-keys https://jambox-project.s3-us-west-2.amazonaws.com/resources/repo.jambox-project.com.gpg
sudo sh -c "echo 'deb http://repo.jambox-project.com buster main' > /etc/apt/sources.list.d/jambox-project.list"
sudo apt update

# install packages from repo
sudo apt install jamulus
sudo apt install sonobus
sudo apt install aj-snapshot
sudo apt install jacktrip
sudo apt install jamtaba
sudo apt install jammernetz
sudo apt install hpsjam
sudo apt install mididings mididings-doc
```
