// Door parameters
door_width = 80;
door_height = 200;
door_thickness = 4;
hinge_radius = 3;
hinge_height = 20;

module door() {
    color("brown")
    cube([door_width, door_thickness, door_height]);
}

module frame() {
    difference() {
        color("gray")
        cube([door_width + 10, door_thickness + 10, door_height + 10]);
        
        translate([5, 5, 0])
        cube([door_width, door_thickness + 1, door_height]);
    }
}

module hinge() {
    color("silver")
    cylinder(h = hinge_height, r = hinge_radius, $fn = 20);
}

frame();

function easeInOutQuad(t) = 
    t < 0.5 ? 2 * t * t : -1 + (4 - 2 * t) * t;

angle = -90 * easeInOutQuad(($t < 0.5) ? $t * 2 : 2 - $t * 2);

translate([door_width + 5, 5, 20])
hinge();

translate([door_width + 5, 5, door_height - 20])
hinge();

translate([door_width + 5, 5, 0])
rotate([0, 0, angle])
translate([-door_width, 0, 0])
door();