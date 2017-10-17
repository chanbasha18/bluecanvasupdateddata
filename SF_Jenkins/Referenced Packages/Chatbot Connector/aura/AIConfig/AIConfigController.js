/**
 * Created by Deepu on 2/1/17.
 */
({
    doInit : function(component, event, helper) {
        helper.retrieveAllSettings(component);
    },
    toggleModal : function(component, event, helper) {
        helper.toggleModal(component);
    },
    fieldChangeEvent : function(component, event, helper) {
        var config = component.get('v.config');
        config[event.getSource().getLocalId()] = event.getSource().get('v.value');
        component.set('v.config', config);
    },
    save : function(component, event, helper) {
        helper.save(component);
    },
    addNew : function(component, event, helper) {
        helper.clearValues(component);
        helper.toggleModal(component);
    },
    handleUpdateEvent : function(component, event, helper) {
        helper.loadValues(component, event.getParam('configId'));
        helper.toggleModal(component);
    }
})