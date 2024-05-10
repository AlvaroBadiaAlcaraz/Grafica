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
    

    
#default{ finish{ ambient 0 diffuse 1 }} 

global_settings {
  radiosity {
    pretrace_start 0.08           // start pretrace at this size
    pretrace_end   0.04           // end pretrace at this size
    count 50                      // higher -> higher quality (1..1600) [35]

    nearest_count 5               // higher -> higher quality (1..10) [5]
    error_bound 1.8               // higher -> smoother, less accurate [1.8]
    recursion_limit 3             // how much interreflections are calculated (1..5+) [3]

    low_error_factor .5           // reduce error_bound during last pretrace step
    gray_threshold 0.0           // increase for weakening colors (0..1) [0]
    minimum_reuse 0.001         // reuse of old radiosity samples [0.015]
    brightness 0.3                  // brightness of radiosity effects (0..1) [1]

    adc_bailout 0.01/2

  }
  
}

// An area light (creates soft shadows)
// WARNING: This special light can significantly slow down rendering times!
light_source {
  <0,0,0>             // light's position (translated below)
  color rgb 1.0       // light's color
  area_light
  <8, 0, 0> <0, 0, 8> // lights spread out across this distance (x * z)
  4, 4                // total number of lights in grid (4x*4z = 16 lights)
  //adaptive 0          // 0,1,2,3...
  //jitter              // adds random softening of light
  //circular            // make the shape of the light circular
  //orient              // orient light     
  fade_distance 40
  fade_power 4.5
  translate <21, 20, -50>    // <x y z> position of light
}

// create a point "spotlight" (conical directed) light source
light_source {
  <0,0,0>                 // light's position (translated below)
  color rgb <1,1,1>       // light's color
  spotlight               // this kind of light source
  translate <40, 20, -80> // <x y z> position of light
  point_at <20, 0, 0>      // direction of spotlight
  radius 35                // hotspot (inner, in degrees)
  tightness 80            // tightness of falloff (1...100) lower is softer, higher is tighter
  falloff 2               // intensity falloff radius (outer, in degrees)
}

 

         
// ground -------------------------------------------------------------------
plane{ <0,1,0>, 0 
       texture{ pigment{ color rgb<0.85, 0.85, 0.85> }
              } // end of texture        
         
       
     } // end of plane       
     
plane{ <0,0,1>, 1 
       texture{ pigment{ color rgb<0.65, 0.85, 0.03> }
              } // end of texture        
     
       
     } // end of plane     


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
            
        cylinder { <0,17.3,0>,<0,2.00,0>, 2    
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

    cylinder { <0,0,0>,<0,5,0>, 2.2    
            material{   //-----------------------------------------------------------
                texture { pigment{ rgbf <0.98, 0.98, 0.99, 0.7> }
                          finish { diffuse 0.1 reflection 0.2  
                                  specular 0.8 roughness 0.0003 phong 1 phong_size 400}
                } // end of texture -------------------------------------------
                interior{ ior 0 caustics 0.5
                } // end of interior ------------------------------------------
                
            } // end of material ----------------------------------------------------  
    scale <1,1,1> rotate<10,0,1> translate<4.4,1.8,-22.5>   
    
            
    }
    object{ Supertorus( 2.9, 0.1, // Radius_Major, Radius_Minor, 
                    1.00, 0.45, // Major_Control, Minor_Control,
                   0.001, 1.50) // Accuracy, Max_Gradient)
        
        material{   //-----------------------------------------------------------
                texture { pigment{ rgbf <0.98, 0.98, 0.99, 0.7> }
                          finish { diffuse 0.1 reflection 0.2  
                                  specular 0.8 roughness 0.0003 phong 1 phong_size 400}
                } // end of texture -------------------------------------------
                interior{ ior 1.5 caustics 0.5
                } // end of interior ------------------------------------------
                
            } // end of material ----------------------------------------------------
        scale <1,1,1> 
        rotate<10,0,1> 
        translate<4.18,14.68,-20> 
        
      } //----------------------------------------------------  
      no_shadow

}
     
#declare anilla=
cylinder { <0,0,0>,<0,0.15,0>, 0.35} // end of cylinder -------------------------------------
    
                             
#declare pajita=
union{
    cylinder { <0,0,0>,<0,20,0>, 0.30   
    } // end of cylinder -------------------------------------
    
    #for(i, 14.5,15.5,0.2)
        object{anilla translate<0,i,0>}  
    #end
    
    texture { pigment{ color rgb< 1, 1, 1>*0.00 } //  color Black
            // normal { bumps 0.5 scale 0.05 }
               finish { phong 1 }
             } // end of texture  
    no_shadow
}
                     

#declare taza=
merge{
    difference{
        object{ Round_Cylinder_Tube( <0,0,0>, // starting point
                                 <0,9,0>, // end point
                                 4.2, // major radius
                                 0.12, // minor radius (borders)
                                 1,  //  1 = filled; 0 = open tube 
                                 1 // 0 = union, 1 = merge for transparent materials 
                               ) //-------------------------------------------------
            texture{  pigment{ image_map{
                    jpeg "beatles.jpg" map_type 0
                    
                   } rotate<0,0,0>   scale <13.5,10,10>  translate <-5.8,-0.5,0>
                   
                   } 
                    finish { diffuse 0.5 
                    reflection {  
                        0, 0.4
                        fresnel on
                        }
                     
                    ambient 0.2 specular 0.8  phong 1 phong_size 400}
              
              } // end of texture
            scale <1,1,1> 
            
         } // end of object
          
         object{ Round_Cylinder_Tube( <0,0,0>, // starting point
                                 <0,9.1,0>, // end point
                                 3.9, // major radius
                                 0.12, // minor radius (borders)
                                 1,  //  1 = filled; 0 = open tube 
                                 1 // 0 = union, 1 = merge for transparent materials 
                               ) //-------------------------------------------------
            scale <1,1,1> 
            
         } // end of object 
          
    } //fin diferencia    
    
    object{ Supertorus( 4.05, 0.15, // Radius_Major, Radius_Minor, 
                    1.00, 1, // Major_Control, Minor_Control,
                   0.001, 1.50) // Accuracy, Max_Gradient)      
        scale <1,1,1> 
        translate<0,8.92,0>
    } //--fin supertoro 
    
    difference{
        object{ Round_Cylinder_Tube( <0,0,0>, // starting point
                                 <0,0,-1>, // end point
                                 2, // major radius
                                 0.3, // minor radius (borders)
                                 1,  //  1 = filled; 0 = open tube 
                                 1 // 0 = union, 1 = merge for transparent materials 
                               ) //------------------------------------------------- 
        } // end of object ----
        
        object{ Round_Cylinder_Tube( <0,0,0.1>, // starting point
                                 <0,0,-1.1>, // end point
                                 1.7, // major radius
                                 0.12, // minor radius (borders)
                                 1,  //  1 = filled; 0 = open tube 
                                 1 // 0 = union, 1 = merge for transparent materials 
                               ) //-------------------------------------------------
        } // end of object ---- 
        scale <1.1,1.75,1> 
        translate<-4.52,4.8,-1.5> 
        rotate<0,0,0>
    
    }
          
    
    texture{  pigment{ color rgb<1,1,1> } 
                  // normal { bumps 0.5 scale 0.005 } 
                       
                    finish { diffuse 0.5 
                    reflection {  
                        0, 0.4
                        fresnel on
                        }
                     
                    ambient 0.2 specular 0.8  phong 1 phong_size 400}                             
                   } // end texture        
}

#declare prisma=
difference{
    // linear prism in y-direction: from .. ,to ..,number of points (first = last)
    prism { 0.00 ,7.50 , 4
       <-1.50, 0.00>, // first point
       < 1.50, 0.00>, 
       < 0.00,-2.50>,
       <-1.50, 0.00>  // last point = first point !!!

        material{   //-----------------------------------------------------------
                texture { pigment{ rgbf <0.98, 0.98, 0.98, 0.7> }
                          finish { diffuse 0.1 reflection 0.2  
                                  specular 0.8 roughness 0.0003 phong 1 phong_size 400}
                } // end of texture -------------------------------------------
                interior{ ior 1.5 caustics 0.5
                } // end of interior ------------------------------------------
                
            } // end of material ----------------------------------------------------

       scale <1.00, 1.00, 1.00> 
    } // end of prism --------------------------------------------------------
    box { <-1.50, 6.00, -2.50>,< 2.00, 10.00, 4.00>   

      texture { pigment{ color rgb<1.00, 1.00, 1.00>}  
                finish { phong 1 reflection{ 0.00 metallic 0.00} } 
              } // end of texture

      scale <1,1,1> rotate<-20,0,0> translate<0,1.17,0>  
    } // end of box -------------------------------------- 
    box { <-0.30, 0.00, -2.30>,< 0.50, 8.00, -3.00>   

      texture { pigment{ color rgb<1.00, 1.00, 1.00>}  
                finish { phong 1 reflection{ 0.00 metallic 0.00} }  
                
              } // end of texture

      scale <1,1,1> rotate<0,0,0> translate<0,0,0> 
    } // end of box --------------------------------------


}  
     
#declare bola=
sphere { <0,0,0>, 0.5 
          scale<1,1,1>  rotate<0,0,0>  translate<0,0.5,0>  
       }  // end of sphere ----------------------------------- 


     

object{taza translate<-5.6, -2.9, -24.5>
            rotate<5.8,-5,0>}

object{vaso_agua translate<-0.9,0,0>}            
                 
object{pajita translate<2.8,1.5,-21>
              rotate<0,0,-7>}  
              
object{prisma rotate<-15,30,0>
              translate<7,0,-29>}
      
object{bola scale<2.5,2.5,2.5>
            translate<3.8,0,-28.85>
            material{ texture { NBwinebottle   
              
                    } // end of texture 
                      interior{ I_Glass } // end of interior
                    } // end of material -------------------      
      }
      
object{bola scale<1.5,1.5,1.5>
            translate<1.6,0,-29>
            material{ texture { NBwinebottle } // end of texture 
                      interior{ I_Glass } // end of interior
                    } // end of material -------------------      
      }     
      
object{bola scale<1.7,1.7,1.7>
            translate<2,0,-30.8>
            texture{ Chrome_Metal
            
                    pigment{color rgb<0.49, 0.35, 0.23>}
                   
                   finish {ambient 0.1 specular 0 phong 0.5 phong_size 40}
            } // end of texture ---------------------------
              
      
      } 


