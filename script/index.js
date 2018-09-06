function mySet(){
	var collections = {};
	this.has = function(element){
		return (this.collections.indexOf(element)!=null);
	}

	this.values = function(){
		return this.collections;
	}

	//this method will add an element to the set
	this.add = function(element){
		if (!this.has(element)) {
			this.collections.push(element);	
			return true;
		}
		return false;
	}

	this.remove = function(element){
		if (has(element)) {
			index = collections.indexOf(element);
			collections.splice(index,1);
			return true;
		}
		return false;
	}

	this.size = function(){
		return collections.length;
	}

	this.union = function(otherSet){
		var unionSet = new mySet();
		var firstSet = this.values();
		var secondSet = otherSet.values();
		firstSet.forEach(function(e){
			unionSet.add(e);
		});

		secondSet.forEach(function(e){
			unionSet.add(e);
		});

		return unionSet;
	}

	this.intersection = function(otherSet){
		var interSet = new mySet();
		var firstSet = this.values();
		var secondSet = otherSet.values();
		
		
		for (var i = 0; i<firstSet.length; i++) {
			for (var j = 0; j < secondSet.length; j++) {
				if (firstSet[i]===secondSet[j]) {
					interSet.add(firstSet[i]);
				}
			}
		}
		return interSet;
				
	}


	this.difference = function(otherSet){
		var differenceSet = new mySet();
		var firstSet = this.values;
		firstSet.forEach(function(e){
			if (!otherSet.has(e)) {
				differenceSet.add(e);
			}
		});

		return differenceSet;
	}
	
	//this method will test if the set is a subset of a different set
	this.subset = function(otherSet){
		var firstSet = this.values;
		return firstSet.every(function(e){
			return otherSet.has(e);
		});
	}
}
var setA = new mySet();
var setB = new mySet();
setA.add("a");
setA.add("b");
setB.add("c");
setB.add("a");
setB.add("d");
console.log(setA.subset(setB));
console.log(setA.difference(setB));




