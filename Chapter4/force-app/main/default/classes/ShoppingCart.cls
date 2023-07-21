public with sharing class ShoppingCart
{
    public static Decimal calculateTotal(List<Product__c> products)
    {
        Decimal total = 0;
        if (products != null)
        {
            for (Product__c p : products)
            {
                if (p.Price__c != null)
                {
                    total += p.Price__c;
                }
            }
        }
        return total;
    }
}