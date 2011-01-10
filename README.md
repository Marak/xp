# xp
## a command line agile development tool built in CoffeeScript and node.js

#  INSTALLATION
  npm install xp
  
#  USAGE
    xp [tool] [options]

## Getting Help

    xp
    xp -help
    xp --help


# TOOLS

## pair - Pair Programing tools for source control commit messages

### Set Pair Programming team

    xp pair nr nk
( pairs are currently hard-coded in pair.coffee)


### Reset to default user

    xp pair

## loc - Lines of Code

    xp loc [glob]
    xp loc .
    xp loc ../
    xp loc ./foo


## Authors

Marak Squires, Feisty Studios