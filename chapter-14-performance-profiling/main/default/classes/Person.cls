public class Person {
    public String name {get; set;}
    public Integer age {get; set;}
    private String hiddenData = 'some hidden data';

    public Person(String name, Integer age) {
        this.name = name;
        this.age = age;
    }

    public void logMe() {
        Logger.logWithState(null, 'Logging out my person', 'Log', this);
    }
}