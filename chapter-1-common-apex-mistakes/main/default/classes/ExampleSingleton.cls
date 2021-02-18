public class ExampleSingleton {
	
    private static ExampleSingleton instance;
    private Example__mdt metadata;
    
    public static ExampleSingleton getInstance() {
        if(instance == null) {
            instance = new ExampleSingleton();
        }
        return instance;
    }
    
    private ExampleSingleton() {
    }
    
    public Example__mdt getMetadata() {
        if(metadata == null) {
            metadata = [SELECT Id FROM Example__mdt LIMIT 1];
        }
        return metadata;
    }
    
}