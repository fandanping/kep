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
                data.statistic = JSON.parse(results);
                console.log(JSON.stringify(data))
                res.render('index', data);
            })
        })
    },
    doRegister: function(req, res){
        dbUtils.execute(sql.INSERT_USER, [UUIDUtils.generateUUID(),req.body.username,req.body.password,req.body.mail], function(err, results){
            if(err){
                return next(err);
            }
            res.redirect('login');
        })
    },
    doLogin: function(req, res){
        dbUtils.execute(sql.CHECK_USER, [req.body.username,req.body.password], function(err, results){
            if(err){
                return next(err);
            }
            var count = JSON.parse(results)[0].COUNT;
            if(count){
                req.session.username = req.body.username;
                res.redirect('/user/'+req.body.username);
            }else{
                res.redirect('/login');
            }

        })
    }
}