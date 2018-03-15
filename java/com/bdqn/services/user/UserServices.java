package com.bdqn.services.user;

import com.bdqn.entity.User;

/**
 * Created by Administrator on 2018/3/13.
 */
public interface UserServices {
    public User queryUserByUserName(String userName);
}
