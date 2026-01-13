package stubInvocation;

import java.util.Map;

public class L {
    public String method3(Map<String, String> map) {
        map.put("Hello", "World");
        return map.get("Hello");
    }
}
