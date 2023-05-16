({
	updateParent : function(component, event, helper) {
		component.set("v.parentVar","updated parent Value");
	},
    onParentVarChange : function(component, event, helper) {
		console.log("parent value has changed");
        console.log("Old value :"+event.getParam("OldValue"));
        console.log("New Value :"+event.getParam("value"));
	}
})