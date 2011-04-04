# Base64 encode / decode tool

utils = require '../utils'
static = require 'node-static'
http   = require 'http'
exports.exec = (options, callback) ->

  options.p = options.p || 8080
  root = options._[1] || __dirname
  console.log root
  file = new(static.Server)(root, { AutoIndex: true, cache: 3600 });
  console.log 'Starting up static web server for: '.yellow + root.cyan + ' on port: '.yellow + options.p.toString().cyan
  
  try
    http.createServer  (request, response) ->
        #console.log request.headers
        request.addListener 'end', ->
          file.serve(request, response)
          #console.log request.url
    .listen(options.p)
  catch err
    return callback({message: err.message});

  process.on 'SIGINT', ->
    console.log 'Static web server stopped.'.red
    process.exit()

  callback(null, 'Static web server successfully started at '.green + options.p.toString().cyan + '\n' + 'Hit CTRL-C to stop the server')
  
exports.docs = () ->
  doc = []
  doc.push 'spawns static web servers from directory paths'.grey

  return doc
  
exports.usage = () ->
  doc = []
  doc.push 'usage '.green
  doc.push '  static ' + './path/to/folder/'

  return doc  
  