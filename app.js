var express = require('express');
var app = express();
app.use(require('body-parser')());
//引入session中间件
var session = require('express-session');
app.set('port', process.env.PORT || 3000);
var config = require('./config');

//routes
var index = require('./routes/index');
var user = require('./routes/user');
var topic = require('./routes/topic');


//设置handlebars视图引擎，并设置main.handlebars为默认模板
var handlebars =require('express3-handlebars').create({
    defaultLayout:'main',
    helpers: {
        section: function(name, options){
            if(!this._sections) this._sections = {};
            this._sections[name] = options.fn(this);
            return null;
        },
        //新增辅助方法，作用：索引值加1
        addOne: function(index){
            //利用+1的时机，在父级循环对象中添加一个_index属性，用来保存父级每次循环的索引
            this._index = index+1;
            //返回+1之后的结果
            return this._index;
        },
        //新增辅助方法，作用：激活选中菜单
        setActiveCategory: function(v1, v2){
            if(v1==v2){
                return "active";
            }else{
                return "";
            }
        },
        //新增辅助方法，作用：获取分类名
        getCategoryName: function(key){
            return config.category[key];
        },
        //新增辅助方法，作用：修改主题页面，选中主题分类
        setSelectedOption: function(v1, v2){
            if(v1==v2){
                return "selected";
            }else{
                return "";
            }
        },
        //新增辅助方法，作用：判断是否显示修改帖子按钮
        ifShowEditBtn: function(v1, v2, options){
            if(v1==v2){
                return options.fn(this);
            }
        },
        generatePage: function(pagination){
            var page=pagination.curPage,limit=pagination.limit,total=pagination.total,pageCount=Math.ceil(total/limit);
            /*if(pageCount){
                var pageArr=[];
                if(page==1){
                    pageArr.push(1);
                    for(var i=2;i<=5&&i<=pageCount;i++){
                        pageArr.push(i);
                    }
                }else if(page==2){

                }
            }*/
        },
        //处理评论内容，给@[username] 添加a标签
        setUserName: function(content){
            var matchArr = content.match(/@[\w@]*/g);
            if(matchArr instanceof Array){
                matchArr.forEach(function(el){
                    var reg = new RegExp(el, "g");
                    var userName=el.replace('@','');
                    content = content.replace(reg,"<a href='/user/"+userName+"'>"+el+"</a>");
                })
            }
            return content;
        }

    }
});
app.engine('handlebars', handlebars.engine);
app.set('view engine', 'handlebars');
app.use(session({
    secret: '123',
    cookie: {maxAge: 3600000},
    rolling: true,
    resave: true,
    saveUninitialized: true
}));
//配置静态资源
app.use(express.static(__dirname+'/static'));

//全局变量里存储user信息中间件
app.use(function(req, res, next){
    res.locals.user = req.session.user;
    res.locals.category = config.category;
    next();
});

//routes
app.use('/', index);
app.use('/user', user);
app.use('/topic', topic);

//定制404页面
app.use(function(req, res){
    //res.type('text/plain');
    res.status(404);
    //res.send('error 404');
    res.render('404');
})
//定制500页面
app.use(function(req, res){
    //res.type('text/plain');
    res.status(500);
    //res.send('error 500');
    res.render('500');
})

//配置服务器监听
app.listen(app.get('port'), function(){
    console.log("server start");
})