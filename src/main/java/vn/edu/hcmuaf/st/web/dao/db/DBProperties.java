package vn.edu.hcmuaf.st.web.dao.db;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class DBProperties {
    public static String host() {
        String env = System.getenv("DB_HOST");
        return (env != null) ? env : "localhost";
    }

    public static int port() {
        String env = System.getenv("DB_PORT");
        try {
            return (env != null) ? Integer.parseInt(env) : 3306;
        } catch (NumberFormatException e) {
            return 3306;
        }
    }

    public static String username() {
        String env = System.getenv("DB_USERNAME");
        return (env != null) ? env : "root";
    }

    public static String password() {
        String env = System.getenv("DB_PASSWORD");
        return (env != null) ? env : "";
    }

    public static String dbname() {
        String env = System.getenv("DB_NAME");
        return (env != null) ? env : "project_web";
    }

    public static String option() {
        return "useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
    }
}

