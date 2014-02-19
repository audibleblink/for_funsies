// Using JavaScript, write a program to find the nearest common parent of any two nodes in a binary tree.
// Aside from stacks and queues, do not use any data structures that are built into the language.

// Example
// Provided the function and example btree below, if ParentFinder was provided “leaf1” and “leaf3”, it 
// would return with “node1”. 
// Function ParentFinder(BTree B, Node n1, Node n2)

function BinaryTree(i) {
  this.value       = i || null
  this.leftChild   = null
  this.rightChild  = null
}

BinaryTree.prototype.insert = function(num) {
  if (!this.value) {
    this.value = num
  }
  if (num > this.value) {
    if (this.rightChild) {
      this.rightChild.insert(num)
    } else if (!this.rightChild) {
      this.rightChild = new BinaryTree(num)
    };
  } else if (num < this.value) {
    if (this.leftChild) {
      this.leftChild.insert(num)
    } else if (!this.left) {
      this.leftChild = new BinaryTree(num)
    };
  };
}

tree = new BinaryTree(3)
tree.insert(2)
tree.insert(12)
tree.insert(14)
tree.insert(21)
tree.insert(8)
tree.insert(4)
tree.insert(7)
tree.insert(44)
console.log(tree);
