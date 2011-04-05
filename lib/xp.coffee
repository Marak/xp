util     = require './utils' 
toolPath = __dirname + '/tools'
eyes     = require 'eyes'
nconf    = require 'nconf'
fs       = require 'fs'

exports.exec = (tool, options, callback) ->
  exports[tool].exec(options, callback)

exports.loadTools = ->
  tools = util.paths toolPath
  tools.forEach (v,i) ->
    v = v.replace(toolPath + '/', '').replace('.coffee', '').split('')
    v = v.join('')
    tools[i] = v
    exports[v] = require './tools/' + v
  return tools
  
