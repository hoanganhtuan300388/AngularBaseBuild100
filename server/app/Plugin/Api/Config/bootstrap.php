<?php
	define('API_CODE_OK', 1);
	define('API_CODE_NG', 0);
	define('API_TIME_OUT', 1800);
	define('API_HTTP_CODE_200', 200);
	define('API_HTTP_CODE_400', 400);
    define('API_CODE_400', 400);
    define('API_CODE_401', 401);
	define('API_CODE_404', 404);
    define('API_CODE_405', 405);
	define('API_CODE_503', 503);
	define('API_CODE_505', 505);
    define('API_CODE_MSG_SUCCESS', __('SUCCESS'));
    define('API_CODE_MSG_FAIL', __('FAIL'));

	define('MAX_FILE_IMAGE_SIZE', 1.5);
	define('API_MSG_TIMEOUT', __('Token timeout expired'));
	define('API_MSG_INCORRECT_INPUT', __('Invalid token or parameter'));
	define('API_MSG_VALIDATION_ERROR', __('ERROR'));

	Configure::write('Api.PluginName', 'Api');
	Configure::write('Api.token_default', 'wvniR2G0FgaC9mis2guDoUubW8HfLkwDEbBqBwrS');