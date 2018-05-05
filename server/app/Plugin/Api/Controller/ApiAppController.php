<?php
App::uses('Sanitize', 'Utility');
App::uses('AppController', 'Controller');

class ApiAppController extends AppController {

    public $components = array(
        //'DebugKit.Toolbar',
        'RequestHandler',
        'Auth'
    );

    public $dataPath;

    public $inputParams = array();

    protected $_token_name = 'access_token';

    protected $_paramHeader = null;

    protected $_errors = array();

    protected $logFile;

    /**
     * @param null $request
     * @param null $response
     */
    public function __construct($request = null, $response = null) {
        parent::__construct($request, $response);
        $this->dataPath = dirname(dirname(__FILE__)) . DS . 'data' . DS;
        $this->logFile = LOGS . 'api_logging_' . date('Ymd', time()) . '.log';
    }

    function beforeFilter() {
        parent::beforeFilter();

        header('Content-type: application/json');
        header('Access-Control-Allow-Origin: *');
        header('Access-Control-Allow-Methods: POST, GET, OPTIONS, PUT, DELETE');
        header('Access-Control-Allow-Credentials: true');
        header('Access-Control-Allow-Headers: Authorization, Content-Type');

        //if($this->request->is('options')) {
        //    $this->renderJson(array());
        //}

        if (strcasecmp($this->name, 'DebugApi') !== 0 && strcasecmp($this->name, 'DummyApi') !== 0) {
            //$this->validateAuthToken();
            //$this->__handleAuthentication();
        }

        $this->autoRender = false;
        $this->layout = null;
        $this->Auth->allow();
    }

    /**
     * check authentication method
     * if login access else unaccess
     */
    public function __handleAuthentication() {
        $allowActions = array('adminLogin');

        if(strpos($this->action, 'admin') !== false && !in_array($this->action, $allowActions)) {
            $params = $this->getParams();

            if(empty($params['token']) || !$this->Session->check($params['token'])) {
                $this->sendError(API_MSG_INCORRECT_INPUT, API_CODE_NG, API_HTTP_CODE_200);
            }
        }
    }

    /**
     * @param int $status
     * @param $message
     * @return mixed
     */
    protected function getBaseOutputParams($status = API_CODE_OK, $message = API_CODE_MSG_SUCCESS) {
        $output['status']   = $status;
        $output['message']  = $message;

        return $output;
    }

    /**
     * @param $message
     * @param int $code
     * @param int $httpCode
     * @param array $errorLogic
     */
    public function sendError($message, $code = API_CODE_OK, $httpCode = API_HTTP_CODE_200, $errorLogic = array()) {
        @header(' ', true, $httpCode);

        if ($httpCode == API_HTTP_CODE_200) {
            header("Status: 200 OK");
        }

        $result['status']   = $code;
        $result['message']  = $message;
        if (!empty($errorLogic)) {
            $result['errors'] = $errorLogic;
        }

        $this->renderJson($result);
    }

    /**
     * @param $data
     * @param int $httpCode
     */
    public function renderJson($data, $httpCode = API_HTTP_CODE_200) {
        if ($httpCode == 201) {
            header('Status: 201 Created');
        } else {
            header('Status: 200 OK');
        }

        if (!isset($data['status'])) {
            $data['status'] = API_HTTP_CODE_200;
        }

        $data['time'] = date('Y-m-d H:i:s');

        $this->logRequestParams($data, $this->inputParams);
        echo json_encode($data);
        exit();
    }

    /**
     * @param array $output
     * @param array $input
     */
    public function logRequestParams($output = array(), $input = array()) {
        $params = array(
            'Info'          => 'ACCESS API: ' . $this->request->url . ' METHOD: ' . $this->request->method() . ' FROM IP: ' . $this->request->clientIp(),
            'Input'         => !empty($input) ? $input : $this->data,
            'Output'        => $output,
            'paramHeader'   => $this->_paramHeader
        );

        $this->log($params);

        return;
    }


    /**
     * @return bool|void
     */
    public function validateAuthToken() {
        $paramHeader = $this->getParamHeader();
        $token = isset($paramHeader[$this->_token_name]) ? $paramHeader[$this->_token_name] : null;

        if(!$token) {
            return $this->sendError(API_MSG_INCORRECT_INPUT, API_CODE_NG, API_HTTP_CODE_200);
        }

        $token_default = Configure::read('Api.token_default');
        if($token != $token_default) {
            return $this->sendError(API_MSG_INCORRECT_INPUT, API_CODE_NG, API_HTTP_CODE_200);
        }

        return true;
    }

    /**
     * @param $data
     * @param int $httpCode
     */
    public function outputJson($data, $httpCode = API_HTTP_CODE_200) {
        if($httpCode == 201) {
            header("Status: 201 Created");
        } else {
            header("Status: 200 OK");
        }

        $this->logRequestParams((array)$data, $this->data);

        if(empty($data)) {
            $data = json_encode(array('status' => API_HTTP_CODE_200));
        }

        echo $data;
        exit();
    }

    /**
     * @return array
     */
    public function getParamHeader() {
        $paramAuth = array();
        if(function_exists('getallheaders')) {
            $headers = getallheaders();
        } else if(function_exists('apache_request_headers')) {
            $headers = apache_request_headers();
        } else {
            $headers = array();
        }

        if(isset($headers['Authorization'])) {
            $auth = trim($headers['Authorization']);

            if(strncasecmp($auth, 'OAuth', 4) == 0) {
                $vs = explode(',', substr($auth, 6));
                foreach($vs as $v) {
                    if(strpos($v, '=')) {
                        $v = trim($v);
                        list($name, $value) = explode('=', $v, 2);
                        if(!empty($value) && $value{0} == '"' && substr($value, -1) == '"') {
                            $value = substr(substr($value, 1), 0, -1);
                        }

                        if(strcasecmp($name, 'realm') == 0) {
                            //$this->realm = $value;
                        } else {
                            $paramAuth[$name] = (get_magic_quotes_gpc()) ? $value : stripslashes($value);
                        }
                    }
                }
            }
        }

        $this->_paramHeader = $paramAuth;
        return $paramAuth;
    }

    protected function methodBadRequest() {
        $this->sendError(__('Bad request'), API_CODE_NG, API_CODE_400);
    }

    /**
     * @param string $method
     * @return array
     */
    protected function getParams($method = '') {
        $this->inputParams['POST']      = isset($_POST) && !empty($_POST) ? $_POST : array();
        $this->inputParams['FILES']     = isset($_FILES) && !empty($_FILES) ? $_FILES : array();
        $this->inputParams['GET']       = isset($_GET) && !empty($_GET) ? $_GET : array();
        $this->inputParams['request']   = $this->request->data;

        if($method != '' || strcasecmp('post', $method) === 0) {
            return $this->request->data;
        } else if($method != '' || strcasecmp('get', $method) === 0) {
            return $this->request->query;
        }

        return array_merge($this->request->query, $this->request->data);
    }

    /**
     * @param string $mess
     * @param null $filename
     * @param null $scope
     * @return bool|void
     */
    public function log($mess, $filename = null, $scope = NULL) {
        $chmod = file_exists($this->logFile) ? false : true;
        if(!is_string($mess)) {
            $mess       = print_r($mess, true);
            $trans_tbl  = get_html_translation_table(HTML_ENTITIES);
            $trans_tbl  = array_flip($trans_tbl);
            $mess       = strtr($mess, $trans_tbl);
        }
        $output = date('Y-m-d H:i:s', time()) . ': ' . trim($mess) . "\n";

        //check max filesize
        if(file_exists($this->logFile) && (filesize($this->logFile) / (1024 * 1024) > 1)) {
            copy($this->logFile, LOGS . DS . basename($this->logFile, '.log') . '_' . time() . '.log');
            unlink($this->logFile);
            $chmod = true;
        }
        $contents = (file_exists($this->logFile)) ? file_get_contents($this->logFile) : '';

        //write file
        if(!file_put_contents($this->logFile, $output . $contents, LOCK_EX)) {

            $handle = fopen($this->logFile, 'a+');
            if(fwrite($handle, $output) === FALSE) {
                error_log($output, 3, $this->logFile);
                if($chmod) @chmod($this->logFile, 0755);
            }
            if($handle) {
                fclose($handle);
            }
        }

        $this->_clearFileCache(LOGS, '.log', 14);
    }

    /**
     * @param string $dir
     * @param string $ext
     * @param int $day
     * @return bool
     */
    protected function _clearFileCache($dir = LOGS, $ext = '.log', $day = 30) {
        if(!is_numeric($day)) {
            $day = 7;
        }

        $cleartime = strtotime("-$day day");
        $today = date('Ymd', time());

        if(is_file($dir . $ext)) {
            @unlink($dir . $ext);
            return true;
        } else if(is_dir($dir)) {
            if(file_exists($dir . DS . 'clean.log') && file_get_contents($dir . DS . 'clean.log') == $today) {
                return true;
            }

            $dir    = rtrim($dir, "/\\") . DS;
            $files  = glob($dir . "*" . $ext);

            if($files === false) {
                return false;
            }

            foreach($files as $file) {
                if(is_file($file) && (filemtime($file) < $cleartime) && basename($file) !== 'empty') {
                    @unlink($file);
                }
            }

            //write file
            if(!file_put_contents($dir . DS . 'clean.log', $today, LOCK_EX)) {
                unlink($dir . DS . 'clean.log');
                error_log($today, 3, $dir . DS . 'clean.log');
            }

            @chmod($dir . DS . 'clean.log', 0755);
        }

        return true;
    }

    protected function methodNotAllow() {
        $this->sendError(__('Method not allow'), API_CODE_NG, 500);
    }

}
