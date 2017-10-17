/**
 * Created by Deepu on 2/1/17.
 */
({
    fireUpdateEvent :function(component) {
        var selectEvent = $A.get("e.nfbot:AIConfigSelect");
        selectEvent.setParams({
            configId: component.get('v.config.id')
        });
        selectEvent.fire();
    }
})