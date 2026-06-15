package com.mathify.util;

import com.midtrans.Config;
import com.midtrans.service.MidtransCoreApi;
import com.midtrans.service.MidtransSnapApi;
import com.midtrans.service.impl.MidtransCoreApiImpl;
import com.midtrans.service.impl.MidtransSnapApiImpl;

/**
 * Central access point for the Midtrans SDK.
 *
 * Reads keys and the environment toggle from environment variables once,
 * builds a {@link Config} and provides shared Snap and Core API clients.
 * The default environment is sandbox (MIDTRANS_IS_PRODUCTION defaults to false).
 * Set MIDTRANS_IS_PRODUCTION=true to use the live environment.
 *
 * Required env: MIDTRANS_SERVER_KEY, MIDTRANS_CLIENT_KEY.
 */
public final class MidtransService {

    private static final boolean IS_PRODUCTION =
            Boolean.parseBoolean(trim(System.getenv("MIDTRANS_IS_PRODUCTION")));

    private static final Config CONFIG;
    static {
        String serverKey = trim(System.getenv("MIDTRANS_SERVER_KEY"));
        String clientKey = trim(System.getenv("MIDTRANS_CLIENT_KEY"));
        if (serverKey.isEmpty() || clientKey.isEmpty()) {
            throw new IllegalStateException("Midtrans SERVER_KEY and CLIENT_KEY must be set in environment variables.");
        }
        CONFIG = Config.builder()
                .setServerKey(serverKey)
                .setClientKey(clientKey)
                .setIsProduction(IS_PRODUCTION)
                .build();
    }

    private static final String CLIENT_KEY = CONFIG.getClientKey();
    private static final MidtransSnapApi SNAP_API = new MidtransSnapApiImpl(CONFIG);
    private static final MidtransCoreApi CORE_API = new MidtransCoreApiImpl(CONFIG);

    private MidtransService() {}

    public static MidtransSnapApi snapApi() {
        return SNAP_API;
    }

    public static MidtransCoreApi coreApi() {
        return CORE_API;
    }

    public static String clientKey() {
        return CLIENT_KEY;
    }

    public static boolean isProduction() {
        return IS_PRODUCTION;
    }

    private static String trim(String value) {
        return value != null ? value.trim() : "";
    }
}
