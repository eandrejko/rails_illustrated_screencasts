// from http://groups.google.com/group/prototype-scriptaculous/browse_thread/thread/badf3974a0dd5ac6
function bubbledFromChild(element, event)  {
  var target = $(event).element();
  if (target === element) target = event.relatedTarget;
  return (target && target.descendantOf(element));
}

Event.addBehavior({
  ".contact-name:mouseover" : function(e){
    if(!bubbledFromChild(this,e)){
      var id = $(this).readAttribute("id").match(/[0-9]+$/)[0];
      var container = $(this).up(".contact-group");
      $$(".contact").each( function(e) {
        e.hide();
      });
      if($(container).down("#contact-"+id)){
        // $("contact-"+id).show();
        new Effect.Appear("contact-"+id, {queue: 'end', duration: 0.7})
      }else{
        if(Ajax.activeRequestCount == 0){
          var url = $(this).down("a").readAttribute("href");
          new Ajax.Request(url,{
            method: 'get',
            onSuccess: function(xhr){
              container.insert({bottom: xhr.responseText});
            }});
        }
      }      
    }
  },
  
  ".contact-name:mouseout" : function(e){
    if(!bubbledFromChild(this,e)){
      $$(".contact").each( function(e) {
        e.hide();
      });      
    }
  }
})