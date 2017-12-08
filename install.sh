#!/usr/bin/env bash

function compile_grub() {
	local whichgrub=$1
	echo -e "\e[1m\e[32m==> \e[97mApplying changes...\e[0m"
        ${whichgrub}-mkconfig -o /boot/${whichgrub}/grub.cfg
        echo -e "\e[1m\e[34m  -> \e[97mTheme successfuly applied!"
        echo -e "\e[1m\e[34m  -> \e[97mRestart your PC to check it out."
        sleep 2
}

function update_grub_file() {
	local whichgrub=$1
	grep -v GRUB_THEME < /etc/default/grub > /tmp/clean_grub
	mv /tmp/clean_grub /etc/default/grub
	echo "GRUB_THEME=/boot/${whichgrub}/themes/Atomic/theme.txt" >> /etc/default/grub
}

function main() {

  if [ -d "/boot/grub" ]; then
    echo -e "\e[1m\e[32m==> \e[97mCopying files...\e[0m"
    cp -rf Atomic /boot/grub/themes/
  else
    echo -e "\e[1m\e[32m==> \e[97mCopying files...\e[0m"
    cp -rf Atomic /boot/grub2/themes/
  fi

  echo -e "\e[1m\e[97m  You must set the theme in your GRUB config file,"
  while : ;do
    if [ "$answer" = "g" ];then
      echo -e "\e[1m\e[97m  You didn't give a valid option, try again."
    else
      read -p "  Would you like to do it now? [y/n] " -t 10 answer
      echo -e "\e[0m"
      if [ "$answer" = "y" ];then
	# backup old grub file
	cp /etc/default/grub /tmp/grub$(date '+%m-%d-%y_%H:%M:%S')
        if [ -d "/boot/grub" ];then
	  update_grub_file "grub"
          compile_grub "grub"
          break
        else
	  update_grub_file "grub2"
	  compile_grub "grub2"
          break
        fi
      elif [ "$answer" = "n" ];then
        break
      fi
      let answer=g
    fi
  done

}

main "$@"
