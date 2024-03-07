/* --------------------------
Entry: 0031
WWW: http://rr.www.cistron.nl/
Title: Hyperspace portal
Author: Rasta Robert

Based on the Wada fractal effect. I was trying to make something for the
short code contest, but didn't get it beneath the maximum length.
But some of the things I tried worked out nicely.
---------------------------*/

global_settings {max_trace_level 15}
#declare C = sqrt(3) ;
#declare L = .22 ;
camera {location <L,-L,L> up y right x look_at <0,0,0>}
light_source {<-L,-L,-L> color <.1,0,0>}
light_source {<-L,L,L> color <0,.1,0>}
light_source {<L,L,-L> color <0,0,.1>}
#declare Mirror = texture {pigment{color<1.0,1.0,1.0>} finish {ambient 0 brilliance 1 reflection 1 metallic}}
sphere {<-.5,.5,-.5>, .7 texture {Mirror}}   
triangle {< -C,C,-C >,<-C,-C,C>,<C,C,C> texture {Mirror}}
triangle {< -C,C,-C >,<C,C,C>,<C,-C,-C> texture {Mirror}}
triangle {< -C,C,-C >,<C,-C,-C>,<-C,-C,C> texture {Mirror}}
triangle {< C,-C,-C >,<C,C,C>,<-C,-C,C> texture {Mirror}}   
