$(document).ready(function() {
    $("#user_username").blur(function(){
        var username = $("#user_username").val();
        if (username.length!=0 && username!='' ){
            console.log("Inside");
            $.ajax({
            url: '/check_username',
            method: 'get',
            data: {"username":username},
            success: function(data){
                if(data.status){
                    $("#user_username").css('color', 'green');
                }else {
                    $("#user_username").css('color', 'red');
                }
            }
        });}
    });
});
