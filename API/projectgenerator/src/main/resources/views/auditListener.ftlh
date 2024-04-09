package ${packageName}.config;

import java.time.LocalDateTime;

import ${packageName}.entity.Timestamps;

import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;

public class AuditListener {
	@PrePersist
    public void setCreatedOn(Auditable auditable) {
        Timestamps audit = auditable.getTimestamps();
 
        if(audit == null) {
            audit = new Timestamps();
            auditable.setTimestamps(audit);
        }
 
        audit.setCreatedOn(LocalDateTime.now());
        audit.setCreatedBy("test");
    }
 
    @PreUpdate
    public void setUpdatedOn(Auditable auditable) {
    	Timestamps audit = auditable.getTimestamps();
    	
    	 if(audit == null) {
             audit = new Timestamps();
             auditable.setTimestamps(audit);
         }
    	 
        audit.setLastUpdOn(LocalDateTime.now());
        audit.setLastUpdBy("test");
    }
}
