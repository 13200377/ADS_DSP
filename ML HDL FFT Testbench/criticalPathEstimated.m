open_system('gm_FFT_DUT');
cs.HiliteType = 'user2';
cs.ForegroundColor = 'black';
cs.BackgroundColor = 'lightblue';
set_param(0, 'HiliteAncestorsData', cs);
hilite_system('gm_FFT_DUT/HDL_DUT/FFT HDL Optimized', 'user2');
annotate_port('gm_FFT_DUT/HDL_DUT/FFT HDL Optimized', 0, 1, 'cp : 4.63 ns');
