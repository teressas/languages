package com.teressas.languages.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.teressas.languages.models.Language;
import com.teressas.languages.services.LanguageService;

@Controller
@RequestMapping("/languages")
public class HomeController {
	
	@Autowired
	LanguageService languageService;
	
	// Find all
	@GetMapping("")
	public String dashboard(Model model, @ModelAttribute("newLanguage") Language newLanguage) {
		List<Language> languages = languageService.allLanguages();
		model.addAttribute("languages",languages);
		
		return "dashboard.jsp";
	}
	
	// Create 
	@GetMapping("/create")
	public String createForm(@ModelAttribute("newLanguage") Language newLanguage) {
		return "dashboard.jsp";
	}
	
	// Process Create Form
	@PostMapping("/create")
	public String processCreateForm(Model model, @Valid @ModelAttribute("newLanguage") Language newLanguage, 
			BindingResult result) {
		if(result.hasErrors()) {
			List<Language> languages = languageService.allLanguages();
			model.addAttribute("languages",languages);
			return "dashboard.jsp";
		} else {
			languageService.addLanguage(newLanguage);
			return "redirect:/languages";
		}
	}
	
	// Get One
	@GetMapping("{id}")
	public String getOneLanguage(@PathVariable("id") Long id, Model model) {
		Language languages = languageService.findOneLanguage(id);
		model.addAttribute("languages", languages);
		return "showOne.jsp";
	}
	
	// Edit
	@GetMapping("/edit/{id}")
	public String editForm(@PathVariable("id") Long id, Model model) {
		Language language = languageService.findOneLanguage(id);
		model.addAttribute("language", language);
		return "editForm.jsp";
		
	}
	
	// Process Edit Form
	@PutMapping("/edit/{id}")
	public String processEditForm(@Valid @ModelAttribute("language") Language language,
			BindingResult result, @PathVariable("id") Long id) {
		if(result.hasErrors()) {
			return "editForm.jsp";
		} else {
			languageService.editLanguage(language);
			return "redirect:/languages/edit/{id}";
		}
	}
	
	// Delete
	@DeleteMapping("/delete/{id}")
	public String processDeleteOne(@PathVariable("id") Long id) {
		languageService.deleteLanguage(id);
		return "redirect:/languages";
	}
	
	

				
}
