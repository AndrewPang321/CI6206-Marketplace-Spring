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
                redirectAttributes.addFlashAttribute("class", "success");
                redirectAttributes.addFlashAttribute("message", "Sign up success. Redirect in 1 second");
                return "redirect:/";
            } else {
                // Authentication fail, 400: Bad Request
                return "redirect:/auth";
            }
        }
        return "redirect:/auth";
    }

}
