//+w456 +h573 

// PoVRay 3.7 Scene File " ... .pov"
// author:  ...
// date:    ...
//--------------------------------------------------------------------------
#version 3.7;
global_settings{ assumed_gamma 1.0 }
#default{ finish{ ambient 0.1 diffuse 0.9 }} 
//--------------------------------------------------------------------------
#include "colors.inc"
#include "textures.inc"
#include "glass.inc"
#include "metals.inc"
#include "golds.inc"
#include "stones.inc"
#include "woods.inc"
#include "shapes.inc"
#include "shapes2.inc"
#include "functions.inc"
#include "math.inc"
#include "transforms.inc"
//--------------------------------------------------------------------------
// camera ------------------------------------------------------------------

camera {
  location  <0.0, 23, -50>
  look_at   <0.0, 0, 2.5>
  right     x*image_width/image_height   
}

         
// ground -------------------------------------------------------------------
plane{ <0,1,0>, 0 
       texture{ pigment{ color rgb<0.85, 0.85, 0.85> }
              } // end of texture        
         
       
     } // end of plane        
     
plane{ <0,0,1>, 1 
       texture{ pigment{ color rgb<0.5, 0.8, 0.2> }
              } // end of texture        
     
       
     } // end of plane     
                            
sphere { <0,0,0>, 0.5 

        texture { pigment{ color rgb<1.00, 0.55, 0.00>}
                  finish { phong 1.0 reflection 0.00}
                } // end of texture

          scale<1,1,1>  rotate<0,0,0>  translate<0,0,0>  
       }  // end of sphere ----------------------------------- 

cylinder { <0,17,0>,<0,2.00,0>, 3.5 

          texture{ pigment{ color rgb< 1, 0.5, 0.5>*1.4 } // 
                // normal { bumps 0.5 scale 0.05 }
                 //  finish { phong 1 reflection 0.00}
                 } // end of texture 

           scale <1,1,1> rotate<0,0,0> translate<4.5,0,-20>
         } // end of cylinder -------------------------------------

