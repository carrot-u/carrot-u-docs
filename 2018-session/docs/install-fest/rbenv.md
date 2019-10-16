# Install rbenv

Now that you have brew installed, you can install other packages we will use in this course.

## Why?

`rbenv` is the ruby version and environment manager. It allows you to have multiple versions of ruby installed and have packages installed just for your current project. 
This will allow you to not to pollute your global environment with packages that you will try during the course and make it easier to manage and debug your code.

## How?

We'll use brew!

    % brew install rbenv
    
Now you can check what rbenv can do

    % rbenv help
    
Let's check what version of ruby we are currently using

    % rbenv version                                                                                                                             ✔  7684  15:49:47
    system
    
What are all the versions installed on my system? (your output will vary)

    % rbenv versions
      system

Let's install ruby 2.3.7, which is the version we currently use at Instacart

    % rbenv install 2.3.7
    
Now let's use this version globally
   
    % rbenv global 2.3.7
    
Let's make a test project directory and set the local version to 2.3.7

    % cd ~/                            # go to your home directory

    % ruby --version                   # check the version of ruby (will vary on your machine)
    ruby 2.5.1p57 (2018-03-29 revision 63029) [x86_64-darwin17]

    % mkdir try-rbenv                  # create a test directory
    % cd try-rbenv                     # change to that test directory
    % rbenv local 2.3.7                # set the ruby version locally
    % ruby --version                   # check the version again
    ruby 2.3.7p456 (2018-03-28 revision 63024) [x86_64-darwin17]
    
Now check that everything is what we expect

    % pwd                              # what directory am I in?
    /Users/viktor/try-rbenv
    % rbenv local
    2.3.7
    
There is actually one more step, which is to make rbenv part of your environment.
For now, just paste the following steps, into your terminal; 
we'll talk more about shells and profiles later.

    # Add rbenv to bash so that it loads every time you open a terminal
    % echo 'if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi' >> ~/.bash_profile
    % source ~/.bash_profile
    
## What else?
Another popular ruby version manager is rvm. We use rbenv at Instacart, so this is what we recommend,
but if you are already comfortable with rvm, there is no need to change.
([rbenv would disagree](https://github.com/rbenv/rbenv/wiki/Why-rbenv%3F))

 
