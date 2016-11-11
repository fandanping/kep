module.exports = {
    doLogout: function(req, res,next){
        console.log(213)
        req.session.destroy(function(err){
            if(err){
                return next(err);
            }else{
                res.redirect("/login");
            }
        });

    }
}