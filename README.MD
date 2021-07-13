# Database Versioner

> ### *NOTE*: tool is not working now
[see issue](https://github.com/wallach-game/DatabaseVersioner/issues/1)

## Description
This tool can only be used for **Docker Container** Mysql databases,
but can be probably tweaked for other databases types and enviroments

## Future development
> dunno
### these section is for my **notes**
> move this somewhere else

> create setting script

> also i want more settings

ok i will have to create file system as mentioned, and have to figure out **new commands**.


## How it works (v0.0.1)
> ### *NOTE*: tool is not working now
[see issue](https://github.com/wallach-game/DatabaseVersioner/issues/1)

### Config

config id exluded from source controll
config contains two variables
* CONTAINERID
  * Docker container id ex: 02b3c87c4dde
* DATABASENAME 
  * Name of database which data you want save 

### Commit 
> (/bin/CommitDatabase.sh)

Code steps:

1. Copy data from Docker container
1. Archivate data from container
   1. Move the data to commit folder
   1. purge the working directory
1. done!
 
### Loading old commit

1. Load all commits
2. let use chose commit
3. upload commit files to docker container
4. purge working directort 

### File system
> cause i was too stupid to read about how mysql handles table scheme, file system need to be reworked, mainly not working completely now

#### Future file system
* Work Directory
  * Commit Directory
    * Database Data Directory
      * database table files (*.ibd) 
    * Database Schema Directory
      * mysql.ibd 

#### Current file system (v0.0.1)
There is *none* xD, i just realing on tar to create file system and not really think about that
