public with sharing class ProductTriggerHandler
{
    public static void beforeInsert(List<Product__c> products)
    {
        Decimal total = 0.0;
        for(Product__c prod : products)
        {
            total += prod.Price__c;
        }
        System.debug(total);
    }
}