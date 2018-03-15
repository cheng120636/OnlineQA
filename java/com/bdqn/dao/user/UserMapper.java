package com.bdqn.dao.user;

import com.bdqn.entity.User;

/**
 * Created by Administrator on 2018/3/13.
 */
public interface UserMapper {
    public User queryUserByUserName(String userName);
}
