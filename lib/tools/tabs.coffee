# TODO: implement tab formatting tool

# Formats tabbing in files


util = require '../utils'
eyes = require 'eyes'
fs   = require 'fs'

# TODO: make this configurable
# right now, the replacement is hard-coded to replace "hard tabs" with "soft tabs, two spaces"
config = {
  tab_identifier: /\t/g,
  tab_replacement: '  '
}


exports.exec = (options, callback) ->
  file_count = 0
  tab_instances = 0

  if options._.length == 1
    callback({ message: "File name, directory path, or glob is required"});

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
        tab_instances += data.toString().split('\t').length
        stripped = data.toString().replace(config.tab_identifier, config.tab_replacement)

        fs.writeFile v, stripped, (err, result) ->
          file_count = file_count - 1
          if file_count == 0
            callback null, { "Tabs Replaced": tab_instances, "Files Modified": util.paths(glob).length }

      )(v,i)

exports.docs = () ->
  doc = []
  doc.push 'converts tabs to spaces and spaces to tabs'.grey
  return doc

exports.usage = () ->
  
  usage = []
  usage.push '  xp' + ' tabs'.cyan + ' .'.grey
  usage.push '  xp' + ' tabs'.cyan + ' /path/to/file.txt'.grey
  usage.push '  xp' + ' tabs'.cyan + ' /path/to/dir/'.grey
  usage.push '  xp' + ' tabs'.cyan + ' /path/to/dir/*.txt'.grey
  usage.push ''
  return usage
    