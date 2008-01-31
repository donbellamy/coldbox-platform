<?xml version="1.0" encoding="UTF-8"?>
<beans default-autowire="byName">
    
    <!--ColdBox Datasource Bean, created by the config structure's dsn alias
	DEPRECATED FOR COLDSPRING 1.2
    <bean id="datasourceBean" class="coldbox.system.beans.datasourceBean">
        <property name="name"><value>${Datasources.coldboxreader.name}</value></property>
        <property name="DBType"><value>${Datasources.coldboxreader.DBTYPE}</value></property>
        <property name="Username"><value>${Datasources.coldboxreader.Username}</value></property>
        <property name="Password"><value>${Datasources.coldboxreader.Password}</value></property>
    </bean>
	
	-->
	
	<!-- ColdBox Related Beans -->
	<bean id="ColdboxFactory" class="coldbox.system.extras.ColdboxFactory" autowire="no" />
    <bean id="datasourceBean" factory-bean="ColdBoxFactory" factory-method="getDatasource">
		<constructor-arg name="alias">
			<value>coldboxreader</value>
		</constructor-arg>
	</bean>
    
    <bean id="feedDAO"
        class="coldbox.samples.applications.ColdBoxReader.components.dao.feed" singleton="false">
        <constructor-arg name="dsnBean">
            <ref bean="datasourceBean"/>
        </constructor-arg>
    </bean>
    
    <bean id="feedService"
        class="coldbox.samples.applications.ColdBoxReader.components.services.feedService" singleton="true">
        <constructor-arg name="feedDAO">
            <ref bean="feedDAO"/>
        </constructor-arg>
        <constructor-arg name="ModelBasePath">
            <value>${ModelBasePath}</value>
        </constructor-arg>
    </bean>
    
    <bean id="tagDAO"
        class="coldbox.samples.applications.ColdBoxReader.components.dao.tags" singleton="false">
        <constructor-arg name="dsnBean">
            <ref bean="datasourceBean"/>
        </constructor-arg>
    </bean>
    
    <bean id="tagService"
        class="coldbox.samples.applications.ColdBoxReader.components.services.tagService" singleton="true">
        <constructor-arg name="tagDAO">
            <ref bean="tagDAO"/>
        </constructor-arg>
        <constructor-arg name="ModelBasePath">
            <value>${ModelBasePath}</value>
        </constructor-arg>
    </bean>
    
    <bean id="usersDAO"
        class="coldbox.samples.applications.ColdBoxReader.components.dao.users" singleton="false">
        <constructor-arg name="dsnBean">
            <ref bean="datasourceBean"/>
        </constructor-arg>
    </bean>
    
    <bean id="userBean"
        class="coldbox.samples.applications.ColdBoxReader.components.beans.userBean" singleton="false">
    </bean>
    
    <bean id="userService"
        class="coldbox.samples.applications.ColdBoxReader.components.services.userService" singleton="true">
        <constructor-arg name="usersDAO">
            <ref bean="usersDAO"/>
        </constructor-arg>
        <constructor-arg name="ModelBasePath">
            <value>${ModelBasePath}</value>
        </constructor-arg>
    </bean>
    
</beans>