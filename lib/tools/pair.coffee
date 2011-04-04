fs = require 'fs'
path = require 'path'
{exec} = require 'child_process'
nconf = require 'nconf'

nconf.use('file', { file: './conf.json' });

nconf.set('git:authors', {
  "ms": "Marak Squires",
  "cr": "Charlie Robins",
  "hi": "h1jinx",
  "ei": "Elijah Insua"
});

nconf.set('git:email', 'pairing@nodejitsu.com');

nconf.save (err) ->
  if err
    console.log err

that = this

exports.exec = (options) ->

  config = nconf.get('git')
  authors = config.authors
  
  if options.l
    console.log 'Current pairs:'.cyan
    for short, long of authors
      console.log '  ' + short + ": " + long
    # console.log exports.usage().split('\n')
    return false

  if options._.length == 1
    console.log that.usage().join('\n')
  
  fs.stat path.join(process.cwd(), '.git'), (error, stats) ->
    throw '.git found but not a directory' unless stats.isDirectory()

    authors = new Array

    for initials in options._[1...]
      authors.push config.authors[initials] 

    author = authors.join ' and '

    end = ->
      exec 'git config --get-regexp user.*', (error, stdout, stderr) ->
        console.log stdout

    if authors.length > 1
      exec """git config user.name '#{author}'""", ->
        exec """git config user.email '#{config.email}'""", ->
          end()
    else
      console.log "invoking git...".red
      console.log('━━━━━━━━━━━━━━━━━━'.red)

      console.log "Git is now reverting back to default git user \n".cyan

      exec """git config --unset user.name""", ->
        exec """git config --unset user.email""", ->
          end()
          
          
exports.docs = () ->
  doc = []
  doc.push 'manages pair programming teams for Git'.grey
  return doc
  
  
exports.usage = () ->
  doc = []
  doc.push 'usage: '
  doc.push '  loc ' + '/path/to/file.txt'
  doc.push '  loc ' + '/path/to/dir/'
  doc.push '  loc ' + '/path/to/dir/*.txt'
  doc.push ''
  doc.push 'flags:'.cyan
  doc.push ''
  doc.push '  -d decode'.grey
  
  return doc