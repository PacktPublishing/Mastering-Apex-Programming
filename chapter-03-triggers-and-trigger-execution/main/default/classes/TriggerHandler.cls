public virtual class TriggerHandler {
	protected virtual void handleBeforeInsert() {}
	protected virtual void handleAfterInsert() {}
	protected virtual void handleBeforeUpdate() {}
	protected virtual void handleAfterUpdate() {}
	protected virtual void handleBeforeDelete() {}
	protected virtual void handleAfterDelete() {}
	protected virtual void handleAfterUndelete() {}

	@TestVisible
	private Context triggerContext;

	public void execute() {
        String className = String.valueOf(this).split(':')[0];
    
        if(TriggerExecutionMediator.getInstance().shouldBypass(className)){
            return;
        }
        
        if(!TriggerExecutionMediator.getInstance().shouldExecute(className)) {
            return;
        }
    
		setContext();
		switch on this.triggerContext {
        	when BEFORE_INSERT {
            	this.handleBeforeInsert();
    	    }
            when AFTER_INSERT {
            	this.handleAfterInsert();
    	    }
            when BEFORE_UPDATE {
            	this.handleBeforeUpdate();
    	    }
        	when AFTER_UPDATE {
				this.handleAfterUpdate();
   	    	}
            when BEFORE_DELETE {
            	this.handleBeforeDelete();
    	    }
            when AFTER_DELETE {
            	this.handleAfterDelete();
    	    }
            when AFTER_UNDELETE {
            	this.handleAfterUndelete();
    	    }
    	}
	}

	private void setContext() {
		if(this.triggerContext == null) {
			switch on Trigger.operationType {
	        	when BEFORE_INSERT {
	            	this.triggerContext = Context.BEFORE_INSERT;
	    	    }
	            when AFTER_INSERT {
	            	this.triggerContext = Context.AFTER_INSERT;
	    	    }
	            when BEFORE_UPDATE {
	            	this.triggerContext = Context.BEFORE_UPDATE;
	    	    }
	        	when AFTER_UPDATE {
					this.triggerContext = Context.AFTER_UPDATE;
	   	    	}
	            when BEFORE_DELETE {
	            	this.triggerContext = Context.BEFORE_DELETE;
	    	    }
	            when AFTER_DELETE {
	            	this.triggerContext = Context.AFTER_DELETE;
	    	    }
	            when AFTER_UNDELETE {
	            	this.triggerContext = Context.AFTER_UNDELETE;
	    	    }
	    	}
		}
	}

	@TestVisible
	private enum Context {
        BEFORE_INSERT, BEFORE_UPDATE, BEFORE_DELETE,
        AFTER_INSERT, AFTER_UPDATE, AFTER_DELETE,
        AFTER_UNDELETE
    }
}
