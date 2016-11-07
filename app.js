var express = require('express');
var app = express();
app.use(require('body-parser')());
app.set('port', process.env.PORT || 3000);


//设置handlebars视图引擎，并设置main.handlebars为默认模板
var handlebars =require('express3-handlebars').create({
    defaultLayout:'main'
    /*helpers: {
        section: function(name, options){
            if(!this._sections) this._sections = {};
            this._sections[name] = options.fn(this);
            return null;
        }
    }*/
});
app.engine('handlebars', handlebars.engine);
app.set('view engine', 'handlebars');
//引入session中间件
app.use(require('express-session')());
//配置静态资源
app.use(express.static(__dirname+'/static'));