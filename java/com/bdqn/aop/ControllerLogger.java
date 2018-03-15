package com.bdqn.aop;

import org.aspectj.lang.JoinPoint;

import java.util.Arrays;
import java.util.logging.Logger;

/**
 * Created by Administrator on 2018/3/13.
 */
public class ControllerLogger {
    public static final Logger logger=Logger.getLogger("ControllerLogger");
    public void before(JoinPoint jp){
        logger.info(">>>>>>>>>>调用了:"+jp.getTarget()+"的"+jp.getSignature().getName()+"方法,方法入参:"+ Arrays.toString(jp.getArgs()));
    }
    public void after(JoinPoint jp,Object result){
        logger.info(">>>>>>>>>>调用了:"+jp.getTarget()+"的"+jp.getSignature().getName()+"方法,方法返回:"+result);
    }
}
