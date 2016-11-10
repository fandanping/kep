var dbUtils = require('../utils/dbUtils.js');
var sql = require('../sqlmapping/topic-sql.js');

var req_id;
module.exports = {
    getIndexData: function(req, res){
        console.log("123123123123");
        req_id=req.params.id;
        var data = {};
        dbUtils.execute(sql.SELECT_TOPIC,req_id, function(err, results){
            data.topic = JSON.parse(results);
            dbUtils.execute(sql.SELECT_STATISTIC, req_id, function(err, results){
                data.statistic = JSON.parse(results);
                console.log(JSON.stringify(data))
                res.render('detail', data);

            })
        })
    }
}