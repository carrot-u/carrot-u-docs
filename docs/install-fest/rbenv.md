# Install rbenv

Now that you have brew installed, you can install other packages we will use in this course.

## Why?

`rbenv` is the ruby version and environment manager. It allows you to have multiple versions of ruby installed and have packages installed just for your current project. 
This will allow you to not to pollute your global environment with packages that you will try during the course and make it easier to manage and debug your code.

## How?

In order to install rbenv with brew, open your terminal and type

    > brew install rbenv
    
Now you can check what rbenv can do

    > rbenv help
    
    
Let's check what version of ruby we are currently using

    > rbenv version                                                                                                                             ✔  7684  15:49:47
    system


What are all the versions installed on my system? (your output will vary)

    > rbenv versions
      system

Let's install ruby 2.3.7, which is the version we currently use at Instacart

    > rbenv install 2.3.7
    
Now let's use this version globally
   
    > rbenv global 2.3.7
    
Let's make a test project directory and set the local version to 2.3.7

    > cd ~/                            # go to your home directory
    > mkdir try-rbenv                  # create a test directory
    > cd try-rbenv                     # change to that test directory
    > rbenv local 2.3.7                # set the ruby version locally
    
Now check that everything is what we expect

    > pwd
    /Users/viktor/try-rbenv
    > rbenv local
    2.3.7
    


 
