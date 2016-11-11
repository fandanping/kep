module.exports = {
    SELECT_TOPIC_LIST: 'select * from topic',
    SELECT_STATISTIC: 'select * from statistic',
    INSERT_USER: 'insert into user(id,user_name,password,mail) values(?,?,?,?)',
    VALIDATE_USER: 'SELECT user_name,password,id AS COUNT FROM USER WHERE USER_NAME=? AND PASSWORD=?',
    CHECK_USER: 'select * from user where user_name=?'
}