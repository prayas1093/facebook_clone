$(document).on('turbolinks:load', function() {

    $("#user_username").keypress(function(){
        if($("#user_username").hasClass('accurate') || $("#user_username").hasClass('warning')){
            $("#user_username").removeClass('accurate warning');
        }
    });

    function fieldValidationCall(elementId){
        var userInputValue = $(`#${elementId}`).val();
        if (userInputValue.length!=0 && userInputValue!='' ){
            console.log("Inside");
            console.log(userInputValue);
            $.ajax({
                url: '/check_field_validations',
                method: 'get',
                data: {"userInput":userInputValue, "fieldName": elementId},
                success: function(result){
                    if(result.status){
                        $(`${elementId}`).addClass('accurate')
                    }else {
                        console.log(elementId);
                        $(`#${elementId}`).addClass('warning');
                        var str = "<ul>";
                        for(var i in result.data){
                            str += '<li>'+result.data[i]+'</li>';
                        }
                        str += '</ul>';
                        $(`#${elementId}`).parent().append(str);
                    }
                }
            });
        }
    }

    $("input").focus(function(){
        if($(`#${this.id}`).parent().has("ul").length > 0 ){
            $(this).parent().empty('ul');
        }
    });


    $("input").blur(function(){
        switch(this.id) {
            case 'user_email':
                fieldValidationCall('user_email');
                break;
            case 'user_username':
                fieldValidationCall('user_username');
                break;
            case 'user_password':
                break;
            case 'user_first_name':
                break;
            case 'user_last_name':
                break;
            case 'user_address':
                break;
        }

    });


});
