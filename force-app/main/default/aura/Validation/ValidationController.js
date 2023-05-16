({
	doAction : function(component, event, helper) {
		var inputCmp = component.find("inputCmp");
        var value = inputCmp.get("v.value");
        
        //Is input numeric?
        if(isNaN(value)){
            inputCmp.set("v.errors",
                         [{message:"Input not a number: "+value}]);
        }else{
            //clear error
            inputCmp.set("v.errors",null);
        }
        
	}
})