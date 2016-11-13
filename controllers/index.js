var dbUtils = require('../utils/dbUtils.js');
var UUIDUtils = require('../utils/UUIDUtils.js');
var sql = require('../sqlmapping/index-sql.js');

module.exports = {
    openLoginPage: function(req, res, next){
        res.render("login");
    },
    openRegisterPage: function(req, res, next){
        res.render("register");
    },
    showIndex: function(req, res, next){
        var data = {};
        if(req.params.name){
            data.curCategory = req.params.name;
        }else{
            data.curCategory = "all";
        }
        var s=sql.SELECT_TOPIC_LIST,params=[];
        if(data.curCategory!="all"){
            s=sql.SELECT_TOPIC_LIST_BY_CATEGORY;
            params.push(data.curCategory);
        }
        dbUtils.execute(s, params, function(err, results){
            if(err){
                return next(err);
            }
            var rs = JSON.parse(results);
            var topicList = [];
            rs.forEach(function(el){
                var topic={
                    id: el.id,
                    title: el.title,
                    pageView: el.page_view,
                    replyNum: el.reply_num,
                    userName: el.user_name
                };
                if(el.category){
                    topic.category=el.category;
                }
                topicList.push(topic);
            })
            data.topicList = topicList;
            dbUtils.execute(sql.SELECT_STATISTIC, null, function(err, results){
                if(err){
                    return next(err);
                }
                var rs = JSON.parse(results)[0];
                var statistic = {
                    userCount: rs.totalcommunity,
                    topicCount: rs.totaltposts,
                    commentCount: rs.totalreplies
                }
                data.statistic = statistic;
                res.render('index', data);
            })
        })
    },
    doRegister: function(req, res, next){
        dbUtils.execute(sql.CHECK_USER, [req.body.username], function(err, results){
            if(err){
                return next(err);
            }
            if(JSON.parse(results).length){
                res.render('register', {'msg': req.body.username + '用户名已被注册'})
            }else{
                dbUtils.execute(sql.INSERT_USER, [UUIDUtils.generateUUID(),req.body.username,req.body.password,req.body.mail], function(err, results){
                    if(err){
                        return next(err);
                    }
                    res.redirect('/register-success');
                })
            }
        })
    },
    doLogin: function(req, res, next){
        dbUtils.execute(sql.VALIDATE_USER, [req.body.username,req.body.password], function(err, results){
            if(err){
                return next(err);
            }
            if(JSON.parse(results).length){
                var user = {};
                var rs = JSON.parse(results)[0];
                user.userName = rs.user_name;
                user.passWord = rs.password;
                user.id = rs.id;
                user.signature = rs.signature;
                req.session.user = user;
                res.redirect('/user/'+req.body.username);
            }else{
                res.render('login', {msg: '用户名或密码错误'});
            }

        })
    },
    openRegisterSuccess: function(req, res, next){
        res.render('register-success');
    }
}