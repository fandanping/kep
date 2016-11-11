var express = require('express');
var router = express.Router();
var C = require('../controllers/index.js');


//首页
router.get('/', C.showIndex);
//首页分类切换
router.get('/category/:name', function(req, res){
    res.render("index");
})
//跳转登录页面
router.get('/login', function(req, res){
    res.render("login");
})
//跳转注册页面
router.get('/register', function(req, res){
    res.render("register");
})

//执行注册
router.post('/register', C.doRegister)
//执行登录
router.post('/login', C.doLogin)

module.exports = router;