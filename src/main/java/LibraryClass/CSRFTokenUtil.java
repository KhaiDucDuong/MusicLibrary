/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package LibraryClass;
import java.security.SecureRandom;
import java.math.BigInteger;
/**
 *
 * @author dell
 */
public class CSRFTokenUtil {
    public static String generateCSRFToken() {
        SecureRandom random = new SecureRandom();
        byte[] token = new byte[32];
        random.nextBytes(token);
        return new BigInteger(1, token).toString(16); // Chuyển đổi thành chuỗi hex
    }
}
