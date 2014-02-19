var DEVELOPMENT = true

function p(msg){
  if (DEVELOPMENT)
    console.log(msg);
}


// Using JavaScript, write a program to find the nearest common parent of any two nodes in a binary tree.
// Aside from stacks and queues, do not use any data structures that are built into the language.

// Example
// Provided the function and example btree below, if ParentFinder was provided “leaf1” and “leaf3”, it 
// would return with “node1”. 
// Function ParentFinder(BTree B, Node n1, Node n2)

function BinaryTree(i, p) {
  this.value       = i || null
  this.leftChild   = null
  this.rightChild  = null
  this.height      = null
  this.parent      = p || null
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
    p("Entering leftChild")
    height += 1
    return this.leftChild.find(i);
  } else if (this.value < i && this.rightChild){
    p("Entering rightChild")
    height += 1
    return this.rightChild.find(i);
  } else if (this.value === i){
    p("Found it!")
    this.height = height
    return this;
  } else {
    p("Not here")
    return false;
  }
}


BinaryTree.prototype.trace = function(i, queue) {
  p(queue)
  if (this.value > i && this.leftChild) {
    queue.enqueue( this.value )
    return this.leftChild.trace(i);
  } else if (this.value < i && this.rightChild){
    queue.enqueue( this.value )
    return this.rightChild.trace(i);
  } else if (this.value === i){
    queue.enqueue( this.value )
  } else {
    return false;
  }
}

var  height = 0
BinaryTree.prototype.level = function(i) {
  return this.find(i).height
}

var Stack = function() {
  var stack = new Array
  return {
    push: function(i) {stack.push(i)},
    pop: function() {return stack.pop()},
    isEmpty: function(){return stack[0] ? false : true}
  }
}

var Queue = function() {
  var a = new Stack
  var b = new Stack
  return {
    enqueue: function(i) {
      a.push(i)
    },
    dequeue: function() {
      while (!a.isEmpty())
        b.push( a.pop() );
      return b.pop()
    }
  }
}


function ParentFinder(bTree, n1, n2) {
}





var tree  = new BinaryTree(3)
var seeds = [2,12,14,21,8,4,7,44]

for (i in seeds)
  tree.insert(seeds[i])

// ParentFinder(tree,4,14)

p(tree.find(8))



