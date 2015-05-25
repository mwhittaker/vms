#! /bin/sh

# jdk
wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" 'http://download.oracle.com/otn-pub/java/jdk/8u45-b14/jdk-8u45-linux-x64.tar.gz'
tar -xzvf jdk-8u45-linux-x64.tar.gz
echo 'export JAVA_HOME="$HOME/jdk1.8.0_45"' >> ~/.bash_path
echo 'export PATH="$JAVA_HOME/bin:$PATH"'   >> ~/.bash_path

# eclipse
wget 'http://ftp.osuosl.org/pub/eclipse/technology/epp/downloads/release/luna/SR2/eclipse-java-luna-SR2-linux-gtk-x86_64.tar.gz'
tar -xzvf eclipse-java-luna-SR2-linux-gtk-x86_64.tar.gz
echo 'export ECLIPSE_HOME="$HOME/eclipse"' >> ~/.bash_path
echo 'export PATH="$ECLIPSE_HOME:$PATH"'   >> ~/.bash_path

# eclim
wget 'http://downloads.sourceforge.net/project/eclim/eclim/2.4.1/eclim_2.4.1.jar?r=http%3A%2F%2Feclim.org%2Finstall.html&ts=1432566975&use_mirror=iweba' -O eclim_2.4.1.jar
JAVA_HOME="$HOME/jdk1.8.0_45" PATH="$JAVA_HOME/bin:$PATH" jdk1.8.0_45/bin/java -Dvim.files=/home/vagrant/.vim -Declipse.home=/home/vagrant/eclipse -jar eclim_2.4.1.jar install
