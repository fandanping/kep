$(function(){
    $('[data-toggle="tooltip"]').tooltip();
    $("[data-reply-user]").on('click', function(){
        var userName = $(this).attr("data-reply-user");
        $("#content").val($("#content").val()+"@"+userName+" ").focus();
    })


    $('#content').summernote({
        height: 300,
        lang: 'zh-CN',
        placeholder: '请输入内容...'
    });
    $('#content').on('summernote.blur', function() {
        $('#content').html($('#content').summernote('code'));
    });
})