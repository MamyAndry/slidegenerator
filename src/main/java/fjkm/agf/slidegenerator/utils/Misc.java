package fjkm.agf.slidegenerator.utils;

import java.io.File;

public class Misc {
    public static String currentLocation(String name) {
        ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
        return classLoader.getResource(name).getPath();
    }

    public static String tabulate(String string){
        string = "\t" + string;
        return string.replace("\n", "\n\t");
    }

    public static String getTemplateLocation(){
        return currentLocation("template");
    }

    public static String getSourceTemplateLocation(){
        return getTemplateLocation() + File.separator + "sourceCode";
    }

    public static String getViewTemplateLocation(){
        return getTemplateLocation() + File.separator + "view";
    }

    public static String getConfigLocation(){
        return currentLocation("conf");
    }

    public static String getConnectionConfLocation(){
        String separator = File.separator;
        return getConfigLocation() + separator + "connection";
    }

    public static String getGeneratorConfLocation(){
        String separator = File.separator;
        return getConfigLocation() + separator + "generator";
    }

    public static String getHiraLocation(){
        return currentLocation("hira");
    }

    public static String getLitorjiaLocation(){
        return currentLocation("litorjia");
    }

    public static String getImagesLocation(){
        return currentLocation("images");
    }
}
