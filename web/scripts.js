/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function Validation() {
    // body...
    var regex = /^[A-Za-z\s]{1,}$/;
    var Regemail=/^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$/;
    var mobreg=/^[0-9]+$/;
     var pass  = /^[a-zA-Z0-9!@#$%^&*]{6,16}$/;
    var password1 = document.regspeaker.password1.value;
    var password2 = document.regspeaker.password2.value;

    if(!document.regspeaker.Name.value.match(regex))
    {
      alert("please enter correct name");
      document.regspeaker.Name.focus();
      return false;
    }
      if (!document.regspeaker.email_id.value.match(Regemail)) 
     {
        alert("Not a valid e-mail address");
        document.regspeaker.email_id.focus();
        return false;
      }
     if((!document.regspeaker.password1.value.match(pass)) && (document.regspeaker.password1.value==""))
    {
      alert("please enter valid password");
      document.regspeaker.password1.focus();
      return false;
    } 
    if(password1 != password2)
    {
      alert("Both the passwords doesn't match");
      document.regspeaker.password2.focus();
      return false;
    }
     if(!document.regspeaker.mob.value.match(mobreg)|| document.regspeaker.mob.value.length!=10)
    {
      alert("please enter proper phone number");
      document.regspeaker.mob.focus();
      return false;
    } 
    return true;
}

  