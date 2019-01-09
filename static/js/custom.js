jQuery.noConflict();
jQuery(document).ready(function($){  
    if(window.location.pathname === "/accounts/signup/"){
        $("#id_birth_date").datepicker({
            "dateFormat": "yy-mm-dd" ,
        });
    }
    
    if(window.location.pathname === "/accounts/profile/"){
        $("#id_birth_date").datepicker({
            "dateFormat": "yy-mm-dd" ,
        });
    }
        
    if(window.location.pathname.indexOf("/accommodation/propertyDetailed/")>=0){
        $("#id_checkin").datepicker({
            dateFormat: "yy-mm-dd" ,
            minDate: new Date, 
            beforeShowDay: function(date){
                var string = $.datepicker.formatDate('yy-mm-dd', date);
                return [$.inArray(string, array) == -1];
            }          
        });
        $("#id_checkout").datepicker({
            dateFormat: "yy-mm-dd" ,
            minDate: new Date,
            beforeShowDay: function(date){
                var string = $.datepicker.formatDate('yy-mm-dd', date);
                return [$.inArray(string, array) == -1];
            }
        });
    }

    if(window.location.pathname === "/accommodation/index/"){
        $("#id_inDate").datepicker({
            "dateFormat": "yy-mm-dd" ,
            minDate: new Date,
        });
        $("#id_outDate").datepicker({
            "dateFormat": "yy-mm-dd" ,
            minDate: new Date,

        });
    }
        
    $("#id_checkout").on("change", function() {
        var inDate = $("#id_checkin").datepicker('getDate');
        var outDate = $("#id_checkout").datepicker('getDate');
        if($("#id_checkin").val() != "" && outDate <= inDate){
            $("#id_checkout").val("")
            alert("Checkout date is before Checkin.");
        }
        if($("#id_checkin").val() != "" && $("#id_checkout").val() != "" ){
            console.log(parseInt($("#price").text().replace("€","")));
            console.log(getNightNumber(inDate,outDate))

            $("#totalPrice").text("€" + (getNightNumber(inDate,outDate) * parseFloat($("#price").text().replace("€",""))));            
        }
    });

    $("#id_checkin").on("change", function() {
        var inDate = $("#id_checkin").datepicker('getDate');
        var outDate = $("#id_checkout").datepicker('getDate');
        if($("#id_checkout").val() != "" && outDate <= inDate){
            $("#id_checkin").val("")
            alert("Checkin date is after Checkout.");
        }
        if($("#id_checkin").val() != "" && $("#id_checkout").val() != "" ){
            console.log(parseInt($("#price").text().replace("€","")));
            console.log(getNightNumber(inDate,outDate))

            $("#totalPrice").text("€" + (getNightNumber(inDate,outDate) * parseInt($("#price").text().replace("€",""))));            
        }
    });

    $("#id_outDate").on("change", function() {
        var inDate = $("#id_inDate").datepicker('getDate');
        var outDate = $("#id_outDate").datepicker('getDate');
        if($("#id_inDate").val() != "" && outDate <= inDate){
            $("#id_outDate").val("")
            alert("Checkout date is before Checkin.");
        }
    });

    $("#id_inDate").on("change", function() {
        var inDate = $("#id_inDate").datepicker('getDate');
        var outDate = $("#id_outDate").datepicker('getDate');
        if($("#id_outDate").val() != "" && outDate <= inDate){
            $("#id_inDate").val("")
            $("#id_outDate").val("")
            alert("Checkin date is after Checkout.");
        }
    });

    $("#editInfoBtn").click(function(){
        $("#showUserData").hide(100);
        $("#changeUserData").show(100);
    });

    $("#editAvatarBtn").click(function(){
        $("#editAvatar").hide(100);
        $("#changeAvatar").show(100);
    });

    $("#showAddPropertyBtn").click(function(){
        $("#showAddProperty").hide(100);
        $("#propertyRightColumn").show(100);
        $(".cancelUpload").show(100);
    });

    $("#cancelUpload").click(function(){
        $("#propertyRightColumn").hide(100);
        $(".cancelUpload").hide(100);
        $("#showAddProperty").show(100);
    });

    $("#modifyProperty").click(function(){
        $(".detailInfo").hide(100);
        $(".detailModify").show(100);
        
    });

    $(window).resize(function() {
        if ($(window).width() > 1660) {
            $(".cancelUpload").hide(100);
            $("#propertyRightColumn").show(100);
            $("#propertyContainerVertical").hide(100);
            $("#propertyContainerHorizontal").show(100);  
            $("showAddProperty").hide(100);
        }
        else{
            $("#propertyRightColumn").hide(100);
            $("#showAddProperty").show(100);
            $("#propertyContainerHorizontal").hide(100);
            $("#propertyContainerVertical").show(100);
        }
    });

    
});     

function responsiveMenuFunc() {
    var x = document.getElementById("topnavMenu");
    if (x.className === "topnav") {
        x.className += " responsive";
    } else {
        x.className = "topnav";
    }
}

function getNightNumber(inDate, outDate){
    // var inDate = new Date(inDate);
    // console.log(inDate);
    // var outDate = new Date(outDate);
    // console.log(outDate);
    return Math.abs(outDate-inDate)/(1000*60*60*24);
}

$(function(){
    $('.image-link').viewbox();
});