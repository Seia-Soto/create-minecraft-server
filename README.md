# create-minecraft-server

Automation of Spigot Minecraft server environment set up for Ubuntu/Debian based Linux distros.

## Table of Contents

- [Automation](#Automation)
- [Howto](#Howto)
- [Fix](#Fix)

----

# Automation

This script will:

- Install OpenJDK v11 headless
- Download latest version of Spigot BuildTools.jar and execute

# Howto

Download this `bash` script and execute as root user.

```sh
mkdir build
cd build

chmod +x filename # make executable
sudo bash scriptFilename [version] # if version was not specified, the script will use `latest` as version
```

# Fix

## `line 3: $'\r': command not found`

This error will be occur if you try to run the script written in Windows environment.

Because of carriage return difference, you need to convert the document to UNIX format.

```sh
apt update
apt install dos2unix -y

dos2unix script
```
