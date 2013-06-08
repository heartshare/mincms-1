<?php namespace app\widget\ckeditor;  
use yii\helpers\Json;
/**
* 
* @author Sun < mincms@outlook.com >
*/
class Widget extends \yii\base\Widget
{  
 	public $tag;
 	public $options; 
	function run(){  
		 if($this->options)
			$opts = ",".Json::encode($this->options);
		$base = publish(__DIR__.'/assets'); 
 		
 		if(!$this->tag) return; 
 		js(" 
 			CKEDITOR.replace('".$this->tag."'".$opts."); 
 		"); 
 		js_file($base.'/ckeditor.js'); 
	}
}