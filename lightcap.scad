/*

    Light Cap
    by: Trey Chaffin
    
    This is a parametric light cap for a WML, based off the design from 
    One Hundred Concepts: https://onehundredconcepts.com/products/lightcap
    
*/


/* [Light Cap] */

// Light Diameter [in]
ld = 1.25;

// Elastic Cord Hole Diameter [in]
echd = 0.125;

// Padding Thickness [in]
pt = 0.0625;

// Cap Thickness [in]
ct = 0.125;

// Light Emboss Depth [in]
led = 0.0625;

// Light Emboss Draft Angle [deg]
da = 10; //[0:90]

/* [Thumb Pad] */

// Thumb Pad [true/false]
tp = true;

// Thumb Pad Width [in]
tpw = 0.75;

// Thumb Pad Fillet [in]
tpf = 0.0625;

// Thumb Pad Length [in]
tpl = 0.8125;

// CONVERT TO MM
ld_mm = ld*25.4;
echd_mm = echd*25.4;
pt_mm = pt*25.4;
ct_mm = ct*25.4;
led_mm = led*25.4;
tpw_mm = tpw*25.4;
tpf_mm = tpf*25.4;
tpl_mm = tpl*25.4;

/* [Hidden] */
$fn=256; // Set the resolution of the circles

difference() {
    linear_extrude(ct_mm){
            union() {
            minkowski() {
                hull(){
                    circle(d=ld_mm);
                    translate([(ld_mm)*0.5+echd_mm,0,0]) {
                        circle(d=echd_mm);
                    }
                    translate([-(ld_mm)*0.5-echd_mm,0,0]) {
                        circle(d=echd_mm);
                    }
                }
                circle(d=pt_mm*2);
            }
            if(tp) {
                hull(){
                    translate([-0.5*tpw_mm,tpl_mm,0]){
                        circle(r=tpf_mm);
                        translate([tpw_mm,0,0]) circle(r=tpf_mm);
                    }
                    translate([(ld_mm)*0.5+echd_mm,0,0]) {
                        circle(d=echd_mm+pt_mm*2);
                    }
                    translate([-(ld_mm)*0.5-echd_mm,0,0]) {
                        circle(d=echd_mm+pt_mm*2);
                    }
                }
            }
        }
    }
    translate([(ld_mm)*0.5+echd_mm,0,-1]) {
        cylinder(d=echd_mm, h=ct_mm+2);
    }
    translate([-(ld_mm)*0.5-echd_mm,0,-1]) {
        cylinder(d=echd_mm, h=ct_mm+2);
    }
    translate([0,0,ct_mm+1]) {
        rotate([180,0,0]) {
            cylinder(d1=2*(ct_mm+1)*tan(da)+ld_mm, d2=ld_mm, h=led_mm+1);
        }
    }
}

            