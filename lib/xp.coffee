util     = require './utils' 
toolPath = __dirname + '/tools'
eyes     = require 'eyes'

exports.loadTools = ->
  tools = util.paths toolPath
  tools.forEach (v,i) ->
    v = v.replace(toolPath + '/', '').replace('.coffee', '').split('')
    v = v.join('')
    tools[i] = v
    exports[v] = require './tools/' + v
  return tools
  
