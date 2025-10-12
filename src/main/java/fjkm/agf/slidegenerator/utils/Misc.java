package fjkm.agf.slidegenerator.utils;

import java.io.InputStream;

public class Misc {
    public static String currentLocation(String name) {
        ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
        return classLoader.getResource(name).getPath();
    }

    public static InputStream getResourceStream(String name) {
        ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
        return classLoader.getResourceAsStream(name);
    }

    public static InputStream getHiraStream(String jsonName) {
        return getResourceStream("hira/" + jsonName);
    }

    public static InputStream getLitorjiaStream(String jsonName) {
        return getResourceStream("litorjia/" + jsonName);
    }

    public static InputStream getImagesStream(String imageName) {
        return getResourceStream("images/" + imageName);
    }
}
