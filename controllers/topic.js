var dbUtils = require('../utils/dbUtils.js');
var sql = require('../sqlmapping/topic-sql.js');


module.exports = {
    showTopicDetail: function(req, res){
        var id=req.params.id;
        var data = {};
        dbUtils.execute(sql.SELECT_TOPIC,[id], function(err, results){
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
            data.topic = topic;
            res.render('detail', data);
        })
    }
}