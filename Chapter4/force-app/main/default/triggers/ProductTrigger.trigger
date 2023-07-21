trigger ProductTrigger on Product__c (before insert, before update, after insert, after update)
{
    if (trigger.isBefore)
    {
        if (trigger.isInsert)
        {
            //before insert logic
        }
        else if (trigger.isUpdate)
        {
            //before update logic
        }
    }
    else if (trigger.isAfter)
    {
        if(trigger.isInsert)
        {
            //after insert logic
        }
        else if (trigger.isUpdate)
        {
            //after update logic
        }
    }
}