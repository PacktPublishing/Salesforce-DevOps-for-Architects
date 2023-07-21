@isTest
private class ShoppingCartTest {
    @isTest
    static void SingleProduct() {
        // Create a single product
        Product__c p = new Product__c(Description__c='Product A', Price__c=100);
        insert p;

        // Calculate the total price
        Decimal total = ShoppingCart.calculateTotal(new List<Product__c>{p});

        // Verify that the total is correct
        Assert.areEqual(100, total, 'Total should be 100');
    }

    @isTest
    static void testMultipleProducts() {
        // Create multiple products
        List<Product__c> products = new List<Product__c>{
            new Product__c(Description__c='Product A', Price__c=100),
            new Product__c(Description__c='Product B', Price__c=50)
        };
        insert products;

        // Calculate the total price
        Decimal total = ShoppingCart.calculateTotal(products);

        // Verify that the total is correct
        Assert.areEqual(150, total, 'Total should be 150');
    }

    @isTest
    static void testNullProducts() {
        // Calculate the total price with null products
        Decimal total = ShoppingCart.calculateTotal(null);

        // Verify that the total is zero
        Assert.areEqual(0, total, 'Total should be 0');
    }

    @isTest
    static void testProductsWithoutPrice() {
        // Create a product without a price
        Product__c p = new Product__c(Description__c='Product A');
        insert p;

        // Calculate the total price
        Decimal total = ShoppingCart.calculateTotal(new List<Product__c>{p});

        // Verify that the total is zero
        Assert.areEqual(0, total, 'Total should be 0');
    }
}