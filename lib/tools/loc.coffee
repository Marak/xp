# Lines of Code tool

util = require '../utils'
eyes = require 'eyes'
fs   = require 'fs'

exports.exec = (options, callback) ->
  line_count = 0
  file_count = 0

  if options._.length == 1
    callback({ message: "File name, directory path, or glob is required"});

  # Cheating a bit for the async iteration here
  for glob in options._[1...]
    files = util.paths glob
    file_count += files.length

  for glob in options._[1...]
    files = util.paths glob

    files.forEach (v,i) ->
      fs.readFile v, (err, data) ->
        file_count = file_count - 1
        if err 
          # throw err
          return
        line_count += data.toString().split('\n').length
        if file_count == 0
          callback(null, {
            "Lines": line_count,
            "Files": util.paths(glob).length
          });

exports.docs = () ->
  doc = []
  doc.push 'determines the amount of lines of code in files'.grey
  return doc

exports.usage = () ->
  usage = []
  usage.push '  xp' + ' loc'.cyan + ' .'.grey
  usage.push '  xp' + ' loc'.cyan + ' /path/to/file.txt'.grey
  usage.push '  xp' + ' loc'.cyan + ' /path/to/dir/'.grey
  usage.push '  xp' + ' loc'.cyan + ' /path/to/dir/*.txt'.grey
  usage.push ''
  return usage
  
