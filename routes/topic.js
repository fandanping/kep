var express = require('express');
var router = express.Router();
var C = require('../controllers/topic.js');

//主题详细信息
router.get('/show/:id', C.showTopicDetail);
//新增主题
router.get('/create', function(req, res){
    res.render("add-topic");
})
//修改主题
router.get('/edit/:id', function(req, res){
    res.render("add-topic");
})

module.exports = router;