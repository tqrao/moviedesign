package cn.movie.servlet;

import cn.movie.beans.Account;
import cn.movie.dao.IAccountDao;
import cn.movie.dao.IUserDao;
import cn.movie.dao.impl.AccountDao;
import cn.movie.dao.impl.UserDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;

public class RechargeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String user_name=request.getParameter("user_name");
        String account=request.getParameter("account");
        String pswd=request.getParameter("pswd");
        String type =request.getParameter("radio1");
        String number =request.getParameter("number");
        BigDecimal num=new BigDecimal(number);

        IAccountDao accDao=new AccountDao();
        Account acc = new Account();
        acc.setName(account);
        acc.setPswd(pswd);
        acc.setType(type);
        String error="";
        if(accDao.accCorrect(acc)) {

            if(accDao.deduct(acc,num)){
                IUserDao userDao=new UserDao();
                userDao.addMoney(user_name,num);
                error="Recharge Succeed";
            }
            else{
                error="Recharge failed";

            }

        }
        else{
            error="Recharge failed";
        }

        response.sendRedirect(request.getContextPath()+"/jsp/detailuser.jsp?username="+user_name+"&error="+error);

    }


}
