import cn.hutool.crypto.SecureUtil;
import org.junit.Test;

/**
 * Company :  北京动力节点
 * Author :   Andy
 * Date : 2021/1/9
 * Description :
 */
public class TestBlog {

    @Test
    public void test01(){
        String password = SecureUtil.md5("admin");
        System.out.println(password);
    }
}
