/**
 * Created by Deepu on 2/6/17.
 */
({
    rerender : function(component, helper){
        this.superRerender();
        var elmnt = document.getElementById("chatBody");
        elmnt.scrollTop = elmnt.scrollHeight;
    }
})