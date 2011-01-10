# Lines of Code tool

util = require '../utils'
eyes = require 'eyes'
fs   = require 'fs'

exports.exec = (options, callback) ->
  line_count = 0
  file_count = 0

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
          callback(null, line_count);
