fs     = require 'fs'
path   = require 'path'
nconf  = require 'nconf'
{exec} = require 'child_process'
that   = this


exports.exec = (options, callback) ->

  nconf.use('file', { file: './config.json' })
  nconf.load (err) ->

    config = nconf.get('git')

    ## List pairs
    if options.l
      console.log 'Current pairs:'.cyan
      for short, long of config.authors
        console.log '  ' + short + ": " + long
      # console.log exports.usage().split('\n')
      return false

    # Add user
    if options.a
      short_tag   = options.a
      author_name = options._.splice(1,options._.length).join(' ')
      config.authors[short_tag] = author_name
      nconf.set('git:authors', config.authors)
      console.log('Added '.green + author_name.green);
      nconf.save (err) ->
        if err
          console.log err
        console.log(nconf.get('git:authors'));
      return false
    
    # Remove user
    if options.d
      short_tag = options.d
      delete authors[short_tag]
      console.log('Removed user '.green + short_tag.green);
      nconf.save (err) ->
        if err
          console.log err
      return false
    
    if options._.length == 1
      console.log that.usage().join('\n')
  
    fs.stat path.join(process.cwd(), '.git'), (error, stats) ->
      throw '.git found but not a directory' unless stats.isDirectory()

      authors = new Array

      for initials in options._[1...]
        if config.authors[initials]
          authors.push config.authors[initials] 

      #if authors.length < 2
      #  console.log('Error: Invalid pair'.red.bold)
      #  return;

      author = authors.join ' and '

      end = ->
        exec 'git config --get-regexp user.*', (error, stdout, stderr) ->
          # console.log stdout

      if authors.length > 1
        console.log "Setting up team: ".green + author + " \n"
        
        exec """git config user.name '#{author}'""", ->
          exec """git config user.email '#{config.email}'""", ->
            end()
      else

        console.log "Git has now reverted back to the default git user \n".green

        exec """git config --unset user.name""", ->
          exec """git config --unset user.email""", ->
            end()

exports.docs = () ->
  doc = []
  doc.push 'manages pair programming teams for Git'.grey
  return doc
  
  
exports.usage = () ->
  usage = []
  usage.push('usage: '.cyan)
  usage.push('')
  usage.push('  xp ' + 'pair'.cyan + ' ms cr'.grey)
  usage.push('')
  usage.push('flags: '.cyan)
  usage.push('')
  usage.push('  -l' + ' lists current team members'.grey)
  usage.push('  -a shorttag name' + ' adds a member to your team'.grey)
  usage.push('  -d shortag' + ' deletes a member from your team'.grey)
  usage.push('')
  usage.push('examples: '.cyan)
  usage.push('')
  usage.push('  **resets current team back to default git user**')
  usage.push('')
  usage.push('    xp ' + 'pair'.cyan)
  usage.push('')
  usage.push('  **list current team members**');
  usage.push('')
  usage.push('    xp ' + 'pair  '.cyan + '-l'.grey);
  usage.push('')
  usage.push('  **adds Marak Squires as "ms"**');
  usage.push('')
  usage.push('    xp ' + 'pair  '.cyan + '-a ms Marak Squires'.grey);
  usage.push('')
  usage.push('  **adds Charlie Robbins as "cr"**');
  usage.push('')
  usage.push('    xp ' + 'pair  '.cyan + '-a cr Charlie Robbins'.grey);
  usage.push('')
  usage.push('  **pair up for commits**');
  usage.push('')
  usage.push('    xp ' + 'pair  '.cyan + 'ms cr'.grey);
  usage.push('')
  usage.push('  **delete Marak Squires from team**');
  usage.push('')
  usage.push('    xp ' + 'pair  '.cyan + '-d mr'.grey);
  usage.push('')
  return usage