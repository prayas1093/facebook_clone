$(document).on('turbolinks:load', function() {

    $("#search_username").keyup(function(){
        var userInputValue = $("#search_username").val();
        if (userInputValue.length!=0 && userInputValue!='' ){
            $.ajax({
                url: '/search_username',
                method: 'get',
                data: {"userInput":userInputValue},
                success: function(result){
                    if(result.status){
                        $("#users").empty();
                        var i;
                        for (i = 0; i < result.data.length; i++) {
                            var optionNode = document.createElement("option");
                            optionNode.value = result.data[i];
                            document.getElementById("users").appendChild(optionNode);
                        }
                    }
                }
            });
        }else{
            $("#users").empty();
        }
    });


    $(document).on('change', 'input#search_username', function(){
        var options = $('datalist')[0].options;
        var val = $(this).val();
        for (var i=0;i<options.length;i++){
            if (options[i].value === val) {
                $('.selected-user').css("visibility","visible");
                $.ajax({
                    url: '/show_profile_remote',
                    method: 'get',
                    data: {"userInput":val},
                });
                    break;
            }
        }
    });



});