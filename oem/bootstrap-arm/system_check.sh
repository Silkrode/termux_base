#!/bin/bash
cat $HOME/check/report_system_env.txt
echo "start modify apt repo"
echo "Note : TODO here do some check  get  open_times let every time open_times plus 1"
sed -i '/open.times/c\   \"open.times\" : 0,' $HOME/check/report_system_env.txt
echo "Note : TODO here let check_state to false & check_state_code to 201 --> start check processing"
sed -i '/check.state/c\   \"check.state\" : false,' $HOME/check/report_system_env.txt
sed -i '/check.state.code/c\   \"check.state.code\" : 201,' $HOME/check/report_system_env.txt
echo "start modify apt repo"
echo "Note : TODO here do some check  "
sed -i 's@^\(deb.*stable main\)$@#\1\ndeb https://raw.githubusercontent.com/Silkrode/termux_base/master/oem/termux-packages-24 stable main@' $PREFIX/etc/apt/sources.list
echo "Note : TODO here do some check by shell script "
sed -i '/deb.repo.change/c\   \"deb.repo.change\" : ture,' $HOME/check/report_system_env.txt
apt update


PKG_OK=$(dpkg-query -W --showformat='${Status}\n' curl|grep "install ok installed")
echo Checking for curl: $PKG_OK
if [ "" == "$PKG_OK" ]; then
  echo "No curl. Setting up curl."
  pkg install -y curl
  echo "curl OK!"
  sed -i '/env.curl/c\   \"env.curl\" : 1,' $HOME/check/report_system_env.txt
  PKG_OK=$(dpkg-query -W --showformat='${Status}\n' golang|grep "install ok installed")
    echo Checking for 1 golang: $PKG_OK

    if [ "" == "$PKG_OK" ]; then
      echo "No golang. Setting up golang."
      pkg install -y golang
      echo "1 golang OK!"
      sed -i '/env.golang/c\   \"env.golang\" : 1,' $HOME/check/report_system_env.txt
      PKG_OK=$(dpkg-query -W --showformat='${Status}\n' python|grep "install ok installed")
        echo Checking for 1 python: $PKG_OK
        if [ "" == "$PKG_OK" ]; then
              echo "No python. Setting up python."
              pkg install -y python
              echo "1 python OK!"
              sed -i '/env.python/c\   \"env.python\" : 1,' $HOME/check/report_system_env.txt
              sed -i '/check.state/c\   \"check.state\" : true,' $HOME/check/report_system_env.txt
              sed -i '/check.state.code/c\   \"check.state_code\" : 200,' $HOME/check/report_system_env.txt
              sed -i '/state.error.message/c\   \"state.error.message\" : \"demo how to modify json string by shell script\",' $HOME/check/report_system_env.txt
              cat $HOME/check/report_system_env.txt
            else
                echo "do others!"
                sed -i '/check.state/c\   \"check.state\" : true,' $HOME/check/report_system_env.txt
                sed -i '/check.state.code/c\   \"check.state.code\" : 200,' $HOME/check/report_system_env.txt
                sed -i '/state.error.message/c\   \"state.error.message\" : \"demo how to modify json string by shell script\",' $HOME/check/report_system_env.txt
                cat $HOME/check/report_system_env.txt
            fi
    else
        echo "check 2 python "
    	PKG_OK=$(dpkg-query -W --showformat='${Status}\n' python|grep "install ok installed")
        echo Checking for python: $PKG_OK
        if [ "" == "$PKG_OK" ]; then
              echo "No python. Setting up python."
              pkg install -y python
              echo "2 python OK!"
              sed -i '/env.python/c\   \"env.python\" : 1,' $HOME/check/report_system_env.txt
               sed -i '/check.state/c\   \"check.state\" : true,' $HOME/check/report_system_env.txt
                sed -i '/check.state.code/c\   \"check.state.code\" : 200,' $HOME/check/report_system_env.txt
                sed -i '/state.error.message/c\   \"state.error.message\" : \"demo how to modify json string by shell script\",' $HOME/check/report_system_env.txt
                cat $HOME/check/report_system_env.txt
            else
                echo "do others!"
                sed -i '/check.state/c\   \"check.state\" : true,' $HOME/check/report_system_env.txt
                sed -i '/check.state.code/c\   \"check.state.code\" : 200,' $HOME/check/report_system_env.txt
                sed -i '/state.error.message/c\   \"state.error.message\" : \"demo how to modify json string by shell script\",' $HOME/check/report_system_env.txt
                cat $HOME/check/report_system_env.txt
fi

    fi
else
 sed -i '/env.curl/c\   \"env.curl\" : 1,' $HOME/check/report_system_env.txt
echo "check 2 golang!"
	PKG_OK=$(dpkg-query -W --showformat='${Status}\n' golang|grep "install ok installed")
    echo Checking for golang: $PKG_OK

    if [ "" == "$PKG_OK" ]; then
      echo "No golang. Setting up golang."
      pkg install -y golang
        echo "2 golang OK!"
        sed -i '/env.golang/c\   \"env.golang\" : 1,' $HOME/check/report_system_env.txt
        PKG_OK=$(dpkg-query -W --showformat='${Status}\n' python|grep "install ok installed")
        echo Checking for python: $PKG_OK
        echo "check 3  python !"
        if [ "" == "$PKG_OK" ]; then
                      echo "No python. Setting up python."
                      pkg install -y python
                      echo "3 python OK!"
                      sed -i '/env.python/c\   \"env.python\" : 1,' $HOME/check/report_system_env.txt
                      sed -i '/check.state/c\   \"check.state\" : true,' $HOME/check/report_system_env.txt
                      sed -i '/check.state.code/c\   \"check.state.code\" : 200,' $HOME/check/report_system_env.txt
                      sed -i '/state.error.message/c\   \"state.error.message\" : \"demo how to modify json string by shell script\",' $HOME/check/report_system_env.txt
                      cat $HOME/check/report_system_env.txt
                    else
                        echo "do others!"
                        sed -i '/check.state/c\   \"check.state\" : true,' $HOME/check/report_system_env.txt
                        sed -i '/check.state.code/c\   \"check.state.code\" : 200,' $HOME/check/report_system_env.txt
                        sed -i '/state.error.message/c\   \"state.error.message\" : \"demo how to modify json string by shell script\",' $HOME/check/report_system_env.txt
                        cat $HOME/check/report_system_env.txt
                    fi
    else
    	PKG_OK=$(dpkg-query -W --showformat='${Status}\n' python|grep "install ok installed")
        echo Checking for python: $PKG_OK
        if [ "" == "$PKG_OK" ]; then
              echo "No python. Setting up python."
              pkg install -y python
              echo "4 python OK!"
              sed -i '/env.python/c\   \"env.python\" : 1,' $HOME/check/report_system_env.txt
              sed -i '/check.state/c\   \"check.state\" : true,' $HOME/check/report_system_env.txt
              sed -i '/check.state.code/c\   \"check.state.code\" : 200,' $HOME/check/report_system_env.txt
              sed -i '/state.error.message/c\   \"state.error.message\" : \"demo how to modify json string by shell script\",' $HOME/check/report_system_env.txt
              cat $HOME/check/report_system_env.txt
            else
                echo "do others!"
                sed -i '/check.state/c\   \"check.state\" : true,' $HOME/check/report_system_env.txt
                sed -i '/check.state.code/c\   \"check.state.code\" : 200,' $HOME/check/report_system_env.txt
                sed -i '/state.error.message/c\   \"state.error.message\" : \"demo how to modify json string by shell script\",' $HOME/check/report_system_env.txt
                cat $HOME/check/report_system_env.txt

            fi

    fi
fi
