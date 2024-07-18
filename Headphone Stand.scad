$fn = 100;

translate([100,10,0])
difference()
{
rotate([-90,0,0])
{
difference()
{

    translate([0,-65,10])
        cube([20,130, 20], center=true);
    
    translate([0,-40,0])
    union()
    {
        cylinder(50, r=5, center=true);
        
        translate([0,-40,0])
            cylinder(50, r=5, center = true);
        
        translate([0,-80,0])
            cylinder(50, r=5, center = true);
                
        
    }
    
}

    translate([0,-10,35])
        cylinder(70,r2=40,r1=10,center=true);
difference()
{
    translate([0,20,65])
    union()
    {
        {
            color("indigo",1.0)
            cylinder(130, r=60, center=true);
        }
        
        translate([0,0,61])
        {
            
            cylinder(10, r1=70,r2=75, center=true);
        }
        
        translate([0,0,10])
        {
            cylinder(10, r2=95,r1=100, center=true);
        }
       
    }
    
    cube([200,200,140],center=true);
}
}

translate([-200,-200,-200])
    cube([400,400,200]);

}