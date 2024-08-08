box_length = 100;      
box_width = 80;        
box_height = 50;       
num_rows = 3;          
num_columns = 4;       
wall_thickness = 2;    

max_translation = 50;  
animation_duration = 1;

module outer_box(length, width, height, thickness) {
    difference() {
        cube([length, width, height]);
        translate([thickness, thickness, thickness])
            cube([length - 2 * thickness, width - 2 * thickness, height - thickness]);
    }
}

module compartments(length, width, height, rows, columns, thickness, translation) {
    compartment_length = (length - (columns + 1) * thickness) / columns;
    compartment_width = (width - (rows + 1) * thickness) / rows;

    for (i = [0:columns-1]) {
        for (j = [0:rows-1]) {
            translate([thickness + i * (compartment_length + thickness), 
                       thickness + j * (compartment_width + thickness), 
                       translation])
                cube([compartment_length, compartment_width, height]);
        }
    }
}

module storage_box(t) {
    outer_box(box_length, box_width, box_height, wall_thickness);
    compartments(box_length, box_width, box_height, num_rows, num_columns, wall_thickness, max_translation * sin(PI * t / animation_duration));
}

for (t = [0:1/30:1]) {
    storage_box(t);
}