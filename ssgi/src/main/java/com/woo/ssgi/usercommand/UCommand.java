package com.woo.ssgi.usercommand;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface UCommand {
	public void execute(Model model, HttpServletRequest request);


}

