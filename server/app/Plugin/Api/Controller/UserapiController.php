<?php
/**
 * Created by PhpStorm.
 * User: Admin
 * Date: 2/9/2018
 * Time: 11:09 AM
 */
class UserApiController extends ApiAppController {

    public $uses = array(
        'User'
    );

    /**
     * trả về danh sách user
     */
    public function getList() {
        if($this->request->is('get')) {
            //get param
            $output     = $this->getBaseOutputParams();
            $params     = $this->getParams();

            $conditions = array();

            $limit      = isset($params['limit']) ? $params['limit'] : 15;
            $sort       = isset($params['sort']) ? $params['sort'] : 'id';
            $direction  = isset($params['direction']) ? $params['direction'] : 'desc';
            $order      = array($sort => $direction);
            $fields     = array('id', 'email', 'first_name', 'last_name', 'date_of_birth', 'role', 'created', 'updated');
            $page       = isset($params['page']) ? $params['page'] : 1;

            if(!empty($params['email'])) {
                $conditions[]['email LIKE'] = "%{$params['email']}%";
            }
            if(!empty($params['role'])) {
                $conditions[]['role'] = $params['role'];
            }
            if(!empty($params['full_name'])) {;
                $conditions[]['OR'] = array(
                    'first_name LIKE'   => "%{$params['full_name']}%",
                    'last_name LIKE'    => "%{$params['full_name']}%"
                );
            }

            $this->paginate = array(
                'limit'     => $limit,
                'order'     => $order,
                'fields'    => $fields,
                'contain'   => false,
                'page'      => $page
            );

            try {
                $users = $this->paginate('User', $conditions);
            } catch (NotFoundException $e) {
                $users = array();
            }

            $data['items'] = array();
            foreach($users as $user) {
                $data['items'][] = $user['User'];
            }

            $data['paging']['page']         = $this->request->paging['User']['page'];
            $data['paging']['current']      = $this->request->paging['User']['current'];
            $data['paging']['count']        = $this->request->paging['User']['count'];
            $data['paging']['pageCount']    = $this->request->paging['User']['pageCount'];
            $data['paging']['limit']        = $this->request->paging['User']['limit'];

            $data['sort']['sort']           = $sort;
            $data['sort']['direction']      = $direction;

            $output['status']               = API_CODE_OK;
            $output['message']              = __('Danh sách quản trị');
            $output['data']                 = $data;
            $this->renderJson($output);
        } else {
            $this->methodNotAllow();
        }
    }

    /**
     * trả về data chi tiết của user
     */
    public function getDetail() {
        if($this->request->is('get')) {
            //get param
            $output = $this->getBaseOutputParams();
            $params = $this->getParams();

            if (!isset($params['id']) || empty($params['id'])) {
                $this->_errors['id'] = __('Id truyền vào thiếu hoặc không đúng');
            }

            if (!empty($this->_errors)) {
                $this->sendError(__('Tham số truyền vào thiếu hoặc không đúng'), API_CODE_NG, API_HTTP_CODE_200, $this->_errors);
            }

            $id     = isset($params['id']) ? $params['id'] : null;
            $fields = '*';

            $user = $this->User->find('first', array(
                'conditions'    => array('id' => $id),
                'fields'        => $fields,
                'contain'       => false
            ));

            if(empty($user)) {
                $this->sendError(__('Quản trị không tồn tại'), API_CODE_NG, API_HTTP_CODE_200);
            }

            if(!empty($user['User']['avatar'])) {
                $user['User']['avatar'] = router::url('/', true) . 'files/images/' . $user['User']['avatar'];
            }

            $output['status']   = API_CODE_OK;
            $output['message']  = __('Chi tiết quản trị');
            $output['data']     = $user['User'];
            $this->renderJson($output);
        } else {
            $this->methodNotAllow();
        }
    }

    /**
     * insert 1 user vào database
     */
    public function addNew() {
        if($this->request->is('post')) {
            //get param
            $output = $this->getBaseOutputParams();
            $params = $this->getParams();

            $data   = array('User' => array(
                'email'         => isset($params['email']) ? $params['email'] : null,
                'password'      => isset($params['password']) ? $this->Auth->password($params['password']) : null,
                'first_name'    => isset($params['first_name']) ? $params['first_name'] : null,
                'last_name'     => isset($params['last_name']) ? $params['last_name'] : null,
                'date_of_birth' => isset($params['date_of_birth']) ? $params['date_of_birth'] : null,
                'avatar'        => isset($_FILES['avatar']) ? $_FILES['avatar'] : null,
                'note'          => isset($params['note']) ? $params['note'] : null,
                'gender'        => isset($params['gender']) ? $params['gender'] : null,
                'role'          => isset($params['role']) ? $params['role'] : null
            ));

            $this->User->create();

            if($this->User->save($data)) {
                $output['status']   = API_CODE_OK;
                $output['message']  = __('Thêm mới quản trị thành công');
                $output['data']     = array('id' => $this->User->id);
                $this->renderJson($output);
            } else {
                $this->sendError(__('Lỗi xảy ra trong quá trình thêm mới quản trị'), API_CODE_NG, API_HTTP_CODE_200, $this->User->validationErrors);
            }
        } else {
            $this->methodNotAllow();
        }
    }

    /**
     * cập nhật thông tin user
     */
    public function updateDetail() {
        if($this->request->is('put')) {
            //get param
            $output = $this->getBaseOutputParams();
            $params = $this->getParams();

            if(!isset($params['id']) || empty($params['id'])) {
                $this->_errors['id'] = __('Id truyền vào thiếu hoặc không đúng');
            }

            if(!empty($this->_errors)) {
                $this->sendError(__('Tham số truyền vào thiếu hoặc không đúng'), API_CODE_NG, API_HTTP_CODE_200, $this->_errors);
            }

            $user = array('User' => array(
                'id'            => $params['id'],
                'email'         => isset($params['email']) ? $params['email'] : null,
                'first_name'    => isset($params['first_name']) ? $params['first_name'] : null,
                'last_name'     => isset($params['last_name']) ? $params['last_name'] : null,
                'date_of_birth' => isset($params['date_of_birth']) ? $params['date_of_birth'] : null,
                'avatar'        => isset($_FILES['avatar']) ? $_FILES['avatar'] : null,
                'note'          => isset($params['note']) ? $params['note'] : null,
                'gender'        => isset($params['gender']) ? $params['gender'] : null,
                'role'          => isset($params['role']) ? $params['role'] : null
            ));

            if(!empty($params['password'])) {
                $user['User']['password'] = $this->Auth->password($params['password']);
            }

            $this->User->id = $params['id'];

            if($this->User->save($user)) {
                $output['status']   = API_CODE_OK;
                $output['message']  = __('Sửa thông tin quản trị thành công');
                $output['data']     = array('id' => $this->User->id);
                $this->renderJson($output);
            } else {
                $this->sendError(__('Lỗi xảy ra trong quá trình sửa thông tin quản trị'), API_CODE_NG, API_HTTP_CODE_200, $this->User->validationErrors);
            }
        } else {
            $this->methodNotAllow();
        }
    }

    /**
     * xóa 1 user
     */
    public function delete() {
        if($this->request->is('delete')) {
            //get param
            $output = $this->getBaseOutputParams();
            $params = $this->getParams();

            if(!isset($params['id']) || empty($params['id'])) {
                $this->_errors['id'] = __('Id truyền vào thiếu hoặc không đúng');
            }

            if(!empty($this->_errors)) {
                $this->sendError(__('Tham số truyền vào thiếu hoặc không đúng'), API_CODE_NG, API_HTTP_CODE_200, $this->_errors);
            }

            if($this->User->delete($params['id'])) {
                $output['status']   = API_CODE_OK;
                $output['message']  = __('Xóa thông tin quản trị thành công');
                $output['data']     = array('id' => $params['id']);
                $this->renderJson($output);
            } else {
                $this->sendError(__('Lỗi xảy ra trong quá trình xóa thông tin quản trị'), API_CODE_NG, API_HTTP_CODE_200);
            }
        } else {
            $this->methodNotAllow();
        }
    }

    public function login() {
        if($this->request->is('post')) {
            //get param
            $output = $this->getBaseOutputParams();
            $params = $this->getParams();

            $user   = $this->User->find('first', array(
                'conditions' => array(
                    'email'     => isset($params['email']) ? $params['email'] : null,
                    'password'  => isset($params['password']) ? $this->Auth->password($params['password']) : null,
                )
            ));

            if(!empty($user)) {
                if(!empty($user['User']['avatar'])) {
                    $user['User']['avatar'] = router::url('/', true) . 'files/images/' . $user['User']['avatar'];
                }

                $output['status']   = API_CODE_OK;
                $output['message']  = __('Đăng nhập thành công');
                $output['data']     = $user['User'];
                $this->renderJson($output);
            } else {
                $this->sendError(__('Email hoặc mật khẩu sai'), API_CODE_NG, API_HTTP_CODE_200);
            }
        } else {
            $this->methodNotAllow();
        }
    }
}