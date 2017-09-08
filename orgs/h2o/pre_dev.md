## Working on a Pull Request (PR) to work on H2O source code and Merging into Master and Release Branch ##

### Create and work your own branch based on master ###
 - Make sure you have cloned the h2o branch and on master
   - $ git create your_branch_name
   - $ git checkout your_branch_name
 - Push your code to your branch
   - $ git add <add all of your updated files>
   - $ git commit -m "write your details about the work you did"
   - First Time 
     - $ git push git push --set-upstream origin your_branch_name
   - Any time after first push
     - $ git push
     
### Create Pull Request ###
 - Based on your branch you can create a pull request
 - Note: You need to create two separate pull request to add your changes into master and into release branch

### Merging into release branch ###
 - Make sure you are in your branch which needs to merge
 - $ git fetch
 - $ git rebase -i origin/your_release_branch_name
   - Note: 1. You will see the editor with all the checkins by all of your team
   - Note: 2. Remove all the checkins [using Esc + dd : Its vi window] besides yours
   - Note: 3. Now save it using :wq 
 - $ git log
 - $ git push --force
 Note: Now visit to github UI and select the your_release_branch_name and commit your pull request to make the change final
 Note: Now visit to your JIRA and resovolved it. 
