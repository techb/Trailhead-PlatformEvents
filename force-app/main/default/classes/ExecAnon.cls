public with sharing class ExecAnon {
    public static void fireEvent(){
        // Create an instance of the event and store it in the newsEvent variable
        Cloud_News__e newsEvent = new Cloud_News__e(
            Location__c='Mountain City',
            Urgent__c=true,
            News_Content__c='Lake Road is closed due to mudslides.'
        );
        // Call method to publish events
        // To publish more than one event, add them to a list and pass the
        // list to EventBus.publish()
        Database.SaveResult sr = EventBus.publish(newsEvent);
        // Inspect publishing result
        if (sr.isSuccess()){
            System.debug('Successfully published event.');
        }else{
            for(Database.Error err : sr.getErrors()) {
                System.debug('Error returned: ' + err.getStatusCode() + ' - ' + err.getMessage());
            }
        }
    }
}
