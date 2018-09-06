var letters = [];
var word =  "racecar";
var rword = "";
var l = word.length;

for (var i = 0; i < l; i++){
	letters.push(word[i]);
}

for (var i = 0; i < l; i++) {
	rword += letters.pop();
}

if (word===rword) {
	console.log(word+" is a palindrome ");
}else{
	console.log(word+ " is not a palindrome");
}	


var arr = ['orange','mango','banana','sugar','tea'];

	var removed = arr.splice(2,0,'water');
	document.write("After adding 1: "+arr);
	document.write("<br/> removed is: "+removed);

	removed = arr.splice(3,1);
	document.write("<br/> After adding 1: "+arr);
	document.write("<br/> removed is: "+removed);
