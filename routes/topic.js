var express = require('express');
var router = express.Router();


//主题详细信息
router.get('/show/:id', function(req, res){
    res.render("detail");
})
//新增主题
router.get('/create', function(req, res){
    res.render("add-topic");
})
//修改主题
router.get('/edit/:id', function(req, res){
    res.render("add-topic");
})

module.exports = router;