({
	doInit : function(component, event, helper) {
        
        var evn = component.getEvent("secondEvReg");
        evn.setParams({"StudentName":"Jayanth"});
        evn.fire();
		
	}
})