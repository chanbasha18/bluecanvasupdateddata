({
	openConfiguration : function(component, event, helper) {
        var evt = $A.get("e.force:navigateToComponent");
        evt.setParams({
            componentDef : "nfbot:AIConfig",
        });
        evt.fire();
	}
})