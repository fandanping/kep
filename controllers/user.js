var dbUtils = require('../utils/dbUtils.js');
var sql = require('../sqlmapping/user-sql.js');

module.exports = {
    doLogout: function(req, res,next){
        req.session.destroy(function(err){
            if(err){
                return next(err);
            }else{
                res.redirect("/login");
            }
        });
    },
    isLogin: function(req, res, next){
        if(!req.session.user){
            res.redirect("/login");
            return false;
        }
        next();
    },
    openUserPage: function(req, res, next){
        var data={};
        dbUtils.execute(sql.QUERY_USER_BY_USERNAME, [req.params.username], function(err, results){
            if(err){
                return next(err);
            }
            var temp = JSON.parse(results)[0];
            var personal = {
                id: temp.id,
                userName: temp.user_name,
                signature: temp.signature
            };
            data.personal=personal;
            dbUtils.execute(sql.QUERY_TOPIC_BY_USER_ID,[personal.id], function(err, results){
                if(err){
                    return next(err);
                }
                var ownTopicList =[];
                JSON.parse(results).forEach(function(el){
                    ownTopicList.push({
                        id: el.id,
                        title: el.title,
                        pageView: el.page_view,
                        replyNum: el.reply_num
                    })
                })
                data.ownTopicList=ownTopicList;
                dbUtils.execute(sql.QUERY_COMMENT_TOPIC_BY_USER_ID,[personal.id],function(err, results){
                    if(err){
                        return next(err);
                    }
                    var commentTopicList=[];
                    JSON.parse(results).forEach(function(el){
                        commentTopicList.push({
                            id: el.id,
                            title: el.title,
                            pageView: el.page_view,
                            replyNum: el.reply_num
                        })
                    })
                    data.commentTopicList=commentTopicList;
                    res.render("personal", data);
                })
            })
        })
    },
    openOwnTopic: function(req, res, next){
        var data={};
        dbUtils.execute(sql.QUERY_USER_BY_USERNAME, [req.params.username], function(err, results){
            if(err){
                return next(err);
            }
            var temp = JSON.parse(results)[0];
            var personal = {
                id: temp.id,
                userName: temp.user_name,
                signature: temp.signature
            };
            data.personal=personal;
            dbUtils.execute(sql.QUERY_TOPIC_BY_USER_ID,[personal.id], function(err, results){
                if(err){
                    return next(err);
                }
                var ownTopicList =[];
                JSON.parse(results).forEach(function(el){
                    ownTopicList.push({
                        id: el.id,
                        title: el.title,
                        pageView: el.page_view,
                        replyNum: el.reply_num
                    })
                })
                data.ownTopicList=ownTopicList;
                res.render("own-topic", data);
            })
        })
    },
    doSetting: function(req, res, next){
        var username=req.params.username;
        var data = {};
        dbUtils.execute(sql.QUERY_USER_BY_USERNAME,[username], function(err, results){
            if(err){
                return next(err);
            }
            if(JSON.parse(results).length){
                var temp = JSON.parse(results)[0];
                var u={};
                u.id = temp.id;
                u.username=temp.user_name;
                u.signature=temp.signature;
                u.password=temp.password;
                u.mail=temp.mail;
                data.u = u;
                console.log(data)
                res.render('setting', data);
            }else{
                res.status(404)
                res.render('404');
            }
        })


    }
}