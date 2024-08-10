package com.example.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.SQLException;

@SpringBootApplication
public class DemoApplication {

    public static void main(String[] args) {
        ApplicationContext context = SpringApplication.run(DemoApplication.class, args);

        DataSource dataSource = context.getBean(DataSource.class);

        boolean isConnected = testConnection(dataSource);
        System.out.println(isConnected ? "Connection successful!" : "Connection failed!");
    }

    private static boolean testConnection(DataSource dataSource) {
        try (Connection connection = dataSource.getConnection()) {
            return connection.isValid(2); // Timeout in seconds
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}