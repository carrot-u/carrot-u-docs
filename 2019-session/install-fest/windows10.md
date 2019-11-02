# Installation for Windows 10

## Why?

If you have a machine running Windows 10, you can run Linux on it, which
supports all of the software you'll need for the course.

## How?

Follow the instructions in 
[this blog post](https://medium.com/@edwardbaeg9/using-homebrew-on-windows-10-with-windows-subsystem-for-linux-wsl-c7f1792f88b3) 
to set up your computer, then return to the [basic InstallFest instructions](./index.md).

### Troubleshooting

Some notes on things you might run into:

* The blog post tells you to find *Turn Windows features on or off* in the
Windows Start menu. If you don't see it there, pull up *Settings* and then
search for "Windows features" to find it.
* If the installation seems to be hanging at 
"Installing, this may take a few minutes", try hitting the Enter key while
focused on the window. You should then see the prompt
"Enter new UNIX username:".
* The post is not clear that you have to run the "Next Steps" after installing
`brew` and before adding it to your PATH, so make sure to run the following
commands (note that some of these can take a very long time):
```bash
sudo apt-get update
sudo apt-get install build-essential
echo 'eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)' >>~/.profile
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
brew install gcc
```
* If you get security warnings from Windows or installation suggestions from
VSCode, it's safe to go ahead and agree to them.
