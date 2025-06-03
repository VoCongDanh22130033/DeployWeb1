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
        MysqlDataSource src = new MysqlDataSource();
        src.setURL(getUrl());
        src.setUser(DBProperties.username());
        src.setPassword(DBProperties.password());

        try {
            src.setUseCompression(true);
            src.setAutoReconnect(true);
        } catch (SQLException e) {
            throw new RuntimeException("Lỗi thiết lập cấu hình kết nối: " + e.getMessage());
        }

        jdbi = Jdbi.create(src);
    }

    public static void main(String[] args) {
        Jdbi j = get();
    }
}
