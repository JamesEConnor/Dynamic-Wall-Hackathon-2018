public static class Animation extends WallAnimation {

  
  // First, we add metadata to be used in the MoMath system. Change these
  // strings for your behavior.
  String behaviorName = "Binary Dynamic Wall Behavior";
  String author = "James Connor";
  String description = "Visually Demonstrates the Conversion between Decimal and Binary numbers from 1 - 128.";
  
  int i = 0;
  
  boolean forward = true;
  float loc = 0.0f;
  float step = 0.1;
  boolean binaryPhase = false;
  
  Animation()
  {
    super();
   // sketch = s;
  }
  
  // The setup block runs at the beginning of the animation. You could
  // also use this function to initialize variables, load data, etc.
  void setup() 
  {
    for(DWSlat slat : wall.slats)
    {
        slat.setTop(0);
        slat.setBottom(0);
    }
  }		 

  // The update block will be repeated for each frame. This is where the
  // action should be programmed.
  void update()
  {    
     if(forward)
       loc += step;
     else
       loc -= step;
       
     if(!binaryPhase)
     {
        wall.slats[i].setTop(loc);
        wall.slats[i].setBottom(loc);
        
        if(loc <= 0)
          binaryPhase = true;
     }
     else
     {
       int[] bin = getPositionsOfBinary(i + 1);
       
       for(int a = 0; a < bin.length; a++)
         if(bin[a] == 1)
         {
           wall.slats[a].setTop(loc);
           wall.slats[a].setBottom(loc);
         }
         
       if(loc <= 0)
       {
          binaryPhase = false;
          i++;
       }
     }
       
     if(loc >= 1 || loc <= 0)
       forward = !forward;
  }
  
  int[] getPositionsOfBinary(int d)
  {
     int[] container = new int[8];
     
     int i = 0;
     
     while(d > 0)
     {
        container[i] = d % 2;
        i++;
        d = d/2;
     }
     
     return container;
  }

  // Leave this function blank
  void exit() {
  }
  
  // You can ignore everything from here.
  String getBehaviorName() {
    return behaviorName;
  }
  
  String getAuthorName() {
    return author;
  }
  
  String getDescription() {
    return description;
  }
}
