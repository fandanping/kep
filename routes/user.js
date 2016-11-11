var express = require('express');
var router = express.Router();
var C = require('../controllers/user.js')

//跳转个人中心
router.get('/:username', function(req, res){
    res.render("personal");
})
//跳转个人中心
router.get('/:username/setting', function(req, res){
    res.render("setting");
})
//退出
router.get('/:username/logout', C.doLogout)
module.exports = router;