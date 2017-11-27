# <a href="https://www.lfsystems.com.co"><img src="https://cn.pling.com/img/d/1/9/e/34ca796826e3886a5232d81f1b598e1ccdc4.png" width="80" height="80"></a> <a href="https://www.gnome-look.org/p/1200710/">Atomic-GRUB2-Theme</a>
![Open Source Love](https://badges.frapsoft.com/os/v1/open-source.png?v=103)
[![contributions welcome](https://img.shields.io/badge/contributions-welcome-brightgreen.svg?style=flat)](https://github.com/lfelipe1501/Atomic-GRUB2-Theme/issues)

Theme for the Grub2 at the purest ATOMIC style :sunglasses:
![Atomic-Theme](https://raw.githubusercontent.com/lfelipe1501/lfelipe-projects/master/AtomicGRUB/Atomic-GRUB2-theme.gif)

# Install

### Installer
- Clone the repository `git clone https://github.com/lfelipe1501/Atomic-GRUB2-Theme.git`
- Run the installer included in the folder with the name **install.sh** - Remember to run it with the *__sudo__* command or as the *__root__* user, as shown in the following screenshot:
![Atomic-Installer](https://raw.githubusercontent.com/lfelipe1501/lfelipe-projects/master/AtomicGRUB/installer.png)

### Manual
- Clone the repository `git clone https://github.com/lfelipe1501/Atomic-GRUB2-Theme.git`
- Copy the folder **Atomic/** in the themes folder where GRUB is installed:
![capture1](https://raw.githubusercontent.com/lfelipe1501/lfelipe-projects/master/AtomicGRUB/capture1.png)
- Edit **/etc/default/grub** and place the ATOMIC theme path with your text file **theme.txt**
```bash
GRUB_THEME="/boot/grub/themes/Atomic/theme.txt"
```
![capture2](https://raw.githubusercontent.com/lfelipe1501/lfelipe-projects/master/AtomicGRUB/capture2.png)
- Generate your grub configuration file again (sudo update-grub or grub-mkconfig)
- enjoy

# Tips and tricks

To use all the icons set in the theme if one is not shown, you can add the class manually in your **grub.cfg** file, as follows:

![capture4](https://raw.githubusercontent.com/lfelipe1501/lfelipe-projects/master/AtomicGRUB/capture4.png)
![capture3](https://raw.githubusercontent.com/lfelipe1501/lfelipe-projects/master/AtomicGRUB/capture3.png)

### Contact / Social Media

*Get the latest News about Web Development, Open Source, Tooling, Server & Security*

[![Twitter](https://github.frapsoft.com/social/twitter.png)](https://twitter.com/lfelipe1501)
[![Facebook](https://github.frapsoft.com/social/facebook.png)](https://www.facebook.com/lfelipe1501)
[![Github](https://github.frapsoft.com/social/github.png)](https://github.com/lfelipe1501)

### Development by

Developer / Author: [Luis Felipe Sánchez](https://github.com/lfelipe1501)

Company: [lfsystems](https://www.lfsystems.com.co)
