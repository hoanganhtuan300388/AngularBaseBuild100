<?php
/**
 * Created by PhpStorm.
 * User: Admin
 * Date: 3/7/2018
 * Time: 9:47 AM
 */
class CategoryApiController extends ApiAppController {

    public $uses = array(
        'Category'
    );

    /**
     * trả về danh sách loại sản phẩm
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
            $fields     = '*';
            $page       = isset($params['page']) ? $params['page'] : 1;

            if(!empty($params['name'])) {
                $conditions[]['name LIKE'] = "%{$params['name']}%";
            }
            if(!empty($params['parent_id'])) {
                $conditions[]['parent_id'] = $params['parent_id'];
            }

            $this->paginate = array(
                'limit'     => $limit,
                'order'     => $order,
                'fields'    => $fields,
                'contain'   => false,
                'page'      => $page
            );

            try {
                $categories = $this->paginate('Category', $conditions);
            } catch (NotFoundException $e) {
                $categories = array();
            }

            $data['items'] = array();
            foreach($categories as $category) {
                $data['items'][] = $category['Category'];
            }

            $data['paging']['page']         = $this->request->paging['Category']['page'];
            $data['paging']['current']      = $this->request->paging['Category']['current'];
            $data['paging']['count']        = $this->request->paging['Category']['count'];
            $data['paging']['pageCount']    = $this->request->paging['Category']['pageCount'];
            $data['paging']['limit']        = $this->request->paging['Category']['limit'];

            $data['sort']['sort']           = $sort;
            $data['sort']['direction']      = $direction;

            $output['status']               = API_CODE_OK;
            $output['message']              = __('Danh sách loại sản phẩm');
            $output['data']                 = $data;
            $this->renderJson($output);
        } else {
            $this->methodNotAllow();
        }
    }

    /**
     * trả về data chi tiết của loại snar phẩm
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

            $category = $this->Category->find('first', array(
                'conditions'    => array('id' => $id),
                'fields'        => $fields,
                'contain'       => false
            ));

            if(empty($category)) {
                $this->sendError(__('Loại sản phẩm không tồn tại'), API_CODE_NG, API_HTTP_CODE_200);
            }

            $output['status']   = API_CODE_OK;
            $output['message']  = __('Chi tiết loại sản phẩm');
            $output['data']     = $category['Category'];
            $this->renderJson($output);
        } else {
            $this->methodNotAllow();
        }
    }

    /**
     * insert 1 loại sản phẩm vào database
     */
    public function addNew() {
        if($this->request->is('post')) {
            //get param
            $output = $this->getBaseOutputParams();
            $params = $this->getParams();

            $data   = array('Category' => array(
                'parent_id'     => isset($params['parent_id']) ? $params['parent_id'] : null,
                'name'          => isset($params['name']) ? $params['name'] : null,
                'slug'          => isset($params['slug']) ? $params['slug'] : null,
                'description'   => isset($params['description']) ? $params['description'] : null
            ));

            $this->Category->create();

            if($this->Category->save($data)) {
                $output['status']   = API_CODE_OK;
                $output['message']  = __('Thêm mới loại sản phẩm thành công');
                $output['data']     = array('id' => $this->Category->id);
                $this->renderJson($output);
            } else {
                $this->sendError(__('Lỗi xảy ra trong quá trình thêm mới loại sản phẩm'), API_CODE_NG, API_HTTP_CODE_200, $this->Category->validationErrors);
            }
        } else {
            $this->methodNotAllow();
        }
    }

    /**
     * cập nhật thông tin loại sản phẩm
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

            $category = array('Category' => array(
                'parent_id'     => isset($params['parent_id']) ? $params['parent_id'] : null,
                'name'          => isset($params['name']) ? $params['name'] : null,
                'slug'          => isset($params['slug']) ? $params['slug'] : null,
                'description'   => isset($params['description']) ? $params['description'] : null
            ));

            $this->Category->id = $params['id'];

            if($this->Category->save($category)) {
                $output['status']   = API_CODE_OK;
                $output['message']  = __('Sửa thông tin loại sản phẩm thành công');
                $output['data']     = array('id' => $this->Category->id);
                $this->renderJson($output);
            } else {
                $this->sendError(__('Lỗi xảy ra trong quá trình sửa thông tin loại sản phẩm'), API_CODE_NG, API_HTTP_CODE_200, $this->Category->validationErrors);
            }
        } else {
            $this->methodNotAllow();
        }
    }

    /**
     * xóa 1 loại sản phẩm
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

            if($this->Category->delete($params['id'])) {
                $output['status']   = API_CODE_OK;
                $output['message']  = __('Xóa thông tin loại sản phẩm thành công');
                $output['data']     = array('id' => $params['id']);
                $this->renderJson($output);
            } else {
                $this->sendError(__('Lỗi xảy ra trong quá trình xóa thông tin loại sản phẩm'), API_CODE_NG, API_HTTP_CODE_200);
            }
        } else {
            $this->methodNotAllow();
        }
    }


    /**
     * Api hiển thị dang sách theo dạng list combobox của category
     */
    public function getComboList() {
        if($this->request->is('get')) {
            $output = $this->getBaseOutputParams();

            $output['status']   = API_CODE_OK;
            $output['message']  = __('Danh sách combobox loại sản phẩm');
            $output['data']     = $this->Category->find('list', array('fields' => array('id', 'name')));
            $this->renderJson($output);
        } else {
            $this->methodNotAllow();
        }
    }
}