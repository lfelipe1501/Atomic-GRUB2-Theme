#!/usr/bin/env bash

GRUB_NAME=""
UPDATE_BRUB=""

function compile_grub() {
  echo -e "\e[1m\e[32m==> \e[97mApplying changes...\e[0m"

  ${UPDATE_GRUB}

  echo -e "\e[1m\e[34m  -> \e[97mTheme successfuly applied!"
  echo -e "\e[1m\e[34m  -> \e[97mRestart your PC to check it out."
  sleep 2
}

function update_grub_file() {
  grep -v GRUB_THEME </etc/default/grub >/tmp/clean_grub
  mv /tmp/clean_grub /etc/default/grub
  echo "GRUB_THEME=/boot/${GRUB_NAME}/themes/Atomic/theme.txt" >>/etc/default/grub
}

function copy_atomic_files() {
  echo -e "\e[1m\e[32m==> \e[97mDownloading files...\e[0m"
  git clone https://github.com/lfelipe1501/Atomic-GRUB2-Theme /tmp/Atomic-GRUB2-Theme
  echo -e "\e[1m\e[32m==> \e[97mCopying files...\e[0m"
  cp -rf /tmp/Atomic-GRUB2-Theme/Atomic /boot/${GRUB_NAME}/themes/
}

function get_distro() {
  if [ -e /etc/os-release ]; then
    source /etc/os-release
    if [[ "$ID" =~ (debian|ubuntu|solus) || "$ID_LIKE" =~ (debian|ubuntu) ]]; then
      UPDATE_GRUB='update-grub'
    elif [[ "$ID" =~ (arch|gentoo) || "$ID_LIKE" =~ (archlinux|gentoo) ]]; then
      UPDATE_GRUB='grub-mkconfig -o /boot/grub/grub.cfg'
    elif [[ "$ID" =~ (centos|fedora|opensuse) || "$ID_LIKE" =~ (fedora|rhel|suse) ]]; then
      UPDATE_GRUB='grub2-mkconfig -o /boot/grub2/grub.cfg'
    fi
  fi
}

function main() {

  # Check user is root
  if [ $UID == 0 ]; then
    echo "Yes, You are root!"
  else
    echo "No, You must be root!"
    exit 1
  fi

  get_distro

  # Check which grub
  if [ -d "/boot/grub" ]; then
    GRUB_NAME="grub"
  else
    GRUB_NAME="grub2"
  fi
  copy_atomic_files

  echo -e "\e[1m\e[97m  You must set the theme in your GRUB config file,"
  while :; do
    if [ "$answer" = "g" ]; then
      echo -e "\e[1m\e[97m  You didn't give a valid option, try again."
    else
      read -p "  Would you like to do it now? [y/n] " -t 10 answer
      echo -e "\e[0m"
      if [ "$answer" = "y" ]; then
        # backup old grub file
        cp /etc/default/grub /tmp/grub$(date '+%m-%d-%y_%H:%M:%S')
        update_grub_file
        compile_grub
        break
      elif [ "$answer" = "n" ]; then
        break
      fi
      let answer=g
    fi
  done

}

main "$@"
exit 0
