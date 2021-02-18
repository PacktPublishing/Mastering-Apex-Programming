public with sharing class ViewStateController {
    public transient String transientString { get; set; }
    public String nonTransientString { get; set; }

    public ViewStateController() {
        transientString = 'This is a transient string';
        nonTransientString = 'This is a non-transient string';
    }

    public PageReference refresh() {
        return null;
    }
}
