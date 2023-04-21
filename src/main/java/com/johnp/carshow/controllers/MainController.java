package com.johnp.carshow.controllers;



import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.johnp.carshow.models.LoginUser;
import com.johnp.carshow.models.Car;
import com.johnp.carshow.models.User;
import com.johnp.carshow.services.CarService;
import com.johnp.carshow.services.UserService;

@Controller
public class MainController {

	@Autowired
	private UserService users;
	@Autowired
	private CarService cars;

    
    @GetMapping("/")
    public String index(Model model) {
    
        model.addAttribute("newUser", new User());
        model.addAttribute("newLogin", new LoginUser());
        return "index.jsp";
    }
    
    @PostMapping("/register")
    public String register(@Valid @ModelAttribute("newUser") User newUser, 
            BindingResult result, Model model, HttpSession session) {
        
    	User user = users.register(newUser, result);
    	
        
        if(result.hasErrors()) {

            model.addAttribute("newLogin", new LoginUser());
            return "index.jsp";
        }
        
        session.setAttribute("userId", user.getId());
    
        return "redirect:/home";
    }
    
    @PostMapping("/login")
    public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, 
            BindingResult result, Model model, HttpSession session) {
        
        User user = users.login(newLogin, result);
    
        if(result.hasErrors()) {
            model.addAttribute("newUser", new User());
            return "index.jsp";
        }
    
        session.setAttribute("userId", user.getId());
    
        return "redirect:/home";
    }
    
    @GetMapping("/home")
    public String home(Model model, HttpSession session) {
    	
    	if(session.getAttribute("userId") == null) {
    		return "redirect:/";
    	}
    	
    	model.addAttribute("cars", cars.all());
    	model.addAttribute("user", users.findById((Long)session.getAttribute("userId")));
    	return "dashboard.jsp";
    }
    
    @GetMapping("/addCar")
    public String addCar(@ModelAttribute("car") Car car,  BindingResult results, Model model, HttpSession session) {
    	
    	User user = users.findById((Long)session.getAttribute("userId"));
    	model.addAttribute("user", user);
    	
    	return "addCar.jsp";
    }
    
    @PostMapping("/Cars")
    public String createBook(@Valid @ModelAttribute("car") Car car, BindingResult result) {

    	if (result.hasErrors()) {
    		return "addCar.jsp";
    	}
    	
    	cars.create(car);
    	
    	return "redirect:/home";
    }
    
    @GetMapping("/cars/{id}")
    public String showPage(Model model, @PathVariable("id") Long id, HttpSession session) {
    	if(session.getAttribute("userId") == null) {
    		return "redirect:/";
    	}
    	Car car = cars.findById(id);
    	model.addAttribute("car", car);
    	model.addAttribute("user", users.findById((Long)session.getAttribute("userId")));
    	model.addAttribute("idInSession",session.getAttribute("userId"));
    	return "viewcar.jsp";
    }
    
    @GetMapping("/logout")
    public String logout(HttpSession session) {
    	session.invalidate();
    	return "redirect:/";
    }
    
	@GetMapping("/car/delete/{id}")
	public String deleteCar(@PathVariable("id") Long id, HttpSession session) {
		if (session.getAttribute("userId")== null) {
			return "redirect:/";
		}
		cars.delete(id);
		return "redirect:/home";
	}
	
    @GetMapping("/car/edit/{id}")
    public String editCar(Model model, @PathVariable("id") Long id, HttpSession session) {
    	if(session.getAttribute("userId") == null) {
    		return "redirect:/";
    	}
    	Car car = cars.findById(id);
    	model.addAttribute("car", car);
    	model.addAttribute("user", users.findById((Long)session.getAttribute("userId")));
    	
    	return "editcar.jsp";
    }
    
    @PutMapping("/cars/{id}/edit")
    public String updateBook(Model model, @Valid @ModelAttribute("car") Car car, BindingResult result, HttpSession session) {
    	if(session.getAttribute("userId") == null) {
    		return "redirect:/";
    	}
    	
    	if(result.hasErrors()) {
    		return "editShow.jsp";
    	}
    	
    	cars.update(car);
    	
    	return "redirect:/home";
    }
}