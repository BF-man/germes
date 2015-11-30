(function() {
    var usersListTpl = Handlebars.compile($("#users_list_tpl").html());
    //var showbillTpl = Handlebars.compile($("#showbill_tpl").html());

    $.support.cors = true;

    var germesAPI = germes_server_url + "?callback=?&format=json&";
    var showbillURL = germes_server_url + "/showbill" + "?callback=?&format=json&";
    var sign_inURL = germes_server_url + "/users/sign_in.json" ;

    $.ajax({
        url: germesAPI,

        // The name of the callback parameter, as specified by the YQL service
        jsonp: "callback",

        timeout: 5000, // Some timeout value that makes sense
        // Tell jQuery we're expecting JSONP
        dataType: "jsonp",
        contentType: "application/json; charset=utf-8",

        // Tell YQL what we want and that we want JSON
        //data: {
        //    q: "select title,abstract,url from search.news where query=\"cat\"",
        //    format: "json"
        //},

        // Work with the response
        success: function( response ) {
            $('#content_yield').append(usersListTpl(response));
        },
        error: function(response){
            alert('Something went wrong. Check your internet connection.');
        }
    });


    $.ajax({
        url: showbillURL,
        jsonp: "callback",
        timeout: 5000,
        dataType: "jsonp",
        contentType: "application/json; charset=utf-8",

        success: function( response ) {
            $('#showbill_yield').append(response.description);
        },
        error: function(response){
            alert('Something went wrong. Check your internet connection.');
        }
    });


    $('#sign_in').click(function() {
        alert('sign in');
        $.ajax({
            method: "POST",
            url: sign_inURL,
            dataType: "json",
            data:{
                user: {
                    email: "hulk@example.com",
                    password: "12345678",
                    remember_me: 1
                }
            },

            success: function( response ) {
                alert(response);
            },
            error: function(response){
                alert('Something went wrong. Check your internet connection.');
            }
        });
    });

    $('#sign_up').click(function() {
        alert('sign up');
    });
})();
