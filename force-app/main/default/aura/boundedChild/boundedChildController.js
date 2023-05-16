({
	updateChild : function(component, event, helper) {
		component.set("v.childVar","updated child value");
	},
    onChildVarChange : function(component, event, helper) {
		console.log("child value has changed");
        console.log("Old value :"+event.getParam("OldValue"));
        console.log("New Value :"+event.getParam("value"));
	}
})