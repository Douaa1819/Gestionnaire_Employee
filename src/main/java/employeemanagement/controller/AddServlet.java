package employeemanagement.controller;

import java.io.IOException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.PrintWriter;


public class AddServlet extends HttpServlet {


    public void doGet(HttpServletRequest request, HttpServletResponse response)
    {
String name = request.getParameter("name");
request.setAttribute( "name",name);
    }


    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws  IOException {

        String firstNumber = request.getParameter("firstNumber");
        String secondNumber = request.getParameter("secondNumber");

        int num1 = Integer.parseInt(firstNumber);
        int num2 = Integer.parseInt(secondNumber);

        int sum = num1 + num2;


        response.setContentType("text/html");
        PrintWriter out = response.getWriter();


        out.println("<html><body>");
        out.println("<h2>Résultat de l'addition:</h2>");
        out.println("<p>" + num1 + " + " + num2 + " = " + sum + "</p>");
        out.println("</body></html>");
    }


}


