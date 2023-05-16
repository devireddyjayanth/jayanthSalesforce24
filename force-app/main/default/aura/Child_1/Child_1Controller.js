({
	call : function(component, event, helper) {
        
        var appEvent = $A.get("e.c:ThirdEvent"); 
        //Set event attribute value
        appEvent.setParams({"EmpName":"Jayanth"}); 
        appEvent.fire(); 
        
        
		
	}
})