({
	child : function(component, event, helper) {
		var ev = component.getEvent("firstCall");
        ev.setParams({"EmpName":"Jayanth"});
        console.log('event fire before');
        ev.fire();
        console.log('event fire after');
	}
})