$(document).ready(function(){
$("#rr").blur(function(){
   
  if($("#rr").val()=="")
  {
     alert("please enter password");
     $("#rr").css("background-color","#D6D6FF");
   }     
   
});



$("#uname1").blur(function(){
	
  
  if($("#uname1").val()=="")
  {
     alert("please enter username");
    $("#uname1").css("background-color","#D6D6FF");
  }
 
});


$("#password").blur(function(){
  
  if($("#password").val()=="")
  {
     alert("please enter password");
     $("#password").css("background-color","#D6D6FF");
   }     
   
});






}); 