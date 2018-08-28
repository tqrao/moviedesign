package cn.movie.dao;

import cn.movie.beans.Account;

import java.math.BigDecimal;

public interface IAccountDao {
    boolean accCorrect(Account acc);

    boolean deduct(Account acc, BigDecimal num);
}
