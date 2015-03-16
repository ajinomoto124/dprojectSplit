import std.stdio;
import std.string;
import std.uni;

void main (){
splitSentences("hey there Mr. DJ! Its not safe out there. Take this! uhhh... like... idk.");
splitSentences("Mr. Matthews, Mrs. Matthews, and Ms. Matthews here to see Dr. Matthews Sr. and Dr. Matthews Jr. for today's 3 o'clock. Please hurry.");
splitSentences("Compared to some other programming languages, characters in D may not consist of equal number of bytes. For example, because Ğ can be represented by at least 2 bytes in Unicode, it doesn't fit in a variable of type char. On the other hand, because dchar consists of 4 bytes, it can hold any Unicode character.");
}

void splitSentences(string input){
	char[] inp = input.dup; //character array of entire input
	int start = 0; //integer counter for start of next sentence
	string[] sInp; //array of sentences as strings
	
	//for each character in input
	for(int i = 0; i < inp.length; ++i){
		
		string tempOut; //string to be added to sentence array

			//check for exclamation mark, space	
	    	if((i < inp.length - 1) &&((inp[i] == '.' && inp[i+1] == ' ' ) || (inp[i] == '?' && inp[i+1] == ' ')  || (inp[i] == '!' && inp[i+1] == ' '))){
				
				char[] temp; //temporary array of characters that will get turned into a string and added to sentence array
		
				//checks for titles instead of sentence ends
				if(inp[i] == '.' && (
					//cases for two letter titles
					((i > 1) &&(inp[i-1] == 'r' &&( inp[i-2] == 'M') || (inp[i-2]== 'D') || (inp[i-2] == 'S') || (inp[i-2] =='J')) || (inp[i-1] == 's' && inp[i-2]== 'M')) 
					//case for Mrs.
					|| (i > 2) && (inp[i-1] == 's' && inp[i-2] == 'r' && inp[i-3] == 'M')
					//case for space but next word is lowercase
					|| (i < inp.length-2) && isLower(inp[i+2])
					)
					){
				}
	
				
				else{
					//for all characters from the last, leading up to the next sentence
					for(int x = start; x<= i; ++x){
						//add characters to character array
						temp ~= inp[x];	
					}
					//array to string
					tempOut = temp.idup;
					//append to string array
					sInp ~= tempOut;
					//increment start, so it starts at next sentence
					start = i+2;
				}
			}
			//case for no punctuation at end of line
			else if (i == inp.length - 1){
				char[] temp;
				//for all characters from the last, leading up to the next sentence
					for(int x = start; x<= i; ++x){
						//add characters to character array
						temp ~= inp[x];	
					}
					//char array to string
					tempOut = temp.idup;
					//append to string array
					sInp ~= tempOut;
			}
		}
		//print all sentences in string array		
		for(int y = 0; y < sInp.length; ++y){
			writeln(sInp[y]);
		}
		

}
