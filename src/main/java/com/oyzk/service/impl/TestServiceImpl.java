package com.oyzk.service.impl;

import com.oyzk.service.TestService;
import org.springframework.stereotype.Service;

/**
 * @author Kingkang
 * @title TestServiceImpl
 * @create 2022/11/28
 **/
@Service
public class TestServiceImpl implements TestService {
    public String test() {
        return "testSpring";
    }
}
