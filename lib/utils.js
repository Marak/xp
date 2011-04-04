var fs   = require('fs');

// Recursively traverse a hierarchy, returning a list of all relevant .js files.
// I think this code might be from isaacs' NPM, its old
exports.paths = function(dir) {
    var paths = [], stats;
    
    try { 
      stats = fs.statSync(dir) 
    }
    catch (e) { 
      console.log(e);return [] 
    }
  
    if(stats.isFile()){
      return [dir];
    }
  
    (function traverse(dir, stack) {
        stack.push(dir);
        fs.readdirSync(stack.join('/')).forEach(function (file) {
            var path = stack.concat([file]).join('/'),
                stat = fs.statSync(path);
            if (file[0] == '.') {
                return;
            } else if (stat.isFile()) {
                paths.push(path);
            } else if (stat.isDirectory()) {
                paths.push(path);
                traverse(file, stack);
            }
        });
        stack.pop();
    })(dir || '.', []);

    return paths;
}

/*
 * base64.js: An extremely simple implementation of base64 encoding / decoding using node.js Buffers
 *
 * (C) 2010, Nodejitsu Inc.
 *
 */

var base64 = exports.base64 = {};

//
// ### function encode (unencoded)
// #### @unencoded {string} The string to base64 encode
// Encodes the specified string to base64 using node.js Buffers.
//
base64.encode = function (unencoded) {
  var encoded;

  try {
    encoded = new Buffer(unencoded || '').toString('base64');
  }
  catch (ex) {
    return null;
  }
  
  return encoded;
};

//
// ### function decode (encoded)
// #### @encoded {string} The string to base64 decode
// Decodes the specified string from base64 using node.js Buffers.
//
base64.decode = function (encoded) {
  var decoded;
  
  try {
    decoded = new Buffer(encoded || '', 'base64').toString('utf8');
  }
  catch (ex) {
    return null;
  }
  
  return decoded;
};

exports.Table = require('cli-table');