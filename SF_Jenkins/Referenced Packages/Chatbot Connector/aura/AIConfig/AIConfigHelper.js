/**
 * Created by Deepu on 2/1/17.
 */
({
    toggleModal : function (component) {
        $A.util.toggleClass(component.find('detailModalBackdrop'), 'slds-backdrop--open');
        $A.util.toggleClass(component.find('detailModal'), 'slds-fade-in-open');
    },
    save : function(component) {
        var self = this;
        var action = component.get("c.saveConfig");
        action.setParams({data : JSON.stringify(component.get("v.config"))});
        action.setCallback(this, function(response) {
            if (response.getState() === 'ERROR') {
                response.getError().forEach(function(error){
                    var toastEvent = $A.get("e.force:showToast");
                    toastEvent.setParams({
                        title: 'Error!',
                        message: error.message,
                        type : 'error'
                    });
                    toastEvent.fire();
                });
            } else {
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    title: 'Success!',
                    message: '',
                    type : 'success'
                });
                toastEvent.fire();
                self.clearValues(component);
                component.set('v.configs', response.getReturnValue());
                self.toggleModal(component);
            }
        });
        $A.enqueueAction(action);
    },
    retrieveAllSettings : function(component) {
        var action = component.get("c.getAllConfig");
        action.setCallback(this, function(response) {
            if (response.getState() === 'ERROR') {
                response.getError().forEach(function(error){
                    var toastEvent = $A.get("e.force:showToast");
                    toastEvent.setParams({
                        title: 'Error!',
                        message: error.message,
                        type : 'error'
                    });
                    toastEvent.fire();
                });
            } else {
                component.set('v.configs', response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    },
    loadValues : function(component, id) {
        var configs = component.get('v.configs');
        configs.forEach(function(element) {
            if (element.id === id) {
                component.set('v.config', element);
            }
        });
        this.loadValue(component);
    },
    loadValue : function(component) {
        var config = component.get('v.config');
        component.find('name').set('v.value', config.name);
        component.find('vendor').set('v.value', config.vendor);
        component.find('accessToken').set('v.value', config.accessToken);
        component.find('active').set('v.value', config.active);
    },
    clearValues : function(component) {
        component.set('v.config', {
            vendor : "Wit",
            active : true,
            name : '',
            accessToken : ''
            });
        this.loadValue(component);
    },
})