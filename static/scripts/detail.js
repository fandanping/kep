$(function(){
    $('[data-toggle="tooltip"]').tooltip();
    $("[data-reply-user]").on('click', function(){
        var userName = $(this).attr("data-reply-user");
        $("#content").val($("#content").val()+"@"+userName+" ").focus();
    })
})