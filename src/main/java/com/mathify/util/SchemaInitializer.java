package com.mathify.util;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * Applies the database schema on application startup.
 *
 * Reads {@code /sql/schema.sql} from the classpath and runs it as a single batch.
 * The script is written to be idempotent (every {@code CREATE} uses
 * {@code IF NOT EXISTS} and the seed insert is guarded), so it is safe to run on
 * every boot.
 */
public final class SchemaInitializer {

    private static final Logger log = LoggerFactory.getLogger(SchemaInitializer.class);
    private static final String SCHEMA_RESOURCE = "/sql/schema.sql";

    private SchemaInitializer() {}

    /** Loads and executes the schema script. Throws if the script cannot be applied. */
    public static void run() throws SQLException, IOException {
        String sql = readScript();
        try (Connection conn = DBConnection.getConnection();
             Statement st = conn.createStatement()) {
            // PostgreSQL's JDBC driver runs multiple ';'-separated statements in one execute().
            st.execute(sql);
            log.info("Database schema applied from {}", SCHEMA_RESOURCE);
        }
    }

    private static String readScript() throws IOException {
        try (InputStream in = SchemaInitializer.class.getResourceAsStream(SCHEMA_RESOURCE)) {
            if (in == null) {
                throw new IOException("Schema script not found on classpath: " + SCHEMA_RESOURCE);
            }
            return new String(in.readAllBytes(), StandardCharsets.UTF_8);
        }
    }
}
