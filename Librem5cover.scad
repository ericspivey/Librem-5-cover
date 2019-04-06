//Copyright (C) 2019 Eric C. Spivey
// Gnu General Public Licence v3 boilerplate below

// estimated phone at 71 x 152 mm, probably 70 x 150 mm, with a 7.5 mm radius of curvature at the edge
// back bevel surface is 67 x 149 mm, probably 66 x 148 mm
// wild estimate of thickness is 12 mm, with 4 mm of bevel
// ALL UNITS IN MILLIMETERS

//SET THICKNESS
th = 1; // desired thickness of cover, this is the distance between outside and inside of the cover surface

//DIMENSIONS OF THE PHONE
r1=7.5; // outer radius of curvature of phone corners
l1 = 150; // length of phone
w1 = 70; // width of phone
h1 = 8;// height wihout bevel
re = 0.5; // phone edge radius
hb = 4; //bevel height
lb = 146; // bevel length
wb = 66; // bevel width
rb = 3.5; // bevel radius of curvature
lo = 148; // top opening length
wo = 68; // top opening width
ro = 7.5; // top opening radius of curvature
hf = 2.5; // top opening height multiplier
ct = 1.5; // center distance for side holes
lr = 24; // length of the rocker
wr = 2; // width of the rocker

//LOCATIONS OF CONTROLS (relative to top left of phone when facing the back)
chx = 18; // camera hole x
chy = 15; // camera hole y
flx = 10; // flash hole x
fly = 15; // flash hole y
jkx = 55; // jack x

r=3; // outer radius of curvature of case corners
l = l1+(2*th); // length of cover
w = w1+(2*th); // width of cover
h = h1+hb+(2*th); // height of cover

difference(){
// Main outer surface of case
union(){hull(){
    translate([0,0,h/2-re])bev_rect(re*3,r,w,l);
    translate([0,0,-h/2+re])bev_rect(re,r,w,l);
}
// rocker cover
translate([((w/2)-0),((l1/2)-50),ct])rotate([90,90,90])hull(){
    translate([0,(lr/2)+1])sphere(wr,true,$fn=50);
    translate([0,-(lr/2)-1])sphere(wr,true,$fn=50);
}
}

// Inner surface of case (phone-shaped void)
translate([0,0,hb/2])hull(){
    translate([0,0,h1/2-re])bev_rect(re,r1,w1,l1); // top of main body
    translate([0,0,-h1/2+re])bev_rect(re,r1,w1,l1); // middle of main body

    translate([0,0,-(h1/2+hb-re)])bev_rect(re,rb,wb,lb); // bottom bevel
}

//top opening
translate([0,0,((h-hf)/2)-th])linear_extrude(hf*2*th)hull(){
    translate([((wo/2)-ro),((lo/2)-ro)])circle(ro,true,$fn=50);
    translate([-((wo/2)-ro),((lo/2)-ro)])circle(ro,true,$fn=50);
    translate([((wo/2)-ro),-((lo/2)-ro)])circle(ro,true,$fn=50);
    translate([-((wo/2)-ro),-((lo/2)-ro)])circle(ro,true,$fn=50);
    }

//Uncomment following line to check cross section
//translate([0,0,3])cube([100,100,100]); // check cross section

//camera and light hole
hull(){
    translate([((w1/2)-chx),((l1/2)-chy)])cylinder(2*h1,5.5,5.5,true,$fn=50);// camera hole
    translate([((w1/2)-flx),((l1/2)-fly)])cylinder(2*h1,1.5,1.5,true,$fn=50);// light hole 
}

// phone jack hole
translate([((w1/2)-jkx),((l1/2)-0),ct])rotate([0,90,90])cylinder(2*h1,2.5,2.5,true,$fn=50);

// USB jack hole
translate([((w1/2)-36),((l1/2)-150),ct])rotate([0,90,90])hull(){
    translate([0,2])cylinder(2*h1,2.5,2.5,true,$fn=50);
    translate([0,-2])cylinder(2*h1,2.5,2.5,true,$fn=50);
}
k1y = 76; // kill switch 1 y
k2y = 56; // kill switch 2 y
k3y = 36; // kill switch 3 y
// kill switch hole 1
translate([((w1/2)-71),((l1/2)-k1y),ct])rotate([90,90,90])hull(){
    translate([0,2])cylinder(2*h1,2.5,2.5,true,$fn=50);
    translate([0,-2])cylinder(2*h1,2.5,2.5,true,$fn=50);
}
// kill switch hole 2
translate([((w1/2)-71),((l1/2)-k2y),ct])rotate([90,90,90])hull(){
    translate([0,2])cylinder(2*h1,2.5,2.5,true,$fn=50);
    translate([0,-2])cylinder(2*h1,2.5,2.5,true,$fn=50);
}
// kill switch hole 3
translate([((w1/2)-71),((l1/2)-k3y),ct])rotate([90,90,90])hull(){
    translate([0,2])cylinder(2*h1,2.5,2.5,true,$fn=50);
    translate([0,-2])cylinder(2*h1,2.5,2.5,true,$fn=50);
}

// rocker cover cavity
translate([((w1/2)-0),((l1/2)-50),ct])rotate([90,90,90])hull(){
    translate([0,lr/2])sphere(wr,true,$fn=50);
    translate([0,-lr/2])sphere(wr,true,$fn=50);
}
}

//MODULES
module bev_rect (rb,rr,wr,lr){
    hull(){
        translate([((wr/2)-rr),((lr/2)-rr)])rotate_extrude(convexity=10, $fn=50)translate([rr,0,0])circle(r = rb, $fn=50);
        translate([-((wr/2)-rr),((lr/2)-rr)])rotate_extrude(convexity=10, $fn=50)translate([rr,0,0])circle(r = rb, $fn=50);
        translate([((wr/2)-rr),-((lr/2)-rr)])rotate_extrude(convexity=10, $fn=50)translate([rr,0,0])circle(r = rb, $fn=50);
        translate([-((wr/2)-rr),-((lr/2)-rr)])rotate_extrude(convexity=10, $fn=50)translate([rr,0,0])circle(r = rb, $fn=50);
    }
}

//EXTRA STUFF?
//scale(0.95)hull(){
//    translate([44.75,44.75])sphere(15,true);
//    translate([-44.75,44.75])sphere(15,true);
//    translate([44.75,-44.75])sphere(15,true);
//    translate([-44.75,-44.75])sphere(15,true);
//}

//GNU GENERAL PUBLIC LICENSE BOILERPLATE
//    This program is free software: you can redistribute it and/or modify
//    it under the terms of the GNU General Public License as published by
//    the Free Software Foundation, either version 3 of the License, or
//    (at your option) any later version.

//    This program is distributed in the hope that it will be useful,
//    but WITHOUT ANY WARRANTY; without even the implied warranty of
//    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//    GNU General Public License for more details.

//    You should have received a copy of the GNU General Public License
//    along with this program.  If not, see <https://www.gnu.org/licenses/>.
