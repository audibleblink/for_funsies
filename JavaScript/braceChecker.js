// Creates 'contains' function for arrays in isOpener/isCloser functions
Array.prototype.contains = function( obj) {
    var i = this.length;
    while (i--) {
        if (this[i] === obj) {
            return true;
        }
    }
    return false;
}
 
 
// Checks whether a given input is an opener or closer
function isOpener (symbol) {
  var symbols = ["(","[","{"] 
  return symbols.contains(symbol)
}
 
function isCloser (symbol) {
  var symbols = [")","]","}"] 
  return symbols.contains(symbol)
}
 
 
//  Defines matching characters
function matchedItem (symbol) {
  if (symbol == "(") {return ")"}; if (symbol == ")") {return "("}
  if (symbol == "[") {return "]"}; if (symbol == "]") {return "["}
  if (symbol == "{") {return "}"}; if (symbol == "}") {return "{"}
}
 
 
//  Stack creation
function Stack () {
  this.stac = new Array();
  this.pop = function() {
    return this.stac.pop();
  }
  this.push = function (i) {
    this.stac.push(i)
  }
}
 
 
//  Removes all text from inside quotes. Leaves odd quotes to fail
//  tests later.
function removeQuotedText (text) {
  var temp1 = text.replace(/\"(.+?)\"/g, "");
  var temp2 = temp1.replace(/\'(.+?)\'/g, "");
  return temp2
}
 
// Strips non-paren characters and unmatched quotes
function formatter (codeSnippet) {
  var temp = removeQuotedText(codeSnippet)
  return temp.match(/[\(\)\[\]\{\}'"]/g)
}
 
 
//  Checks the validity of our string
function checker (charString) {
  var parens = formatter(charString)
  var stack = new Stack
  for (var i = 0; i < parens.length; i++) {
    if (parens[i] === "\"") {return false}
    if (parens[i] === "\'") {return false}
    if (isOpener(parens[i])) {
      stack.push(parens[i])
    }
    if (isCloser(parens[i]) && stack.pop() != matchedItem(parens[i]) ) {
      return false
    }    
  };
 
  if (stack.stac.length === 0) {
    return true
  } else {
    return false 
  }   
}
