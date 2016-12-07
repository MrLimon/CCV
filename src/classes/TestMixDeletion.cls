@isTest
private class TestMixDeletion {
/*т е если у нашей пластинки есть записи она не удаляется, а если нет то удаляется*/
    static testmethod void TestDeleteMixWithTracks() {
        // Create an invoice statement with a line item then try to delete it
        Mix__c mix = TestDataFactory.createOneMixStatement(true);
      // Test.startTest();
        Database.DeleteResult result = Database.delete(mix, false);//аботает не как обычный delete
        //Test.stopTest();

        // Verify invoice with a line item didn't get deleted. 
        System.assert(!result.isSuccess());
    }

    static testmethod void TestDeleteMixWithoutTracks() {
        // Create an invoice statement without a line item and try to delete it
        Mix__c mix = TestDataFactory.createOneMixStatement(false);
        Test.startTest();
        Database.DeleteResult result = Database.delete(mix, false);//аботает не как обычный delete
        Test.stopTest();

        // Verify invoice without line items got deleted. 
        System.assert(result.isSuccess());
    }

    static testmethod void TestBulkDeleteMixes() {
        // Create two invoice statements, one with and one with out line items
        // Then try to delete them both in a bulk operation, as might happen
        // when a trigger fires.
        List<Mix__c> mixList = new List<Mix__c>();
        invList.add(TestDataFactory.createOneMixStatement(true));
        invList.add(TestDataFactory.createOneMixStatement(false));
        Test.startTest();
        Database.DeleteResult[] results = Database.delete(mixList, false);
        Test.stopTest();

        // Verify the invoice with the line item didn't get deleted
        System.assert(!results[0].isSuccess());

        // Verity the invoice without line items did get deleted.
        System.assert(results[1].isSuccess());
    }
}
