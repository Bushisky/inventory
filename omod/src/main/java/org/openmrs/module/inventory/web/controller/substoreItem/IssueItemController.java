package org.openmrs.module.inventory.web.controller.substoreItem;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
@Controller("IssueItemController")
@RequestMapping("/module/inventory/subStoreIssueItem.form")
public class IssueItemController {

	@RequestMapping(method = RequestMethod.GET)
	public String firstView() {
		
			
		return "/module/inventory/substoreItem/subStoreIssueItem";
	}
	
	
	
	@RequestMapping(method = RequestMethod.POST)
	public String onSubmit() {
		
	
		return "redirect:module/inventory/substoreItem/subStoreIssueItem";
	}



}
