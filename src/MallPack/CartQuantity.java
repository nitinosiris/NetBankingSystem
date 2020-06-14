package MallPack;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import static common.DButilsCart.getCart;

@WebServlet(name = "CartQuantity")
public class CartQuantity extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession sess=request.getSession();
        if(sess!=null)
        {
            String Username=sess.getAttribute('uname');
            ArrayList<Product> List=getCart(Username);
            int size=List.size();
            PrintWriter out=response.getWriter();
            out.println(size);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
