# Install rbenv

Now that you have brew installed you can install other packages we will in in this course.

`rbenv` is ruby version and environment manager. it allows you to have multiple versions of ruby installed and have packages installed to your working project. 
This will allow not to polute global environment with packages that you will try during the course and make it easier to manage and debug your code.

In order to install rbenv with brew open terminal and type

    > brew install rbenv
    
Now you can check what rbenv can do

    > rbenv help
    
    
Lets check currently used ruby version

    > rbenv version                                                                                                                             ✔  7684  15:49:47
    system


What are all the versions installed on my system? ( your output will vary)

    > rbenv versions
      system

Let's install ruby 2.3.7 which we currently use at Instacart

    > rbenv install 2.3.7
    
    
Now let's use this version globally
   
    > rbenv global 2.3.7
    
Lets go to your project directory and set local version to 2.3.7

    > cd ~/carrot-u
    > mkdir try-rbenv
    > cd try-rbenv
    > rbenv local 2.3.7
    
Now check that everything is expected

    > pwd
    /Users/viktor/carrot-u/try-rbenv
    > rbenv local
    2.3.7
    


 
