# Install Homebrew

## Why?

Homebrew or `brew` is a package manager for macOS.
You will use `brew` to install most of the dependencies on your macbook.

A "package manager" makes installing programs and libraries
(packages of code that are shared by many programs) much simpler.
When you first try using it, you'll probably question the "simpler" in that statement,
but I assure you that the "old way" of installing this kind of code was significantly more painful.
[Take a peek](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) if you want -
scroll down to "Installing from source".

## How?

In order to install brew, you will use the instructions from [https://brew.sh/](https://brew.sh/)
 
 - Go to [https://brew.sh/](https://brew.sh/)
 - Copy the command on this page to the clipboard - it should look something like `/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install"`
 - Open the terminal, paste the copied command, and hit enter
 - It will prompt you as it runs - you can just use the defaults it offers
 - At some point, it will prompt you for your password; this is fine, go ahead and enter your password
 
After the installation completes, type

    brew doctor
    
in the terminal to verify that it installed correctly. You should see

    Your system is ready to brew
 
Now type
    
    brew list
    
and it will list packages currently installed on your system
 
## What else?

There's a nice discussion of Homebrew [here](https://computers.tutsplus.com/tutorials/homebrew-demystified-os-xs-ultimate-package-manager--mac-44884).
