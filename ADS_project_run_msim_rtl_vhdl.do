transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -2008 -work work {C:/Users/Tood/OneDrive - UTS/Documents/Git Repo/ADS_DSP/src/SPI_module.vhd}
vcom -2008 -work work {C:/Users/Tood/OneDrive - UTS/Documents/Git Repo/ADS_DSP/src/leds.vhd}
vcom -2008 -work work {C:/Users/Tood/OneDrive - UTS/Documents/Git Repo/ADS_DSP/src/filter_types.vhd}
vcom -2008 -work work {C:/Users/Tood/OneDrive - UTS/Documents/Git Repo/ADS_DSP/src/deserializer.vhd}
vcom -2008 -work work {C:/Users/Tood/OneDrive - UTS/Documents/Git Repo/ADS_DSP/src/filterDef.vhd}
vcom -2008 -work work {C:/Users/Tood/OneDrive - UTS/Documents/Git Repo/ADS_DSP/ADS_project.vhd}
vcom -2008 -work work {C:/Users/Tood/OneDrive - UTS/Documents/Git Repo/ADS_DSP/src/sumArr.vhd}
vcom -2008 -work work {C:/Users/Tood/OneDrive - UTS/Documents/Git Repo/ADS_DSP/src/serializer.vhd}
vcom -2008 -work work {C:/Users/Tood/OneDrive - UTS/Documents/Git Repo/ADS_DSP/src/serial_PFB.vhd}
vcom -2008 -work work {C:/Users/Tood/OneDrive - UTS/Documents/Git Repo/ADS_DSP/src/PFB3.vhd}

