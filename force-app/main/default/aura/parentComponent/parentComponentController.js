({
    
	handleComponentEvent : function(component, event, helper) {
        console.log('P-event fire before');
        var name = event.getParam("EmpName");
        component.set('v.MyName',name);
        console.log(name);
        console.log('P-event fire after');
		
	}
})