/**
 * Created by Deepu on 2/6/17.
 */
({
    doInit : function(component, event, helper) {
        helper.getChatBot(component);
    },
    checkKeyPress : function(component, event, helper) {
        if(!event.getParams().shiftKey && event.getParams().keyCode === 13){
            helper.addConversations(component, event.getSource().get('v.value'), false);
            helper.getBotResponse(component, event.getSource().get('v.value'));
            event.getSource().set('v.value', '');
        }
    }
})