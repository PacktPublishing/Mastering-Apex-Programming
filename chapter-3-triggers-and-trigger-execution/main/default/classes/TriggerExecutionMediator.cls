public class TriggerExecutionMediator {
	
    private static TriggerExecutionMediator instance;

    private Set<String> bypass;
	private Map<String, Integer> maxCounts;
	private Map<String, Integer> currentCounts;
    
    public static TriggerExecutionMediator getInstance() {
        if(instance == null) {
            instance = new TriggerExecutionMediator();
        }
        return instance;
    }
    
    public void addBypass(String handlerName) {
		bypass.add(handlerName);
	}

	public void clearBypass(String handlerName) {
		bypass.remove(handlerName);
	}

	public Boolean shouldBypass(String handlerName) {
		return bypass.contains(handlerName);
	}

	public void setMaxCount(String handlerName, Integer max) {
		maxCounts.put(handlerName, max);
		currentCounts.put(handlerName, 0);
	}

	public Boolean shouldExecute(String handlerName) {
		//return true if no max set
		if(!maxCounts.containsKey(handlerName)) {
			return true;
		}
	
		//if max not yet reached, increment count and return true
		if(currentCounts.get(handlerName) != maxCounts.get(handlerName)) {
			currentCounts.put(handlerName, currentCounts.get(handlerName) + 1);
			return true;
		}
		
		//otherwise return false
		return false;
	}
    
}