# Install XCode Tools
## Why?
If you look up [XCode](https://developer.apple.com/xcode/), you will see that it is described as a
toolkit or IDE (Interactive Development Environment) for developing applications for Apple products.
We won't be developing Apple applications, but among the things included in XCode are pieces of code
which are needed in order to install (on Mac OS X) most of the programs that software developers
use on a daily basis.

## How?
Open a terminal and type

    $ xcode-select --install

If you do not have the tools installed, you will see a series of dialogs; just agree to everything.

![dialog 1](../images/install-fest/install_xcode_1.png) 

![dialog 2](../images/install-fest/install_xcode_2.png)
 
![dialog 3](../images/install-fest/install_xcode_3.png)
 
![dialog 4](../images/install-fest/install_xcode_4.png) 

If you already have them installed, as I do, you will see a message in the shell

    $ xcode-select: error: command line tools are already installed, use "Software Update" to install updates

In future, you will occasionally be prompted to update XCode along with other system updates.
