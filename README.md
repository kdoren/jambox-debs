# jambox-debs
Package creation for repo.jambox-project.com

To use:
```
# add gpg key and repo to apt
sudo apt-key adv --fetch-keys https://jambox-project.s3-us-west-2.amazonaws.com/resources/repo.jambox-project.com.gpg
sudo sh -c "echo 'deb http://repo.jambox-project.com buster main' > /etc/apt/sources.list.d/jambox-project.list"
sudo apt update

# install packages from repo
sudo apt-get install jamulus
sudo apt-get install sonobus
sudo apt-get install aj-snapshot
sudo apt-get install jacktrip
```
