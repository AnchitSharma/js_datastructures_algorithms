var stack = function(){

	this.count = 0;
	this.storage = {};

	this.push = function(obj){
		this.storage[this.count] = obj;
		this.count++;
	}

	this.pop = function(){
		if (this.count===0) {
			return undefined;
		}else{
			this.count--;
			var temp = this.storage[this.count];
			delete this.storage[this.count];
			return temp;
		}
	}

	this.peek = function(){
		return this.storage[this.count-1];
	}

	this.size = function(){
		return this.count;
	}
}


var myStack = new stack();
myStack.push(1);
myStack.push(2);
console.log(myStack.pop());
console.log(myStack.peek());
myStack.push("freecodecamp");
console.log(myStack.peek());