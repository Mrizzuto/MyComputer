import processing.svg.*;


PFont f;
import processing.pdf.*;
Table table;
int fontSize = 4;

void setup(){
  size(10000, 15000, PDF, "out_1.pdf");
  //size(20000, 4000,PDF,"MyComputer.pdf");
  background(255);
  printArray(PFont.list());
  f = createFont("SourceCodePro-Regular.ttf", fontSize);
  textFont(f);
  
  table = loadTable("output_noSpace.csv", "header");
  
  textAlign(LEFT);
  int indent = 0;      // position from width = 0
  int lineHeight = fontSize;  // position for height = 0; ( native as fontsize bc text writes from the bottom)
  int numIndents = 0;  // columns of text
  //int longestLine = 0; // DEPRICATED
  //int lineLength;
  fill(0);             // Text Color
  
   
    

    
  
        
    //#---#
    //if (i < 20) {
    //  println("[" + i + "]" + text[i]);
    //}
    //println("[" + i + "]" + text[i]);
    //println("Indents: " + numIndents + "| Indent Margin: " + indent);
    //#---#
  int i = 0;
  for (TableRow row : table.rows()) {
      if(i > 25){
        println("we are done for now");
        break;
      }
      int count = row.getInt("counts");
      String character = row.getString("character");
      println("count: " + count + "| " + "character: " + character);
      
      for (int z = 0; z <= count; z++){
        
        if (lineHeight == height){   //reset for next line of shit
          lineHeight = fontSize;     //go to the top of the sketch
          
          indent += fontSize;        //move to the next column
          numIndents ++;             // just to keep track of progress
          //Debug ------>>
          //println("[" + i + "]" + text[i]);
          //println("Indents: " + numIndents);
          //Debug ------
          
        }
        else {  //we havnt made it to the bottom yet, keep going.
          lineHeight += fontSize;
        }
        
        text(character,indent,lineHeight);
      }
      i = i + 1; 
    }
  //quit
  //save("out1.png");
  println("Finished.");
  exit();
}
