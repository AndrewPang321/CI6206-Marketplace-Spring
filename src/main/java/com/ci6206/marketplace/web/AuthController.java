package com.ci6206.marketplace.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class AuthController {

    @RequestMapping("/auth")
    public String auth() {
        return "login";
    }

    @PostMapping("/login")
    public String login(@RequestParam(name="loginEmail") String email, @RequestParam(name="loginPassword") String password,
            RedirectAttributes redirectAttributes) {
        System.out.println(email);
        System.out.println(password);
        if (!"".equals(email) && !"".equals(password)) {
            // TODO: Successful authentication with DB
            Boolean success = true;
            if (success) {
                // Authentication success, 200: Success
                return "redirect:/";
            } else {
                // Authentication fail, 400: Bad Request
                redirectAttributes.addFlashAttribute("display", "show");
                redirectAttributes.addFlashAttribute("msg", "Incorrect Email/Password");
                return "redirect:/auth";
            }
        }
        redirectAttributes.addFlashAttribute("display", "show");
        redirectAttributes.addFlashAttribute("msg", "Some problems occur. Please try again");
        return "redirect:/auth";
    }

    @PostMapping("/signup")
    public String signup(@RequestParam(name="signupEmail") String email, @RequestParam(name="signupPassword") String password,
                        @RequestParam(name="signupConfirmPassword") String confirmedPassword, RedirectAttributes redirectAttributes) {
        System.out.println(email);
        System.out.println(password);
        System.out.println(confirmedPassword);
        if (!"".equals(email) && !"".equals(password) && !"".equals(confirmedPassword)) {
            if (!password.equals(confirmedPassword)) {
                // Authentication fail, 400: Bad Request
                redirectAttributes.addFlashAttribute("display", "show");
                redirectAttributes.addFlashAttribute("msg", "Passwords are not the same");
                return "redirect:/auth";
            } else {
                // TODO: Successful creation with DB
                Boolean success = true;
                if (success) {
                    // Authentication success, 200: Success
                    return "redirect:/";
                } else {
                    // Authentication fail, 400: Bad Request
                    redirectAttributes.addFlashAttribute("display", "show");
                    redirectAttributes.addFlashAttribute("msg", "Email already existed. Please try another one");
                    return "redirect:/auth";
                }
            }
        }
        redirectAttributes.addFlashAttribute("display", "show");
        redirectAttributes.addFlashAttribute("msg", "Some problems occur. Please try again");
        return "redirect:/auth";
    }

}
