# rsyncd_docker
## Run rsyncd daemon in a container

https://github.com/iainbullock/rsyncd_docker

For my personal use, not publically supported

## Set up instructions
1. Create a Docker volume called rsyncd_docker
2. Review and modify the docker-compose.yml file according to your requirments. Likely changes will be the volume mapping - /home:/home, and port mapping
3. Deploy the Docker stack using your modified docker-compose.yml
4. Let the container run for the first time to create the default config files in the Docker volume
5. Modify the rsyncd.conf and rsyncd.secrets config files according to your needs. Make sure the UID and GIDs in the Module definitions match permsssions for the respective path on the host
6. When the config files have been setup, delete the 'not_configured' file from the Docker volume
7. The daemon should then start

## Testing
Run a command like this on the Docker host. This will attempt to sync a folder called github to the location defined in the 'mark' Module 
```
rsync -avh --delete --progress github rsync://mark@localhost:10873/mark
```
You will be prompted for the password (defined in rsyncd.secrets). If you want to specify the password as part of a script, either set the RSYNC_PASSWORD variable, or use the --password-file=FILE option, e.g.
```
export RSYNC_PASSWORD=password2
rsync -avh --delete --progress github rsync://mark@localhost:10873/mark
```
