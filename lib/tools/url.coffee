# url encode / decode tool

exports.exec = (options, callback) ->
  output = ''
  if options._.length == 1 && !options.d
    callback({ message: "No input specified" }, null);

  # Concat all text together after command
  for text in options._[1...]
   output += (text + ' ')

  output = output.substr(0,output.length-1)
  
  if options.d
    output = options.d + ' ' + output
    output = decodeURI output
  else
    output = encodeURI output


  callback(null, output)

  
exports.docs = () ->
  doc = []
  doc.push 'url encoding / decoding tool'.grey
  return doc

exports.usage = () ->
  usage = []
  usage.push '  xp' + ' url '.cyan + 'string'.grey
  usage.push ''
  usage.push 'flags:'.cyan
  usage.push ''
  usage.push '  -d' + ' decode string'.grey

  return usage