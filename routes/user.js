var express = require('express');
var router = express.Router();

//跳转个人中心
router.get('/:username', function(req, res){
    res.render("personal");
})
//跳转个人中心
router.get('/:username/setting', function(req, res){
    res.render("setting");
})
module.exports = router;