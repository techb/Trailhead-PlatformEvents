# Trailhead Module: Platform Events
[Module Home](https://trailhead.salesforce.com/en/content/learn/modules/platform_events_basics?trail_id=force_com_dev_intermediate)

Deliver custom notifications within the Salesforce platform and in external apps.

1. [Understand Event-Driven Software Architecture](https://trailhead.salesforce.com/en/content/learn/modules/platform_events_basics/platform_events_architecture?trail_id=force_com_dev_intermediate)
1. [Define and Publish Platform Events](https://trailhead.salesforce.com/en/content/learn/modules/platform_events_basics/platform_events_define_publish?trail_id=force_com_dev_intermediate)
1. [Subscribe to Platform Events](https://trailhead.salesforce.com/en/content/learn/modules/platform_events_basics/platform_events_subscribe?trail_id=force_com_dev_intermediate)

## Notes:
- You can publish more than one event by adding the event instance to a list. Then pass the list to `EventBus.publish()`
- For Process Builder or Flow's, select the event (shows up like a SF object/record) from Record Type, or Create Record
- Can publish events via the API
  - Endpoint: `/service/data/v40.0/sobjects/{Event_Object__e}/`
  - Sample POST body:
    ```
    {
        "Location__c" : "Mountain City",
        "Urgent__c" : true,
        "News_Content__c" : "Lake Road is closed due to mudslides."
    }
    ```
  - Sample Response:
    ```
    HTTP/1.1 201 Created
    {
        "id" : "e00xx000000000B",
        "success" : true,
        "errors" : [ ],
        "warnings" : [ ]
    }
    ```
- You can publish an event in SOAP API through the create() call or in Bulk API using batch jobs
- Use Triggers to subscribe to events. ***ONLY SUPPORTS `after insert`***
  - `trigger TriggerName on Custom_Event__e (after insert) {`
- Event triggers are run at System level and Asynchronously, and it's own execution process in Automated Process entity
- Can't see Event Triggers debug log in dev console