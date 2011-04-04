# Base64 encode / decode tool

utils = require '../utils'
request = require 'request'

exports.exec = (options, callback) ->
  pub_ip = ""
  request {
    uri: "http://checkip.dyndns.org/",
    method: "get"
  }, (err, response, body) ->
    if err
      return callback(err)
    pub_ip = body.match /\b(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\b/
    pub_ip = pub_ip[0]
    callback(null, pub_ip)
  
  
exports.docs = () ->
  doc = []
  doc.push 'determines public ip address of current machine'.grey
  return doc
  
exports.usage = () ->
  doc = []
  doc.push 'base64 encoding / decoding tool'.grey
  doc.push 'usage '.green
  doc.push '  xp base64 ' + 'base64stringgoeshere'

  return doc