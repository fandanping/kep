var dbUtils = require('../utils/dbUtils.js');
var sql = require('../sqlmapping/topic-sql.js');
var UUIDUtils = require('../utils/UUIDUtils.js');
var config = require('../config');


module.exports = {
    showTopicDetail: function(req, res,next){
        var id=req.params.id;
        var data = {};
        dbUtils.execute(sql.SELECT_TOPIC,[id], function(err, results){
            if(err){
                return next(err);
            }
            var temp = JSON.parse(results)[0];
            var topic={};
            topic.id = temp.id;
            topic.title = temp.title;
            topic.createTime = temp.create_time;
            topic.content = temp.content;
            topic.pageView = temp.page_view;
            topic.replyNum = temp.reply_num;
            topic.praise = temp.praise;
            topic.userId = temp.user_id;
            topic.userName=temp.user_name;
            topic.signature=temp.signature;
            topic.category=temp.category;
            data.topic = topic;
            dbUtils.execute(sql.SELECT_COMMENT,[id], function(err, results){
                if(err){
                    return next(err);
                }
                var rs = JSON.parse(results);
                var commentList = [];
                rs.forEach(function(el){
                    var comment={};
                    comment.content=el.content;
                    comment.topicId=el.topic_id;
                    comment.createTime=el.create_time;
                    comment.userName=el.user_name;
                    commentList.push(comment);
                })
                data.commentList = commentList;
                dbUtils.execute(sql. SELECT_OTHER_TOPIC,[topic.userId, topic.id], function(err, results){
                    if(err){
                        return next(err);
                    }
                    console.log(results)
                    var rs = JSON.parse(results);
                    var otherTopicList = [];
                    rs.forEach(function(el){
                        var othertopic={};
                        othertopic.id=el.id;
                        othertopic.title=el.title;
                        otherTopicList.push(othertopic);
                    })
                    data.otherTopicList = otherTopicList;
                    console.log(data);
                    res.render('detail', data);
                })
            })
        })
    },
    addComment: function(req, res, next){
        dbUtils.execute(sql.INSERT_COMMENT,[UUIDUtils.generateUUID(),req.body.content,req.body.topicId,req.session.user.id,new Date()],function(err, results){
            if(err){
                return next(err);
            }
            res.redirect('/topic/show/'+req.body.topicId);
        })
    },
    openCreateTopicPage: function(req, res, next){
        if(req.session.user){
            var data={};
            var op={};
            for(p in config.category){
                op[p]=config.category[p];
            }
            delete op.all;
            data.op=op;
            res.render("add-topic", data);
        }else{
            res.redirect('/login');
        }

    },
    addTopic: function(req, res, next){
        var id=UUIDUtils.generateUUID();
        dbUtils.execute(sql.INSERT_TOPIC,[id,req.body.title,new Date(),req.body.content,req.session.user.id,req.body.category],function(err, results){
            if(err){
                return next(err);
            }
            res.redirect('/topic/show/'+id);
        })
    }
}