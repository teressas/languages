package com.teressas.languages.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teressas.languages.models.Language;
import com.teressas.languages.repositories.LanguageRepository;

@Service
public class LanguageService {
	
	@Autowired
	LanguageRepository languageRepo;
	
	// returns all items
	public List<Language> allLanguages() {
		return languageRepo.findAll();
	}
	
	// creates an item
	public Language addLanguage(Language language){
		return languageRepo.save(language);
	}
	
	// find one item
	public Language findOneLanguage(Long id) {
		Optional<Language> optionalLanguage = languageRepo.findById(id);
		if(optionalLanguage.isPresent()) {
			return optionalLanguage.get();
		} else {
			return null;
		}
	}
	
	// update an item
	public Language editLanguage(Language language) {
		return languageRepo.save(language);
	}
	
	
	// delete an item
	public void deleteLanguage(Long id) {
		languageRepo.deleteById(id);
	}
}
