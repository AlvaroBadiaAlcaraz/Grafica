
global_settings {max_trace_level 18}

// perspective (default) camera
camera {
  location  <0.0, 2.0, -5.0>
  look_at   <0.0, 0.0,  0.0>
  right     x*image_width/image_height
}

// create a regular point light source
light_source {
  0*x                  // light's position (translated below)
  color rgb <.2,0,0>    // light's color
  translate <0,0,-5>
}

light_source {
  0*x                  // light's position (translated below)
  color rgb <0,.2,0>    // light's color
  translate <2,0,-5>
}

light_source {
  0*x                  // light's position (translated below)
  color rgb <0,0,.2>    // light's color
  translate <-2,0,-5>
}


#declare Mirror = texture {pigment{color<1.0,1.0,1.0>} finish {ambient 0 brilliance 1 reflection 1 metallic}} 

plane { <0,1,0>, 0  hollow // normal vector, distance to zero ----

        texture{ Mirror} // end of texture
        
      } // end of plane ------------------------------------------

plane { <0,1,0>, 3  hollow // normal vector, distance to zero ----

        texture{ Mirror} // end of texture
        
      } // end of plane ------------------------------------------            
            
                                                                                                                   
      
#declare espejo = box { <0,0,0><5,3,0>   
      no_shadow
      texture { Mirror} // end of texture 
    } // end of box -------------------------------------- 
    
#declare bola = sphere { <0,0,0>, 0.3 
        
        texture { Mirror} // end of texture
 
       }  // end of sphere ----------------------------------- 
              
object{espejo translate<0,0,-1> rotate<0,45,0>} 
object{espejo translate<-5,0,-1> rotate<0,-45,0>}     
object{espejo translate<-1.5,0,-6>}
object{espejo translate<-2.5,0,-2.2>} 
                
                                                                     
object{bola translate<-0.6,1,-3>}  
object{bola translate<0,1.5,-3>}
object{bola translate<0.6,1,-3>}
object{bola translate<0,1,-3.5>}

       
