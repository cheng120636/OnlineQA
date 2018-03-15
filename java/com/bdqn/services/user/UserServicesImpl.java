package com.bdqn.services.user;

import com.bdqn.dao.user.UserMapper;
import com.bdqn.entity.User;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by Administrator on 2018/3/13.
 */
@Service
public class UserServicesImpl implements UserServices {
    @Resource
    private UserMapper userMapper;
    @Override
    public User queryUserByUserName(String userName) {
        return userMapper.queryUserByUserName(userName);
    }
}
