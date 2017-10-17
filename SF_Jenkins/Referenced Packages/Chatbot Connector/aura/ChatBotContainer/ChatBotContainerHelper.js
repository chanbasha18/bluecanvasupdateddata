/**
 * Created by Deepu on 2/6/17.
 */
({
    getBotResponse : function(component, message) {
        var self = this;
        var action = component.get("c.getBotResponse");
        action.setParams({
            question : message,
            config : JSON.stringify(component.get('v.botObject'))
            });
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
                self.addConversations(component, response.getReturnValue(), true);
            }
        });
        $A.enqueueAction(action);
    },
    addConversations : function(component, message, isBot) {
        var conversations = component.get('v.conversationList');
        var conv = {
               conversation : message,
               isBot : isBot
           };
        conversations.push(conv);
        component.set('v.conversationList', conversations);
        $A.util.toggleClass(component.find('loadingDiv'), 'slds-hide');
    },
    getChatBot : function(component, event, helper) {
        var self = this;
        var action = component.get("c.getChatBot");
        action.setParams({botId : component.get('v.bot')});
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
                component.set('v.botObject', response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    }
})