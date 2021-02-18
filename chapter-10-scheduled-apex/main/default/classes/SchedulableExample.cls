public class SchedulableExample implements Schedulable {
    public void execute(SchedulableContext SC) {
         Account a = new Account();
         a.Name = String.valueOf(DateTime.now());
         insert a;
    }
}