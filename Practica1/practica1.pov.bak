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
#include "shapes3.inc"  
#include "shapes.inc" 
//--------------------------------------------------------------------------
// camera ------------------------------------------------------------------

camera {
  location  <0.0, 18, -50>
  look_at   <0.0, 0, 2.5>
  right     x*image_width/image_height   
}

// create a regular point light source
light_source {
  0*x                  // light's position (translated below)
  color rgb <1,1,1>    // light's color
  translate <20, 40, -40>
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



        //   scale <1,1,1> rotate<10,0,1> translate<4.5,-2.2,-22.5>
        // } // end of cylinder -------------------------------------



#declare vaso_agua = 
union{
    difference{
        cylinder { <0,17.2,0>,<0,2.00,0>, 3 
            material{   //-----------------------------------------------------------
                texture { pigment{ rgbf <0.98, 0.98, 0.98, 0.9> }
                          finish { diffuse 0.1 reflection 0.2  
                                  specular 0.8 roughness 0.0003 phong 1 phong_size 400}
                } // end of texture -------------------------------------------
                interior{ ior 1.5 caustics 0.5
                } // end of interior ------------------------------------------
                
            } // end of material ----------------------------------------------------
            scale <1,1,1> rotate<10,0,1> translate<4.5,-2.2,-22.5>
        }
            
        cylinder { <0,17.3,0>,<0,2.00,0>, 1.8    
            material{   //-----------------------------------------------------------
                texture { pigment{ rgbf <0.98, 0.98, 0.98, 0.9> }
                          finish { diffuse 0.1 reflection 0.2  
                                  specular 0.8 roughness 0.0003 phong 1 phong_size 400}
                } // end of texture -------------------------------------------
                interior{ ior 1.5 caustics 0.5
                } // end of interior ------------------------------------------
                
            } // end of material ----------------------------------------------------
            scale <1,1,1> rotate<10,0,1> translate<4.5,-0.5,-22.5>
        } //fin cilindro
                       
    }//fin diferencia

    cylinder { <0,0,0>,<0,5,0>, 2    
            material{   //-----------------------------------------------------------
                texture { pigment{ rgbf <0.98, 0.98, 0.99, 0.7> }
                          finish { diffuse 0.1 reflection 0.2  
                                  specular 0.8 roughness 0.0003 phong 1 phong_size 400}
                } // end of texture -------------------------------------------
                interior{ ior 1.5 caustics 0.5
                } // end of interior ------------------------------------------
                
            } // end of material ----------------------------------------------------  
    scale <1,1,1> rotate<10,0,1> translate<4.4,1.8,-22.5>
            
    }

}

object{vaso_agua /*translate<4.5,-2.2,-22.5>*/}      

cylinder { <4,1.5,-22.5>,<6.5,21.3,-20>, 0.30 

           texture { pigment{ color rgb< 1, 1, 1>*0.00 } //  color Black
                // normal { bumps 0.5 scale 0.05 }
                   finish { phong 1 }
                 } // end of texture 

           
         } // end of cylinder -------------------------------------   
      
      

#declare taza=
union{
    difference{
        object{ Round_Cylinder_Tube( <0,0,0>, // starting point
                                 <0,9,0>, // end point
                                 3.8, // major radius
                                 0.12, // minor radius (borders)
                                 1,  //  1 = filled; 0 = open tube 
                                 1 // 0 = union, 1 = merge for transparent materials 
                               ) //-------------------------------------------------
            scale <1,1,1> 
            
         } // end of object
          
         object{ Round_Cylinder_Tube( <0,0,0>, // starting point
                                 <0,9.1,0>, // end point
                                 3.6, // major radius
                                 0.12, // minor radius (borders)
                                 1,  //  1 = filled; 0 = open tube 
                                 1 // 0 = union, 1 = merge for transparent materials 
                               ) //-------------------------------------------------
            scale <1,1,1> 
            
         } // end of object 
          
    }
    object{ Supertorus( 3.7, 0.1, // Radius_Major, Radius_Minor, 
                    1.00, 1, // Major_Control, Minor_Control,
                   0.001, 1.50) // Accuracy, Max_Gradient)      
        scale <1,1,1> 
        translate<0,8.93,0>
    } //---------------------------------------------------- 
      
      
      
      

    texture{ pigment{ color rgb<1,1,1> } 
                  // normal { bumps 0.5 scale 0.005 } 
                     finish { phong 1}                               
                   } // end texture
        

}  


object{taza translate<-2.3, -2.9, -24.5>
            rotate<5.8,0,0>
      }

            