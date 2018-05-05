<?php
/**
 * Created by PhpStorm.
 * User: Admin
 * Date: 2/9/2018
 * Time: 11:10 AM
 */
App::uses('AppModel', 'Model');

class User extends AppModel {

    public $name            = 'User';
    public $displayField    = 'name';
    public $useTable        = 'users';

    public $actsAs = array(
        'Containable',
        'MeioUpload' => array(
            'avatar' => array(
                'dir'               => 'files{DS}images',
                'create_directory'  => true,
                'allowed_mime'      => array('image/jpeg', 'image/pjpeg', 'image/png', 'image/gif'),
                'allowed_ext'       => array('.jpg', '.jpeg', '.png', '.gif'),
                'zoomCrop'          => true,
                'max_size'          => 1000000,
                'default'           => null
            )
        )
    );

    public $validate = array(
        'email' => array(
            'notempty' => array(
                'rule'      => 'notempty',
                'message'   => 'Địa chỉ email không được để trống'
            ),
            'email' => array(
                'rule'          => array('email'),
                'message'       => 'Địa chỉ email không đúng định dạng'
            ),
            'isUnique' => array(
                'rule'      => 'isUnique',
                'message'   => 'Địa chỉ email đã được sử dụng, hãy thử một địa chỉ email khác'
            )
        ),
        'password' => array(
            'notempty' => array(
                'rule'      => 'notempty',
                'message'   => 'Mật khẩu không được để trống'
            )
        ),
        'first_name' => array(
            'notempty' => array(
                'rule'      => 'notempty',
                'message'   => 'Họ không được để trống'
            )
        ),
        'last_name' => array(
            'notempty' => array(
                'rule'      => 'notempty',
                'message'   => 'Tên không được để trống'
            )
        ),
        'date_of_birth' => array(
            'date' => array(
                'rule'          => array('date', 'ymd'),
                'message'       => 'Ngày sinh không đúng định dạng (năm-tháng-ngày)',
                'allowEmpty'    => true
            )
        ),
        'avatar' => array(
            'Empty' => array(
                'check' => false
            )
        )
    );

}