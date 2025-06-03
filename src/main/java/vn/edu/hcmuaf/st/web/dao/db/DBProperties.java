package vn.edu.hcmuaf.st.web.dao.db;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class DBProperties {
    private static Properties prop = new Properties();

    static {
        try (InputStream in = DBProperties.class.getClassLoader().getResourceAsStream("db.properties")) {
            if (in != null) {
                prop.load(in);
            } else {
                System.err.println("Không tìm thấy file db.properties");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private static String getEnvOrProp(String envKey, String propKey) {
        String envVal = System.getenv(envKey);
        if (envVal != null && !envVal.isEmpty()) {
            return envVal;
        }
        return prop.getProperty(propKey);
    }

    public static String host() {
        return getEnvOrProp("DB_HOST", "db.host");
    }

    public static int port() {
        String portStr = getEnvOrProp("DB_PORT", "db.port");
        try {
            return Integer.parseInt(portStr);
        } catch (NumberFormatException e) {
            return 3306; // default port
        }
    }

    public static String username() {
        return getEnvOrProp("DB_USER", "db.username");
    }

    public static String password() {
        return getEnvOrProp("DB_PASS", "db.password");
    }

    public static String dbname() {
        return getEnvOrProp("DB_NAME", "db.dbname");
    }

    public static String option() {
        return getEnvOrProp("DB_OPTION", "db.option");
    }
}
