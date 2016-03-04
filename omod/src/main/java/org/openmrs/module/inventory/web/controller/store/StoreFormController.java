package org.openmrs.module.inventory.web.controller.store;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.math.NumberUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.openmrs.Role;
import org.openmrs.api.context.Context;
import org.openmrs.module.inventory.InventoryConstants;
import org.openmrs.module.inventory.InventoryService;
import org.openmrs.module.hospitalcore.model.InventoryStore;
import org.openmrs.module.hospitalcore.model.InventoryStoreRoleRelation;
import org.openmrs.module.hospitalcore.util.Action;
import org.openmrs.module.hospitalcore.util.ActionValue;

import org.springframework.beans.propertyeditors.CustomBooleanEditor;
import org.springframework.beans.propertyeditors.CustomNumberEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;

@Controller("storeFormController")
@RequestMapping("/module/inventory/store.form")
public class StoreFormController {
	Log log = LogFactory.getLog(this.getClass());

	@RequestMapping(method = RequestMethod.GET)
	public String firstView(@ModelAttribute("store") InventoryStore store,
			@RequestParam(value = "storeId", required = false) Integer id,
			Model model) {
		if (id != null) {
			store = Context.getService(InventoryService.class).getStoreById(id);
			model.addAttribute("store", store);

		}
		List<Action> listIsDrug = ActionValue.getListIsDrug();
		model.addAttribute("listIsDrug", listIsDrug);
		return "/module/inventory/store/form";
	}
	@ModelAttribute("roles")
	public List<Role> populateRoles(HttpServletRequest request) {

		// List<Role> listRole = Context.getUserService().getAllRoles();

		// return listRole;

		InventoryService inventoryService = (InventoryService) Context.getService(InventoryService.class);

		List<Role> roles = Context.getUserService().getAllRoles();
		List<Role> listRole = new ArrayList<Role>();
		listRole.addAll(roles);
		List<InventoryStore> stores = inventoryService.listAllInventoryStore();
		
		return listRole;

	}

	@ModelAttribute("parents")
	public List<InventoryStore> populateParents(HttpServletRequest request) {
		InventoryService inventoryService = (InventoryService) Context
				.getService(InventoryService.class);
		List<InventoryStore> stores = inventoryService.listAllInventoryStore();
		List<InventoryStore> listParents = new ArrayList<InventoryStore>();
		listParents.addAll(stores);
		
		for (InventoryStore storeV : stores) {
			if (storeV.getParentStores().size() > 0) { // luan. should be
														// updated here
				listParents.remove(storeV);
			}

		}
		return listParents;
	}

	/*
	 * @InitBinder public void initBinder(WebDataBinder binder) {
	 * binder.registerCustomEditor(java.lang.Integer.class,new
	 * CustomNumberEditor(java.lang.Integer.class, true));
	 * //binder.registerCustomEditor(java.util.List.class,new
	 * CustomCollectionEditor(java.util.List.class, true));
	 * binder.registerCustomEditor(InventoryStore.class, new
	 * StorePropertyEditor()); binder.registerCustomEditor(Role.class, new
	 * RolePropertyEditor()); }
	 */
	@RequestMapping(method = RequestMethod.POST)
	public String onSubmit(@ModelAttribute("store") InventoryStore store,
			@ModelAttribute("role") InventoryStoreRoleRelation role,
			Model model, HttpServletRequest request, SessionStatus status) {
		// new StoreValidator().validate(store, bindingResult);
		// storeValidator.validate(store, bindingResult);

		InventoryService inventoryService = (InventoryService) Context
				.getService(InventoryService.class);
		// save store
		store.setCreatedBy(Context.getAuthenticatedUser().getGivenName());
		store.setCreatedOn(new Date());

		if (request.getParameterValues("parent") != null
				&& request.getParameterValues("parent").length > 0
				&& !request.getParameterValues("parent")[0].isEmpty()) {
			Set<InventoryStore> listParents = new HashSet<InventoryStore>();
			for (String parentId : request.getParameterValues("parent")) {
				

				InventoryStore parentStore = new InventoryStore();
				parentStore = inventoryService.getStoreById(Integer
						.valueOf(parentId));
				listParents.add(parentStore);
			}
			;
			store.setParentStores(listParents);

		}
		
		
		InventoryStoreRoleRelation rel = new InventoryStoreRoleRelation();
		int value=0;
		 String roleName = request.getParameter("rolesss");
		List<InventoryStoreRoleRelation> roleRelation = inventoryService.listOfRoleRelation(store.getId(),roleName);
		for (InventoryStoreRoleRelation rl : roleRelation) {
			
		if( rl.getRoleName().equals(roleName)&&rl.getStoreid().equals(store.getId()))
						{
			value=1;
		}
		}
			if(value==0)
				
				{
				for( String roleName1 :request.getParameterValues("rolesss"))
				{
				rel.setRoleName(roleName1);
				rel.setStoreid(store.getId());
				

				inventoryService.saveStores(rel);
				
				}
			
				}

		

		inventoryService.saveStore(store);
		 status.setComplete();
		return "redirect:/module/inventory/storeList.form";
	}
}
