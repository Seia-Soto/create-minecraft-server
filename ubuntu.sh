echo Seia-Soto/create-minecraft-server
echo   Automation of Spigot Minecraft server environment set up for Ubuntu/Debian based Linux distros.

if ! [ -n "$(uname -a | grep Ubuntu)" ]; then
  echo "ERROR: This script supports Ubuntu only." 1>&2
  exit 1
fi

if [ "$(id -u)" != "0" ]; then
  echo "ERROR: This script requires ROOT permission to install packages and setup the environment." 1>&2
  exit 1
fi

VERSION=$1

if ! [[ "$VERSION" ]]; then
  VERSION="latest"
fi

# Confirm version to build.
if ! [[ "$1" =~ latest|\d+\.\d+\.\d+ ]]; then
  echo "WARNING: The given version string is not identified. Please check again." >&2
  echo "WARNING: To specify the version of the bucket, use '$0 install [version]' instead." >&2
fi

echo "INFO: The script will build the bucket as following version: $VERSION" >&2

read -p "Press enter to continue..."

# Install Open JDK 11 to Ubuntu.
echo "INFO: Installing OpenJDK v11 to system..." >&2

sudo add-apt-repository ppa:openjdk-r/ppa
sudo apt update --fix-missing
sudo apt install openjdk-11-jdk -y

# Download BuildTools.jar from official source.
echo "INFO: Downloading BuildTools.jar from official source..." >&2

wget -O BuildTools.jar https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar

# Execute BuildTools.jar.
echo "INFO: Executing BuildTools.jar to build fresh bucket..." >&2

java -jar BuildTools.jar --rev $VERSION

echo "Successfully installed OpenJDK v11 and built fresh bucket into this machine." >&2
