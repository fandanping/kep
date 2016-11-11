module.exports = {
    SELECT_TOPIC_LIST: 'select t.id,title,page_view,reply_num,user_name from topic t,user u where u.id=t.user_id',
    SELECT_STATISTIC: 'select totalcommunity,totaltposts,totalreplies from statistic',
    INSERT_USER: 'insert into user(id,user_name,password,mail) values(?,?,?,?)',
    VALIDATE_USER: 'SELECT user_name,password,id,signature FROM USER WHERE USER_NAME=? AND PASSWORD=?',
    CHECK_USER: 'select * from user where user_name=?'
}