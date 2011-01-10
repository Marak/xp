var fs = require('fs');

// Recursively traverse a hierarchy, returning a list of all relevant .js files.
// I think this code might be from isaacs' NPM, its old
exports.paths = function(dir) {
    var paths = [];
    try { fs.statSync(dir) }
    catch (e) { console.log(e);return [] }
    (function traverse(dir, stack) {
        stack.push(dir);
        fs.readdirSync(stack.join('/')).forEach(function (file) {
            var path = stack.concat([file]).join('/'),
                stat = fs.statSync(path);
            if (file[0] == '.' || file === 'vendor') {
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