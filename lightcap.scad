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

// Thumb Pad [true/false]
tp = true;

// Thumb Pad Width [in]
tpw = 0.5;

// Thumb Pad Fillet [in]
tpf = 0.0625;

// Thumb Pad Height [in]
tph = 0.875;


// CONVERT TO MM
ld_mm = ld*25.4;
echd_mm = echd*25.4;
pt_mm = pt*25.4;
ct_mm = ct*25.4;
led_mm = led*25.4;
tpw_mm = tpw*25.4;
tpf_mm = tpf*25.4;
tph_mm = tph*25.4;

$fn=256;

difference() {
    linear_extrude(ct_mm){
        difference() {
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
            translate([(ld_mm)*0.5+echd_mm,0,0]) {
                circle(d=echd_mm);
            }
            translate([-(ld_mm)*0.5-echd_mm,0,0]) {
                circle(d=echd_mm);
            }
        }
    }

    translate([0,0,ct_mm+1]) {
        rotate([180,0,0]) {
            linear_extrude(led_mm+1) {
                circle(d=ld_mm);
            }
        }
    }
}

if(tp) {
    hull(){
        translate([-0.5*tpw_mm,tph_mm,0]){
            circle(r=tpf_mm);
            translate([tpw_mm,0,0]) circle(r=tpf_mm);
        }
    }
}