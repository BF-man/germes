(function() {
    var usersListTpl = Handlebars.compile($("#users_list_tpl").html());
    //var germesAPI = "http://192.168.33.211:3000?callback=?";
    var germesAPI = germes_server_url + "?callback=?";
    alert('2');

    //$.getJSON( germesAPI, {
    //  tagmode: "any",
    //  format: "json"
    //})
    //  .done(function(data) {
    //    $('.content').append(usersListTpl(data));
    //    alert('3');
    //  })
    //  .fail(function(data) {
    //      console.log( "error" );
    //      alert(data);
    //      $('.content').append(usersListTpl(data));
    //      alert('4');
    //    })
    //  .always(function() {
    //      console.log( "complete" );
    //      alert('5');
    //    });

    $.support.cors = true;
    var germesAPI = germes_server_url + "?callback=?&format=json&";
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
            //alert( response ); // server response
            $('.content').append(usersListTpl(response));
        },
        error: function(response){
            alert(response);
        }
    });


    //$.support.cors = true;
    //var germesAPI = germes_server_url + "?format=json";
    //$.ajax({
    //    url: germesAPI,
    //
    //    // The name of the callback parameter, as specified by the YQL service
    //
    //    timeout: 5000, // Some timeout value that makes sense
    //    // Tell jQuery we're expecting JSONP
    //    dataType: "json",
    //    contentType: "application/json; charset=utf-8",
    //
    //    // Tell YQL what we want and that we want JSON
    //    //data: {
    //    //    q: "select title,abstract,url from search.news where query=\"cat\"",
    //    //    format: "json"
    //    //},
    //
    //    // Work with the response
    //    success: function( response ) {
    //        //alert( response ); // server response
    //        $('.content').append(usersListTpl(response));
    //    },
    //    error: function(response){
    //        alert(response.toString());
    //    }
    //});
})();

//.done(function( data ) {
//    var data1 = {
//        user: {
//            name: "John",
//            email: "Smith",
//            id: "19",
//            task: "some task"
//        }
//    };
//    alert('something')
//    alert(data);
//
//});

//var germesAPI = "http://localhost:3000?callback=?users";
//$.ajax({
//  url: germesAPI,
//  type: "GET",
//  format: "json",
//  success: function (data){
//   //book_details = JSON.parse(data)
//   alert('data');
//  },
//  error: function () {
//    alert("Invalid Username/Password")
//    }
//});