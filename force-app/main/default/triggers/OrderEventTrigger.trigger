trigger OrderEventTrigger on Order_Event__e (after insert) {
    List<Task> insert_me = new List<Task>();
    for(Order_Event__e event: Trigger.new){
        if(event.Has_Shipped__c == true){
            Task t = new Task();
            t.Priority = 'Medium';
            t.Subject = 'Follow up on shipped order '+event.Order_Number__c;
            t.OwnerId = event.CreatedById;
            insert_me.add(t);
        }
    }

    insert insert_me;
}