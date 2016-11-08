var mysql = require('mysql');
var config = require('../config.js');
var pool = mysql.createPool({
    database:config.mysql_database,
    host:config.mysql_host,
    port:config.mysql_port,
    user:config.mysql_user,
    password:config.mysql_password,
    connectionLimit:config.mysql_connectionLimit
});
module.exports = {
    //通用查询方法
    execute:function (sql,params,cb) {
        pool.getConnection(function (err,connection) {
            if (err){
                console.error('获取数据库连接异常,异常信息:'+err);
                cb(err);
            }else{
                //执行查询
                if (!params){
                    //无查询参数时
                    var query = connection.query(sql,function (err,results) {
                        if (err){
                            console.error('数据库操作发生异常,异常信息:'+err);
                            cb(err);
                        }else{
                            results = JSON.stringify(results);
                            cb(null,results);
                        }
                    });
                }else{
                    //需要查询参数时
                    var query = connection.query(sql,params,function (err,results) {
                        if (err){
                            console.error('数据库操作发生异常,异常信息:'+err);
                            cb(err);
                        }else{
                            results = JSON.stringify(results);
                            cb(null,results);
                        }
                    });

                }
                //释放数据库连接池的连接
                connection.release(function (err) {
                    if (err){
                        console.error('数据库连接池释放连接时发生异常,异常信息:'+err);
                        cb(err);
                    }
                });
            }
        });
    }
};