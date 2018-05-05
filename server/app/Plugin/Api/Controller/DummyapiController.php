<?php
	class DummyApiController extends ApiAppController {

		public function __construct($request = null, $response = null) {
			parent::__construct($request, $response);
		}

		protected function _getListApi() {
			return array(
                /*'youtube_top_api.php' => array(
                    'INPUT' => array(),
                    'OUTPUT' => array(),
                    'METHOD' => 'GET'
                ),
                'youtube_api.php' => array(
                    'INPUT' => array(),
                    'OUTPUT' => array(),
                    'METHOD' => 'GET'
                ),
                'music_release_api.php' => array(
                    'INPUT' => array(),
                    'OUTPUT' => array(),
                    'METHOD' => 'GET'
                ),
                'novel_api.php' => array(
                    'INPUT' => array(),
                    'OUTPUT' => array(),
                    'METHOD' => 'GET'
                ),
                'comic.php' => array(
                    'INPUT' => array(),
                    'OUTPUT' => array(),
                    'METHOD' => 'GET'
                ),
                'contact_api.php' => array(
                    'INPUT' => array(),
                    'OUTPUT' => array(),
                    'METHOD' => 'GET'
                )*/
			);
		}

        /**
         * @param string $api
         */
        public function index($api = '') {
			$jsonFile = $this->dataPath . DS;
			$jsonFile .= $api . '.json';
			$listApi = $this->_getListApi();
			
			if (!$api || !array_key_exists($api, $listApi)) {
				$this->sendError('404 Not Found', API_CODE_404, API_CODE_404);
			}

			$apiDetail = $listApi[$api];
			
			if(file_exists($jsonFile)) {
				if($apiDetail['METHOD'] != '') {
					$method = strtolower($apiDetail['METHOD']);
					if ($this->request->is($method)) {
						$this->outputJson(file_get_contents($jsonFile));
					} else {
						$this->methodNotAllow();
					}
				} else {
					$this->outputJson(file_get_contents($jsonFile));
				}
			} elseif (file_exists($this->dataPath . $api . '.json')) {
				$this->outputJson(file_get_contents($this->dataPath . $api . '.json'));
			} else {
				$this->sendError('404 Not Found', API_CODE_404, API_CODE_404);
			}
		}
	}
