({
	invokes : function(component, event, helper) {
        var name = event.getParam('StudentName');
        component.set('v.myName',name);
		
	}
})