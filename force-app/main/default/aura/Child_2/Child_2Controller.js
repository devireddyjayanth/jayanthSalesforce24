({
	invokes : function(component, event, helper) {
        var name = event.getParam("EmpName");
        component.set('v.val1',name);
		
	}
})