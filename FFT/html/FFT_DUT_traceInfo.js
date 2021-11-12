function RTW_Sid2UrlHash() {
	this.urlHashMap = new Array();
	/* <S1>/FFT
HDL Optimized */
	this.urlHashMap["FFT_DUT:32"] = "HDL_DUT.vhd:81,82,83,84,85,86,87,88,89,90,91";
	this.getUrlHash = function(sid) { return this.urlHashMap[sid];}
}
RTW_Sid2UrlHash.instance = new RTW_Sid2UrlHash();
function RTW_rtwnameSIDMap() {
	this.rtwnameHashMap = new Array();
	this.sidHashMap = new Array();
	this.rtwnameHashMap["<Root>"] = {sid: "FFT_DUT"};
	this.sidHashMap["FFT_DUT"] = {rtwname: "<Root>"};
	this.rtwnameHashMap["<S1>/fftIn"] = {sid: "FFT_DUT:30"};
	this.sidHashMap["FFT_DUT:30"] = {rtwname: "<S1>/fftIn"};
	this.rtwnameHashMap["<S1>/fftValidIn"] = {sid: "FFT_DUT:31"};
	this.sidHashMap["FFT_DUT:31"] = {rtwname: "<S1>/fftValidIn"};
	this.rtwnameHashMap["<S1>/FFT HDL Optimized"] = {sid: "FFT_DUT:32"};
	this.sidHashMap["FFT_DUT:32"] = {rtwname: "<S1>/FFT HDL Optimized"};
	this.rtwnameHashMap["<S1>/fftOut"] = {sid: "FFT_DUT:33"};
	this.sidHashMap["FFT_DUT:33"] = {rtwname: "<S1>/fftOut"};
	this.rtwnameHashMap["<S1>/fftValidOut"] = {sid: "FFT_DUT:34"};
	this.sidHashMap["FFT_DUT:34"] = {rtwname: "<S1>/fftValidOut"};
	this.getSID = function(rtwname) { return this.rtwnameHashMap[rtwname];}
	this.getRtwname = function(sid) { return this.sidHashMap[sid];}
}
RTW_rtwnameSIDMap.instance = new RTW_rtwnameSIDMap();
