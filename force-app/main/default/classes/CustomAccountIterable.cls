public with sharing class CustomAccountIterable implements Iterable<Account> {
	private CustomAccountIterator iterator;
	
	public CustomAccountIterable(Id accountId) {
		iterator = new CustomAccountIterator(accountId);
	}

	public Iterator<Account> iterator() {
		return iterator;
	}
}