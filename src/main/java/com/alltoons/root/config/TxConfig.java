package com.alltoons.root.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.zaxxer.hikari.HikariDataSource;

@Configuration
@EnableTransactionManagement
public class TxConfig {
	@Autowired
	HikariDataSource dataSource;

	@Bean
	public PlatformTransactionManager transactionManager() {
		DataSourceTransactionManager txMgr = new DataSourceTransactionManager();
		txMgr.setDataSource(dataSource);
		return txMgr;
	}

}
