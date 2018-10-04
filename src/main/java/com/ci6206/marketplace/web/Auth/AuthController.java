package com.ci6206.marketplace.web.Auth;

import com.ci6206.marketplace.web.Auth.model.User;
import com.ci6206.marketplace.web.Auth.model.UserAccount;
import com.ci6206.marketplace.web.Auth.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
public class AuthController {

    @Autowired
    UserRepository userRepository;

    @RequestMapping("/auth")
    public String auth() {
        return "login";
    }

    @PostMapping("/login")
    public String login(@RequestParam(name="loginEmail") String email, @RequestParam(name="loginPassword") String password,
            RedirectAttributes redirectAttributes) {

        if ("".equals(email) || "".equals(password)) {
            redirectAttributes.addFlashAttribute("display", "show");
            redirectAttributes.addFlashAttribute("msg", "Some fields are empty");
            return "redirect:/auth";
        }

        // TODO: Successful authentication with DB
        Boolean success = true;
        if (success) {
            // Authentication success, 200: Success
            return "redirect:/";
        } else if (!success){
            // Authentication fail, 400: Bad Request
            redirectAttributes.addFlashAttribute("display", "show");
            redirectAttributes.addFlashAttribute("msg", "Incorrect Email/Password");
            return "redirect:/auth";
        }

        /*if (!"".equals(email) && !"".equals(password)) {
            // TODO: Successful authentication with DB (Separation with this function)
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
        }*/

        redirectAttributes.addFlashAttribute("display", "show");
        redirectAttributes.addFlashAttribute("msg", "Some problems occur. Please try again");
        return "redirect:/auth";
    }

    @PostMapping("/signup")
    public String signup(@RequestParam(name="signupEmail") String email, @RequestParam(name="signupPassword") String password,
            @RequestParam(name="signupConfirmPassword") String confirmedPassword, @RequestParam(name="signupFirstName") String firstname,
            @RequestParam(name="signupLastName") String lastname, @RequestParam(name="signupDateOfBirth") String dateOfBirth,
            @RequestParam(name="signupGender") String gender, @RequestParam(name="signupContact") int contact,
            @RequestParam(name="signupAddress") String address, @RequestParam(name="signupPostalCode") int postalCode,
            @RequestParam(name="signupCountry") String country, RedirectAttributes redirectAttributes) {

        if ("".equals(email) || "".equals(password) || "".equals(confirmedPassword) || "".equals(firstname) ||
                "".equals(lastname) || "".equals(dateOfBirth) || "".equals(gender) || "".equals(String.valueOf(contact)) ||
                "".equals(address) || "".equals(String.valueOf(postalCode)) || "".equals(country)) {
            redirectAttributes.addFlashAttribute("display", "show");
            redirectAttributes.addFlashAttribute("msg", "Some fields are empty");
            return "redirect:/auth";
        }

        // Convert date string to date object
        DateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd");
        Date dateOfBirthWithTypeDate;
        try {
            dateOfBirthWithTypeDate = dateFormatter.parse(dateOfBirth);
        } catch (ParseException e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("display", "show");
            redirectAttributes.addFlashAttribute("msg", "Some problems occur. Please try again");
            return "redirect:/auth";
        }

        if (!password.equals(confirmedPassword)) {
            // Authentication fail, 400: Bad Request
            redirectAttributes.addFlashAttribute("display", "show");
            redirectAttributes.addFlashAttribute("msg", "Passwords are not the same");
            return "redirect:/auth";
        }

        if (userRepository.findByEmail(email) != null) {
            // Authentication fail, 400: Bad Request
            redirectAttributes.addFlashAttribute("display", "show");
            redirectAttributes.addFlashAttribute("msg", "Email already existed. Please try another one");
            return "redirect:/auth";
        }

        User returnedUser = userRepository.save(new User(email, firstname, lastname, dateOfBirthWithTypeDate, gender, contact, address, postalCode, country, new UserAccount(email, password)));
        if (returnedUser != null) {
            // Authentication success, 200: Success
            return "redirect:/";
        }

        redirectAttributes.addFlashAttribute("display", "show");
        redirectAttributes.addFlashAttribute("msg", "Some problems occur. Please try again");
        return "redirect:/auth";
    }

}
