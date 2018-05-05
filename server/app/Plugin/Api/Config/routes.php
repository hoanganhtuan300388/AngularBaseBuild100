<?php

	//route for admin functions
	Router::connect('/api/viewlogs/*', array('plugin' => 'Api', 'controller' => 'Debugapi', 'action' => 'viewlogs'));
	
	//route for dummy api
	Router::connect('/dummyapi/:apigroup/*', array('plugin' => 'Api', 'controller' => 'Dummyapi', 'action' => 'index'));
	//Router::connect('/dummyapi/manager', array('plugin' => 'Api', 'controller' => 'Dummyapi', 'action' => 'index'));
	
	//list route api
    Router::connect('/api/user/:action', array('plugin' => 'Api', 'controller' => 'Userapi'));
    Router::connect('/api/category/:action', array('plugin' => 'Api', 'controller' => 'Categoryapi'));
