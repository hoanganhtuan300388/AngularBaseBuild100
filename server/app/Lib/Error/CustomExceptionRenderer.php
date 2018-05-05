<?php
/**
 * Created by PhpStorm.
 * User: Admin
 * Date: 2/9/2018
 * Time: 2:03 PM
 */
App::uses('ExceptionRenderer', 'Error');

class CustomExceptionRenderer extends ExceptionRenderer {

    // override
    public function error400($error) {
        $this->_prepareView($error, 'Not Found');
        $this->controller->response->statusCode($error->getCode());

        $this->_outputMessage('error400');
    }

    // override
    public function error500($error) {
        $this->_prepareView($error, 'An Internal Error Has Ocurred.');
        $code = ($error->getCode() > 500 && $error->getCode() < 506) ? $error->getCode() : 500;
        $this->controller->response->statusCode($code);

        $this->_outputMessage('error500');
    }

    private function _prepareView($error, $genericMessage) {
        $message = $error->getMessage();
        if(!Configure::read('debug') && !Configure::read('detailed_exceptions')) {
            $message = __d('cake', $genericMessage);
        }
        $url = $this->controller->request->here();
        $renderVars = array(
            'name' => h($message),
            'url' => h($url),
        );
        if(isset($this->controller->viewVars['csrf_token'])) {
            $renderVars['csrf_token'] = $this->controller->viewVars['csrf_token'];
        }
        $renderVars['_serialize'] = array_keys($renderVars);
        $this->controller->set($renderVars);
    }
}