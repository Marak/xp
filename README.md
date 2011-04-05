     ##     ## ######                                       
      ##   ##  ##     ##                                      
       ## ##   ##     ##                                      
        ##    ######                                       
       ## ##   ##                                             
      ##   ##  ##                                             
     ##     ## ##   agile programming tools in Coffeescript

#v0.2.2

### Warning: This software is pre [SemVer](http://semver.org/) v1.0.0, use accordingly.


## Features
  - (8) built in tools for getting agile
  - Pluggable tool engine allows for easy creation of new tools
  - Written in CoffeeScript
  - Cross platform 
  - Built in Node.js
  - Works on the command line or via node's module system

##  Installation
    [sudo] npm install xp

##  Usage
    xp [tool] [options]

## Getting Help

    xp
    xp -help
    xp --help

## Warning: Violations of the <a href="http://en.wikipedia.org/wiki/Unix_philosophy">Unix Philosophy</a> ahead

You might notice that a lot of xp's "tools" already exist in some form or another as \*nix programs or combination of \*nix programs. \*nix has battle hardened programs which have been heavily used, tested, optimized, and are generally of very high quality. **xp doesn't aim to replace these any of these.** xp is a *convenience* library aimed towards non-expert users. xp uses [CoffeeScript](http://coffeescript.com) and [node](http://nodejs.org), which makes it fun to use. **If you already know how to perform these actions via vanilla \*nix tools, I encourage you to continue to do so.** 

If anyone is willing to write concise documentation for executing the functionality of xp's tools using only pre-existing \*nix commands, I would be very glad to add that information to this document.

# Tools


## base64
base64 encoding tool 

usage:

    xp base64 string

    flags:

      -d, decodes string


## imgur

quick image sharing through imgur.com

usage:

    xp imgur /path/to/image.png

## ip

determines public ip address of current machine 

usage:

    xp ip

## loc

determines the amount of lines of code in files

usage:

    xp loc .
    xp loc /path/to/file.txt
    xp loc /path/to/dir/
    xp loc /path/to/dir/*.txt

## pair

manages pair programming teams for Git   

usage:

    xp pair

    flags:

      -l, lists current team members
      -a shorttag name, adds a member to your team
      -d shortag, deletes a member from your team

examples:

**resets current team back to default git user**

    xp pair

**list current team members**

    xp pair -l

**adds Marak Squires as "ms"**

    xp pair -a ms Marak Squires

**adds Charlie Robbins as "cr"**

    xp pair -a cr Charlie Robbins

**pair up for commits**

    xp pair ms cr

**delete Marak Squires from team**

    xp pair -d mr


     

## tabs
converts tabs to spaces and spaces to tabs

usage:

    xp tabs .
    xp tabs /path/to/file.txt
    xp tabs /path/to/dir/
    xp tabs /path/to/dir/*.txt


## url

url encoding / decoding tool  

usage:

    xp url string

    flags:

      -d, decodes string
  
## web
spawns a static web server from directory paths

usage:
     
    xp web
    xp web ./path/to/webroot
    xp web -p 8081

    flags:

      -p, port


## ws
removes excess whitespace from files

usage:

    xp ws .
    xp ws /path/to/file.txt
    xp ws /path/to/dir/
    xp ws /path/to/dir/*.txt

## Credits

Original concept and idea by [Marak](https://github.com/marak) and [Feisty Studios](https://github.com/feisty)

[imgur](http://imgur.com) code from Jacob Chapel, [@Chapel](https://github.com/chapel)

ws code by Fedor Induty [@donnerjack13589](https://github.com/donnerjack13589)

pair code from Nicholas Kinsey [@pyrotechnick](https://github.com/pyrotechnick)

[node-static](http://github.com/cloudhead/node-static) web server by Alexis Sellier [@cloudhead](https://github.com/cloudhead)

configurations with nConf by Charlie Robbins [@indexzero](http://github.com/indexzero/nconf)

[Coffeescript](http://Coffeescript.com) by Jeremy Ashkenas [@jashkenas](https://github.com/jashkenas)
