fs = require 'fs'
path = require 'path'
{exec} = require 'child_process'

exports.exec = (authors) ->
  CONFIG =
    EMAIL: 'xp@feistystudios.com'

    AUTHORS:
      'nk': 'Nicholas Kinsey'
      'nr': 'Nathan Rashleigh'
      'bs': 'Brendan Scarvell'

  fs.stat path.join(process.cwd(), '.git'), (error, stats) ->
    throw '.git found but not a directory' unless stats.isDirectory()
  
    authors = new Array
  
    for initials in process.argv[2...]
      authors.push CONFIG.AUTHORS[initials] 
  
    author = authors.join ' and '
  
    end = ->
      exec 'git config --get-regexp user.*', (error, stdout, stderr) ->
        console.log stdout
  
    if authors.length > 1
      exec """git config user.name '#{author}'""", ->
        exec """git config user.email '#{CONFIG.EMAIL}'""", ->
          end()
    else
      exec """git config --unset user.name""", ->
        exec """git config --unset user.email""", ->
          end()