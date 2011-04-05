http    = require 'http'
fs      = require 'fs'
utils   = require '../utils'

exports.exec = (options, callback) ->

  if options._.length <= 1
    return callback({ message: "Image path is required" }, null);

  # Load image
  fs.readFile options._[1], (err, img) -> 
    if err
      return callback(err, null);
      
    client = http.createClient(80, 'api.imgur.com')

    # API Key is currently hard-coded, API keys are free
    request = client.request('POST', '/2/upload.json?key=42e1c4982b52fabcae9033ff428d5175', {
      'Host':'api.imgur.com',
      'Transfer-Encoding': 'chunked'
    })

    # I left out the "Content-Type" header, imgur doesn't seem to mind
    # a better solution would be to do a simple mime-type lookup based on the file extension

    request.on 'response', (response) -> 
      result = ''
      response.on 'data', (chunk) -> 
        result += chunk
      response.on 'end', () ->
        json = JSON.parse result
        if json.error
          return callback(json.error)
        callback(null, json.upload.links.original);
      response.on 'err', () ->
        callback(err, null);

    request.write(img)
    request.end()


exports.docs = () ->
  doc = []
  doc.push 'quick image sharing through imgur.com'.grey
  return doc
  
exports.usage = () ->
  doc = []
  doc.push '  xp ' + 'imgur'.cyan + ' /path/to/image.png'.grey
  doc.push ''
  return doc  
