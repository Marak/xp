
# White space removal tool

util = require '../utils'
eyes = require 'eyes'
fs   = require 'fs'

exports.exec = (options, callback) ->
  file_count = 0

  if options._.length == 1
    callback({ message: "File name, directory path, or GLOB is required"});

  # Cheating a bit for the async iteration here
  for glob in options._[1...]
    files = util.paths glob
    file_count += files.length

  for glob in options._[1...]
    files = util.paths glob

    files.forEach (v,i) ->

      ((v,i) -> fs.readFile v, (err, data) ->
        if err 
          # throw err
          return

        # Process the file's contents and then re-save it
        # Regex by Fedor Induty 
        # I've got to assume there are bugs in this Regex, we made it quickly
        stripped = data.toString().replace(/(^|\r|\n|\r\n)+\s+(\r|\n|\r\n|$)+/g,'$1$2').replace(/(\r|\n\n|\r\n\n)+/g, '$1')

        fs.writeFile v, stripped, (err, result) ->
          file_count = file_count - 1
          if file_count == 0
            callback null, 'Stripped'

      )(v,i)

exports.docs = () ->
  doc = []
  doc.push 'removes excess whitespace from files'.grey
  return doc        
  

exports.usage = () ->
  usage = []
  usage.push '  xp' + ' ws'.cyan + ' .'.grey
  usage.push '  xp' + ' ws'.cyan + ' /path/to/file.txt'.grey
  usage.push '  xp' + ' ws'.cyan + ' /path/to/dir/'.grey
  usage.push '  xp' + ' ws'.cyan + ' /path/to/dir/*.txt'.grey
  usage.push ''
  return usage
