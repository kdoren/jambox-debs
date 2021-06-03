# jambox-debs
Package creation for repo.jambox-project.com

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
sudo apt install jamtrip
sudo apt install jamtaba
sudo apt install qjacktrip
sudo apt install jammernetz
```
