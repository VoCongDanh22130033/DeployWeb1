package vn.edu.hcmuaf.st.web.dao.db;

import com.mysql.cj.jdbc.MysqlDataSource;
import org.jdbi.v3.core.Jdbi;

import java.sql.SQLException;

public class JDBIConnect {

    static Jdbi jdbi;

    // Hàm tạo url mỗi lần gọi
    private static String getUrl() {
        return "jdbc:mysql://" + DBProperties.host() + ":" + DBProperties.port() + "/" + DBProperties.dbname() + "?" + DBProperties.option();
    }

    public static Jdbi get() {
        if (jdbi == null) {
            try {
                makeConnect();
                System.out.println("Kết nối cơ sở dữ liệu thành công.");
            } catch (RuntimeException e) {
                System.err.println("Kết nối cơ sở dữ liệu thất bại: " + e.getMessage());
            }
        }
        return jdbi;
    }

    private static void makeConnect() throws RuntimeException {
        String url = getUrl();
        String user = DBProperties.username();
        String pass = DBProperties.password();
        System.out.println("Connecting to DB with URL: " + url);
        System.out.println("DB User: " + user);
        // Don't print password for bảo mật

        MysqlDataSource src = new MysqlDataSource();
        src.setURL(url);
        src.setUser(user);
        src.setPassword(pass);

        try {
            src.setUseCompression(true);
            src.setAutoReconnect(true);
        } catch (SQLException e) {
            throw new RuntimeException("Lỗi thiết lập cấu hình kết nối: " + e.getMessage());
        }

        jdbi = Jdbi.create(src);
    }


    public static void main(String[] args) {
        System.out.println("HOST: " + DBProperties.host());
        System.out.println("PORT: " + DBProperties.port());
        System.out.println("USER: " + DBProperties.username());
        System.out.println("PASS: " + DBProperties.password());
        System.out.println("DBNAME: " + DBProperties.dbname());
        System.out.println("OPTION: " + DBProperties.option());

        Jdbi j = get();
    }

}