/**
 * Created by Deepu on 2/1/17.
 */
({
    handleDevice : function(component) {
        component.set('v.showModal', ($A.get("$Browser.isPhone") || $A.get("$Browser.isTablet")));
        $A.createComponent('nfbot:ChatBotContainer', {
            bot : component.get('v.bot')
        },
        function(cmp) {
            if (component.get('v.showModal')) {
                component.find('modalContainer').set('v.body' ,[cmp]);
            } else {
                var body = component.find('chatContainer').get('v.body');
                body.push(cmp);
                component.find('chatContainer').set('v.body' ,body);
            }
        });
    },
    toggleChat : function(component) {
        $A.util.toggleClass(component.find('openButtonIcon'), 'slds-hide');
        if (component.get('v.showModal')) {
            $A.util.toggleClass(component.find('chatModalBackdrop'), 'slds-backdrop--open');
            $A.util.toggleClass(component.find('chatModel'), 'slds-fade-in-open');
        } else {
            $A.util.toggleClass(component.find('chatContainer'), 'slds-is-open');
            $A.util.toggleClass(component.find('chatContainer'), 'slds-hide');
        }
    }
})