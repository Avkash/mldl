# GitHub Tricks and Tips #

## Login/Push/Pull Issues ##

Situaton: You have 2FA enabled, and you updated passord for any reason
Solution:
- Make sure to look for your token you geneated first time after 2FA enabled. Copy it. 
- Cant find the token .. no probem
- Visit https://github.com/settings/tokens >> Generate new token
- Visit to your local repo and make some or minor change
- Run -> $ git push -u origin master
- Asked for username  -> ENTER_USER_NAME
- Asked for password. -> ENTER_TOKEN_HERE
- You are good to go

