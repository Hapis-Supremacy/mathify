package com.mathify.util;

import com.midtrans.Config;
import com.midtrans.service.MidtransCoreApi;
import com.midtrans.service.MidtransSnapApi;
import com.midtrans.service.impl.MidtransCoreApiImpl;
import com.midtrans.service.impl.MidtransSnapApiImpl;

/**
 * Central access point for the Midtrans SDK.
 *
 * <p>Reads keys and the environment toggle from environment variables once, then
 * exposes a shared {@link Config} plus the Snap (token creation) and Core
 * (server-side status check) clients. The environment is <strong>Sandbox by
 * default</strong>; set {@code MIDTRANS_IS_PRODUCTION=true} to go live.
 *
 * Required env: {@code MIDTRANS_SERVER_KEY}, {@code MIDTRANS_CLIENT_KEY}.
 */
public final class MidtransService {

    private static final boolean IS_PRODUCTION =
            Boolean.parseBoolean(trim(System.getenv("MIDTRANS_IS_PRODUCTION")));

    private static final String CLIENT_KEY = trim(System.getenv("MIDTRANS_CLIENT_KEY"));

    private static final Config CONFIG = Config.builder()
            .setServerKey(trim(System.getenv("MIDTRANS_SERVER_KEY")))
            .setClientKey(CLIENT_KEY)
            .setIsProduction(IS_PRODUCTION)
            .build();

    private static final MidtransSnapApi SNAP_API = new MidtransSnapApiImpl(CONFIG);
    private static final MidtransCoreApi CORE_API = new MidtransCoreApiImpl(CONFIG);

    private MidtransService() {}

    /** Creates Snap transaction tokens for the checkout page. */
    public static MidtransSnapApi snapApi() {
        return SNAP_API;
    }

    /** Used to verify a transaction's real status server-side before granting premium. */
    public static MidtransCoreApi coreApi() {
        return CORE_API;
    }

    /** Public client key, embedded in the checkout page to load the matching Snap script. */
    public static String clientKey() {
        return CLIENT_KEY;
    }

    /** True when running against Midtrans production; drives which Snap script URL is loaded. */
    public static boolean isProduction() {
        return IS_PRODUCTION;
    }

    private static String trim(String value) {
        return value != null ? value.trim() : "";
    }
}
