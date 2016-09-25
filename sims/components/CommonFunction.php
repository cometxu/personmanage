<?php
/**
 * Created by PhpStorm.
 * User: locky
 * Date: 2016/9/7
 * Time: 22:33
 */
namespace sims\components;

class CommonFunction{
    /**
     * 返回键值对
     * @param array $list
     * @param string $key
     * @param string $value
     * @return array
     */
    function toKeyValueList($list, $key, $value){
        $keyValue = [''=>'请选择'];
        foreach ($list as $item) {
            $keyValue[$item[$key]] = $item[$value];
        }
        return $keyValue;
    }
}