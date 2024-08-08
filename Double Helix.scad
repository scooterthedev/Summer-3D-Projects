helix_height=150;

twist_amount=360.0;

arm_distance=23;

arm_thickness=15;

arm_width=.35;

arm_offset=45;

beam_height=3;

beam_width=6;

beam_roundness=1.5;

num_beams=10.0;

base_height=5;

base_radius=37;

base_taper=.95;

module roundedcube(xx, yy, height, radius) {

difference(){

    cube([xx,yy,height]);

    difference(){
        translate([-.5,-.5,-.2])
        cube([radius+.5,radius+.5,height+.5]);

        translate([radius,radius,height/2])
        cylinder(height,radius,radius,true);
    }
    translate([xx,0,0])
    rotate(90)
    difference(){
        translate([-.5,-.5,-.2])
        cube([radius+.5,radius+.5,height+.5]);

        translate([radius,radius,height/2])
        cylinder(height,radius,radius,true);
    }

    translate([xx,yy,0])
    rotate(180)
    difference(){
        translate([-.5,-.5,-.2])
        cube([radius+.5,radius+.5,height+.5]);

        translate([radius,radius,height/2])
        cylinder(height,radius,radius,true);
    }

    translate([0,yy,0])
    rotate(270)
    difference(){
        translate([-.5,-.5,-.2])
        cube([radius+.5,radius+.5,height+.5]);

        translate([radius,radius,height/2])
        cylinder(height,radius,radius,true);
    }
}
}

beam_length=arm_distance*2-arm_thickness*.5;
beam_twist=twist_amount/(num_beams+1.0);
beam_delta=helix_height/(num_beams+1.0);
beam_offset=arm_offset*.5;

module arm_footprint(helix_r=50
	,arm_r=10
	) {
  skinny_arm = arm_r * arm_width;
  union() {
    translate([ -helix_r + skinny_arm * .5,0]) 
	  square([skinny_arm,arm_r],center=true);
    rotate([0,0,arm_offset])
      translate([ helix_r - skinny_arm * .5,0]) 
	    square([skinny_arm,arm_r],center=true);
  }
}

module helix_coil(helix_r=100
	, arm_r=10
	, helix_h=100
	) {
  linear_extrude(height=helix_h, convexity=10, twist=-twist_amount, slices=500) 
	arm_footprint(helix_r=helix_r
		,arm_r=arm_r
	);
}

linear_extrude(height=base_height, scale=base_taper)    circle(r=base_radius, $fn=400 );

translate([0, 0, base_height])
  helix_coil(helix_h=helix_height
	,arm_r=arm_thickness
	,helix_r=arm_distance
	);

translate([0, 0, base_height])
 for ( i = [1:1:num_beams]) 
  rotate([0,0,beam_twist*i])
    translate([-.5*beam_length,
            -.5*beam_width,
            .5*beam_height + beam_delta*i])
        rotate([0,90,beam_offset]) 
        roundedcube(beam_height,beam_width,beam_length,beam_roundness);