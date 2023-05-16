({
    doInit : function(component, event, helper) {
        //component.set('v.Message1','Button one initilized');
        //component.set('v.Message2','Button Two initilized');
		
	},
    ClickOne : function(component, event, helper) {
        //component.set('v.Message1','Clicked');
        var btn = event.getSource();
        var msg = btn.get("v.label");
        if(msg == "clickMe"){
            component.set("v.Message1",msg);
        }else {
            component.set("v.Message1",msg);
        }
	}
})