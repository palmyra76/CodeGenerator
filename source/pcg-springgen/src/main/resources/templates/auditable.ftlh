package ${packageName}.config;

import ${packageName}.entity.Timestamps;

import jakarta.persistence.EntityListeners;

@EntityListeners(AuditListener.class)
public interface Auditable {
	Timestamps getTimestamps();
	
	void setTimestamps(Timestamps t);
}