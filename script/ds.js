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
