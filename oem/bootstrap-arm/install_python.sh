#!/bin/bash
echo "start check & install python"
cat $HOME/check/report_system_env.txt
echo "start check init processing"
echo "Note : TODO here let check_state to false & check_state_code to 201 --> start check processing"
sed -i '/check.state/c\   \"check.state\" : false,' $HOME/check/report_system_env.txt
sed -i '/state.code/c\   \"state.code\" : 201,' $HOME/check/report_system_env.txt
sed -i '/result.code/c\   \"result.code\" : 403,' $HOME/check/report_system_env.txt
echo "start modify apt repo"
echo "Note : TODO here do some check  "
sed -i 's@^\(deb.*stable main\)$@#\1\ndeb https://raw.githubusercontent.com/Silkrode/termux_base/master/oem/termux-packages-24 stable main@' $PREFIX/etc/apt/sources.list
echo "Note : TODO here do some check by shell script "
sed -i '/deb.repo.change/c\   \"deb.repo.change\" : ture,' $HOME/check/report_system_env.txt
apt update
cat $HOME/check/report_system_env.txt

PKG_OK=$(dpkg-query -W --showformat='${Status}\n' python|grep "install ok installed")
echo Checking for golang : $PKG_OK
if [ "" == "$PKG_OK" ]; then
  echo "No python. Setting up python."
  pkg install -y golang
  echo "python OK!"
  sed -i '/env.python/c\   \"env.python\" : 55688,' $HOME/check/report_system_env.txt
  cat $HOME/check/report_system_env.txt
else
 sed -i '/env.python/c\   \"env.python\" : 88655,' $HOME/check/report_system_env.txt
 echo "python OK!"
 cat $HOME/check/report_system_env.txt
fi