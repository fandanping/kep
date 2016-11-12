var config = {
    mysql_database: 'kepdb',
    mysql_host: 'localhost',
    mysql_port: '3306',
    mysql_user: 'root',
    mysql_password: 'genius1023',
    mysql_connectionLimit: 20,
    BASE_WORD:'0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz',
    category: {
        'all': '全部',
        'h5': 'HTML/CSS',
        'node': 'Node.js',
        'pb': '专利业务',
        'server': '服务器',
        'java': 'JAVA',
        'js': 'javascript',
        'vue': 'Vue.js',
        'db': '数据库',
        'other': '其他'
    }

}
module.exports = config;