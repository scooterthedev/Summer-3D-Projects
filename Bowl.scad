diameter = 32;
radius = diameter/2;

bodyHeight = 50;

baseHeight = 1;

rimHeight = 1;

// [Style]

sides = 10;

thickness = 1.5;

bodyTwist = 40;

bodyFlare = 1.8;

// base
linear_extrude( height = baseHeight )
    polyShape( solid="yes" );

// body
translate([0,0,baseHeight])
linear_extrude( height = bodyHeight, twist = bodyTwist,
                scale = bodyFlare, slices = 2*bodyHeight )
    polyShape( solid="no" );
    
// rim
translate([0,0,bodyHeight+baseHeight])
rotate(-bodyTwist)
scale(bodyFlare)
linear_extrude( height = rimHeight )
    polyShape( solid="no" );


// MODULES

module polyShape(solid){
    difference(){
        // start with outer shape
        offset( r=5, $fn=48 )
            circle( r=radius, $fn=sides );
        // take away inner shape
        if (solid=="no"){
        offset( r=5-thickness, $fn=48 )
            circle( r=radius, $fn=sides );
        }
    }
}