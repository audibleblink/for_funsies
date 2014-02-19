// Using JavaScript, write a program to find the nearest common parent of any two nodes in a binary tree.
// Aside from stacks and queues, do not use any data structures that are built into the language.

// Example
// Provided the function and example btree below, if ParentFinder was provided “leaf1” and “leaf3”, it 
// would return with “node1”. 
// Function ParentFinder(BTree B, Node n1, Node n2)

function BinaryTree(i, p) {
  this.parent      = p || null
  this.value       = i || null
  this.leftChild   = null
  this.rightChild  = null
  this.height      = null
}

BinaryTree.prototype.insert = function(num) {
  !this.value ? this.value = num : false

  if (num > this.value) {
    if (this.rightChild) {
      this.rightChild.insert(num)
    } else {
      this.rightChild = new BinaryTree(num, this.value)
    }

  } else if (num < this.value) {
    if (this.leftChild) {
      this.leftChild.insert(num)
    } else {
      this.leftChild = new BinaryTree(num, this.value)
    }
  }
}

BinaryTree.prototype.find = function(i) {
  if (this.value > i && this.leftChild) {
    return this.leftChild.find(i);
  } else if (this.value < i && this.rightChild){
    return this.rightChild.find(i);
  } else if (this.value === i){
    return this;
  } else {
    return false;
  }
}

BinaryTree.prototype.trace = function(node, stack) {
  var nodeParent = this.find(node).parent
  if (!nodeParent) {return false}  
  stack.push( nodeParent )
  this.trace( nodeParent, stack )
}


var Stack = function() {
  var stack = new Array
  return {
    push: function(i) {stack.push(i)},
    pop: function() {return stack.pop()},
    isEmpty: function(){return stack[0] ? false : true}
  }
}


function ParentFinder(bTree, n1, n2) {
  var a, b, lastMatch, stack1, stack2
  bTree.trace( n1, stack1=new Stack)
  bTree.trace( n2, stack2=new Stack)
  
  while ( (a = stack1.pop()) === stack2.pop() ) {
    if (a === undefined) {return lastMatch}
    lastMatch = a
  }
  return lastMatch
}


var tree  = new BinaryTree(3)
var seeds = [2,12,14,21,8,9,4,7,44,17,1,5,6,10]

for (i in seeds)
  tree.insert(seeds[i])

console.log(ParentFinder(tree,17,44))


