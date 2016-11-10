var dbUtils = require('../utils/dbUtils.js');
var sql = require('../sqlmapping/index-sql.js');


module.exports = {
    getIndexData: function(req, res){
        var data = {};
        dbUtils.execute(sql.SELECT_TOPIC_LIST, null, function(err, results){
            data.topic = JSON.parse(results);
            dbUtils.execute(sql.SELECT_STATISTIC, null, function(err, results){
                data.statistic = JSON.parse(results);
                console.log(JSON.stringify(data))
                res.render('index', data);
            })
        })
    }
}