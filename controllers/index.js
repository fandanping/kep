var dbUtils = require('../utils/dbUtils.js');
var UUIDUtils = require('../utils/UUIDUtils.js');
var sql = require('../sqlmapping/index-sql.js');

module.exports = {
    showIndex: function(req, res){
        var data = {};
        dbUtils.execute(sql.SELECT_TOPIC_LIST, null, function(err, results){
            if(err){
                return next(err);
            }
            data.topic = JSON.parse(results);
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
    doRegister: function(req, res){
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
                    res.redirect('/login');
                })
            }
        })
    },
    doLogin: function(req, res){
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
                req.session.user = user;
                res.redirect('/user/'+req.body.username);
            }else{
                res.render('login', {msg: '用户名或密码错误'});
            }

        })
    }
}