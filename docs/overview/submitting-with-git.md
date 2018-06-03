## Submitting via Git
First, clone the repository

    % cd ~/git
    % git clone https://github.com/carrot-u/assignments

Now create a branch for yourself:

    % git checkout -b <branch_name>

I usually name the branch for myself, plus the thing I am working on, e.g.

    % git checkout -b muffy/guessing-game
    
Create a new directory for your code in the directory for the assignment you are working on.

    % cd ~/git/assignments/week1
    % mkdir muffy        

Create and test your code, then add it to git, commit it, and push it, e.g.

    % cd ~/git/assignments/week1/muffy
    % git add guessing_game.rb
    % git commit -m "Muffy's version of the guessing game"
    % git push

Now go to [the repository on Github](https://github.com/carrot-u/assignments/branches)

![branches](../../images/ruby-and-rails/github_branches.png)

Comment the contents appropriately. We use "WIP" (Work In Progress) to comment something which is not yet finished.

![branches](../../images/ruby-and-rails/pull_request.png)

Finally, click "Create pull request".