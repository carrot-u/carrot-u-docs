# Useful shell commands

## Basic Commands

Where am I?

    $ pwd         # print working directory

Who am I?

    $ whoami   # what user am I logged in as

What files do I have?

    $ ls           # list files
    $ ls -l        # list in long form
    $ ls -a        # list all files (includes "dot" files/hidden files)
    $ ls -la       # list all in long form
    $ ls -lt       # list files according to last modification

Clean up the clutter

    $ clear        # clear screen
    $ ctrl+L       # clear screen
    
Go somewhere else

    $ cd            # change directory  (no argument) go to my home directory
    $ cd /          # go to the top of the file system (your computer's primary disk)
    $ cd ~          # change to my home directory
    $ cd $HOME      # change to my home directory
    $ cd path       # change directory to path, starting at the current directory
    $ cd /path      # change directory to path, starting at the top of the file system (because of the /)
    $ cd ~path      # change directory to path, starting at the my home directory (because of the ~)
    $ cd ..         # go up a level to the directory that contains the directory you are in
    $ cd -          # return to the previous directory (the last directory you cd'ed to)

What's in that file?

    $ cat file1 file2 ...   # concatenate files - by default, displays on the terminal
    $ less files            # show "less" of each file at one time - paginate so you see one screenfull at a time
                            # use arrows or spacebar to scroll lines or pages
                            # use q to quit viewing the current file

    $ nano file_name        # bring up the text editor nano
                            # ctrl-X to exit
Reorg!

    $ mv file1 file2            # move file1 to file2 (renames it)
    $ mv file directory         # move file to directory (keeps the same name in the new location)
    $ mv file1 directory/file2  # move and rename file1
    $ mv directory1 directory2  # move directory1 and all of its contents to directory2
                                # use "." to indicate current working directory
    
    $ cp file1 file2/em>            # copy file1 to file2, leaving file1 in place
    $ cp file1 path/file2/em>       # create the copy in a different directory
    $ cp -r directory1 directory2   # copy directory1 and all of its contents (recursive) to directory2

    $ rm filename                   # remove #OMGPERMANENT - note that the removed file does NOT go to the trash
    $ rm -r directory               # remove directory (recursive) AND ALL FILES IN IT, all the way to the bottom

    $ mkdir directory                 # create a directory, located under the current directory
                                      # or start directory with / or ~ to start at the top of the file system or your home directory
    $ mkdir -p path1/path2/.../name   # create any number of directories needed from the specified paths

## Command Line Edits and History

Edit what I'm typing

- control+E = end of command
- control+A = beginning of command
- esc + B = move backward one word
- esc + F = move forward one word
- esc + #, esc + B/F = move backward/forward # words

Find something I typed before

- up/down arrow = scroll through command history
- ctrl+R = search backward (type the first few letters of the command)


    $ !!       # run the last command entered (and prints the last command)
    $ history  # show complete command history
    $ !1201    # run the command from the history numbered 1201

## Users and permissions

    $ sudo some command   # Run some command as the super user
    $ sudo !!             # Run the previous command as the super user
                          # for when you try a command and it fails because you do not have permissions 

    $ su <username>       # switch user to username
    $ exit                # go back to the previous user

    $ chmod g+r filename     # "change mode" change the permissions (mode) of a file or directory
                             # this would allow the group assigned to the file to read it 
    $ chmod 754 <filename>   # change mode using numbers, which allows you to set all permissions at once
                             # the first number is for the owner (user), the second for the group, the third for the world

- u = user/owner
- g = group
- a = all

- r (read) = 4
- w (write) = 2
- x (execute) = 1

You combine these numbers by adding, so if you want "rw" (read and write), you would use 6.

    $ sudo chown <owner> <filename>            # "change owner" of a file
    $ sudo chown <owner>:<group> <filename>    # "change owner" and group

## Processes

    $ top   # show aninteractive/sortable list of processes running and resources being consumed
            # ? = show a menu (while top is running)
            # control-C to stop top

    $ ps                          # list running processes
    $ ps aux                      # show all processes for all users
    $ ps aux | grep "<pattern>"   # filter for a certain pattern

- control+Z = Stop (pause) a currently running process
- control+C = Terminate (exit) a process


    $ fg                 # (foreground) resume most recently paused process
    $ <program_name> &   # run a program in "the background", meaning it runs but you can
                         # type other commands in the terminal while it runs
                         # it will still output to the same terminal, which can be disconcerting
    $ jobs               # list current jobs (background processes) for your session
    $ fg <job#>          # resume a particular process (you can get the number from jobs)
    
    $ kill <process_id>        # send signal to (-TERM) terminate (like typing control+C)
                               # you get process ids from ps
    $ kill -9 <process_id>     # force a process to quit
    $ kill -KILL <process_id>  # force quit
    $ kill -STOP <process_id>  # pause (control+Z)

## Environment and shell

    $ VARIABLE=value command   # set an environment variable for the command
    $ export VARIABLE=value    # set an environment variable that you can use for all further commands
                               # in this shell

    $ env      # view environment variables
    $ set      # view variables and other values defined for this shell
    $ bash     # start a new bash session within your current bash session

    $ echo "something"   # display the arguments sent to echo
    $ echo $VARIABLE     # display the value of VARIABLE
    
## Finding things
    
    $ which program_name  # show the location/path of an executable program

    $ find . -name "<pattern OR filename>"           # search current directory and below for files matching the name/pattern
    $ find / -name <pattern>                       # / indicates the system root directory, so search the whole system
    $ find <dir1> <dir2> <dir3> -name <pattern>    # search multiple directories

    $ grep "<pattern>" <file(s)>     # search for text/patterns within the file(s)
    $ grep -n "<pattern>" <file(s)>  # line numbers where pattern is found
    $ grep -i "<pattern>" <file(s)>  # ignore case
    $ grep -v "<pattern>" <file(s)>  # pattern NOT IN results (or inVert)
    $ grep -r "<pattern>" <directory>  # search all files in/under directory

# Help!

    $ man find    # show the "manual" for the find command
    $ man grep    # show the "manual" for the grep command

# Installing Software

Mostly you can use brew

    $ brew update              # update brew itself
    $ brew upgrade             # upgrade all packages managed by brew
    $ brew install package     # install a package
    $ brew uninstall package   # remove package
    $ brew search pattern      # find available packages that match pattern
    $ brew doctor              # run diagnostics to make sure brew is installed and running correctly

Sometimes you will have to build the package yourself. Typically this will include the following steps;
also make sure to check the installation instructions given on the site for the package.

    $ curl -O url        # make an http request for url and save the contents as a local file
    $ tar -xvf file      # un-tar (unzip) file
                         #  tar = tape archive
    $ ./configure        # run the configure script to customize the software for your machine
    $ make               # make (build) the program
    $ sudo make install  # install the program into the system as the superuser