import std.stdio;
import std.string;

void main()
{
	writeln("whaddup mang? \n", "how you doin?");
	//write("i'm good, you?");
	
	string feeling = chomp(readln());
	testSplit(feeling);
	//respond(feeling);
}

void testSplit(string test){
	writeln( test.split(". ") );
}

void respond(string feeling){
	string feel = feeling;
	if(feel == "bad"){
	                writeln("aw, i'm sorry I hope you feel better");
	}
        else if(feel == "good"){
		        writeln("cool");
	}
	else{
			writeln("you said: (",feel,")");				}
}
