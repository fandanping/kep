$(function(){
    $('#content').summernote({
        height: 300,
        lang: 'zh-CN'
    });
    $('#content').on('summernote.blur', function() {
        $('#content').html($('#content').summernote('code'));
    });
})