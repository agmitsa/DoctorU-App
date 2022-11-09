$(document).ready(function() {

    $('#firebutton').click(function(event) {
		
		console.log("button pressed");
		
        event.preventDefault();

        //var pusernamef = $("#" + $(this).attr("data-quantity-field")).val();
		var pusernamef = $(this).attr("data-quantity-field");
		var isacceptedf = $(this).attr("data-product-quantity");
		
        //var isacceptedf = $(this).attr("");
        
        var dusernamef = $(this).attr("data-product-name");
       
		console.log("pusernamef=" + pusernamef);
		console.log("isacceptedf=" + isacceptedf);
		console.log("dusernamef=" + dusernamef);
							
        acceptReq(pusernamef, isacceptedf, dusernamef);

		showmessage('OK, Done!');
		
    });
	
	
	 $('#deletebutton').click(function(event) {
		
		console.log("button pressed");
		
        event.preventDefault();

        //var pusernamef = $("#" + $(this).attr("data-quantity-field")).val();
		var pusernamef = $(this).attr("data-quantity-field");
		var isacceptedf = $(this).attr("data-product-quantity");
		
        //var isacceptedf = $(this).attr("");
        
        var dusernamef = $(this).attr("data-product-name");
       
		console.log("pusernamef=" + pusernamef);
		console.log("isacceptedf=" + isacceptedf);
		console.log("dusernamef=" + dusernamef);
							
        deleteReq(pusernamef, isacceptedf, dusernamef);

		showmessage('OK, Done!');
		
    });
	
	    $('#addbutton').click(function(event) {
		
		console.log("button pressed");
		
        event.preventDefault();

        //var pusernamef = $("#" + $(this).attr("data-quantity-field")).val();
		var pusernamef = $(this).attr("data-quantity-field");
		var isacceptedf = $(this).attr("data-product-quantity");
		
        //var isacceptedf = $(this).attr("");
        
        var dusernamef = $(this).attr("data-product-name");
       
		console.log("pusernamef=" + pusernamef);
		console.log("isacceptedf=" + isacceptedf);
		console.log("dusernamef=" + dusernamef);
							
        sendReq(pusernamef, isacceptedf, dusernamef);

		showmessage('OK, Done!');
		
    });
	

});


function acceptReq(pusernamef, isacceptedf, dusernamef) {

    $.ajaxSetup({
        headers: {
            'X-Request-page': 'my_ajax_script'
        }
    });

    $.ajax({
            url: "acceptReq.jsp",
            type: "POST",
            data: {
                pusername: pusernamef,
                isaccepted: isacceptedf,
                dusername: dusernamef,
             
            },
            async: true
        })
        .done(function(html_out) {
            $("#request").jsp(html_out);

            showmessage('egine');

        })
        .fail(function(errormsg) {
            showmessage('<strong>Σφάλμα</strong>: ' + errormsg.responseText);
        })
}

function deleteReq(pusernamef, isacceptedf, dusernamef) {

    $.ajaxSetup({
        headers: {
            'X-Request-page': 'my_ajax_script'
        }
    });

    $.ajax({
            url: "deleteReq.jsp",
            type: "POST",
            data: {
                pusername: pusernamef,
                isaccepted: isacceptedf,
                dusername: dusernamef,
             
            },
            async: true
        })
        .done(function(html_out) {
            $("#request").jsp(html_out);

            showmessage('egine');

        })
        .fail(function(errormsg) {
            showmessage('<strong>Σφάλμα</strong>: ' + errormsg.responseText);
        })
}

function sendReq(pusernamef, isacceptedf, dusernamef) {

    $.ajaxSetup({
        headers: {
            'X-Request-page': 'my_ajax_script'
        }
    });

    $.ajax({
            url: "sendReq.jsp",
            type: "POST",
            data: {
                pusername: pusernamef,
                isaccepted: isacceptedf,
                dusername: dusernamef,
             
            },
            async: true
        })
        .done(function(html_out) {
            $("#request").jsp(html_out);

            showmessage('egine');

        })
        .fail(function(errormsg) {
            showmessage('<strong>Σφάλμα</strong>: ' + errormsg.responseText);
        })
}




function showmessage(message) {
    $("#screenmsg").html(message);
    $('#msgmodal').modal('show');
}