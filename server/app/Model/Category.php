<?php
/**
 * Created by PhpStorm.
 * User: Admin
 * Date: 3/7/2018
 * Time: 9:50 AM
 */
App::uses('AppModel', 'Model');

class Category extends AppModel
{

    public $name            = 'Category';
    public $displayField    = 'name';
    public $useTable        = 'categories';

    public $actsAs = array(
        'Tree',
        'Containable',
        'Sluggable' => array(
            'label'         => 'name',
            'slug'          => 'slug',
            'separator'     => '-',
            'overwrite'     => true,
            'length'        => 255 ,
            'translation'   => 'utf-8'
        )
    );

    public $belongsTo = array(
        'ParentCategory' => array(
            'className'     => 'Category',
            'foreignKey'    => 'parent_id',
            'dependent'     => true,
            'conditions'    => '',
            'fields'        => '',
            'order'         => '',
            'limit'         => '',
            'offset'        => '',
            'exclusive'     => '',
            'finderQuery'   => '',
            'counterQuery'  => '',
            'counterCache'  => '',
        )
    );

    public $validate = array(
        'name' => array(
            'notempty' => array(
                'rule'      => 'notempty',
                'message'   => 'Tên không được để trống'
            )
        ),
        'slug' => array(
            'isUnique' => array(
                'rule'      => 'isUnique',
                'message'   => 'Đường dẫn đã tồn tại hãy nhập một đường dẫn khác',
            )
        )
    );

}