/*
 * This Java source file was generated by the Gradle 'init' task.
 */
package firebase_auth_app.app;

import firebase_auth_app.list.LinkedList;

import static firebase_auth_app.utilities.StringUtils.join;
import static firebase_auth_app.utilities.StringUtils.split;
import static firebase_auth_app.app.MessageUtils.getMessage;

import org.apache.commons.text.WordUtils;

public class App {
    public static void main(String[] args) {
        LinkedList tokens;
        tokens = split(getMessage());
        String result = join(tokens);
        System.out.println(WordUtils.capitalize(result));
    }
}
