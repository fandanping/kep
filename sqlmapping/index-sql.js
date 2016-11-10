module.exports = {
    SELECT_TOPIC_LIST: 'select * from topic',
    SELECT_STATISTIC: 'select * from statistic',
    INSERT_USER: 'insert into user(id,user_name,password,mail) values(?,?,?,?)',
    CHECK_USER: 'SELECT COUNT(1) AS COUNT FROM USER WHERE USER_NAME=? AND PASSWORD=?'
}