function RTW_SidParentMap() {
    this.sidParentMap = new Array();
    this.sidParentMap["FFT_DUT:30"] = "FFT_DUT:7";
    this.sidParentMap["FFT_DUT:31"] = "FFT_DUT:7";
    this.sidParentMap["FFT_DUT:32"] = "FFT_DUT:7";
    this.sidParentMap["FFT_DUT:33"] = "FFT_DUT:7";
    this.sidParentMap["FFT_DUT:34"] = "FFT_DUT:7";
    this.getParentSid = function(sid) { return this.sidParentMap[sid];}
}
    RTW_SidParentMap.instance = new RTW_SidParentMap();
