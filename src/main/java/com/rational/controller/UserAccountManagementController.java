package com.rational.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by Peter Varner-Howland on 2/25/2016.
 */
@Controller
public class UserAccountManagementController {
    public static final String UAM = "uam";

    @RequestMapping
    public ModelAndView getCharacterList(final ModelAndView mav){
        mav.setViewName(UAM);
        return mav;
    }
}
