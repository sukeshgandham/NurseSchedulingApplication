<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="NurseSchedulingApplication.Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Registration Form</title>
    <link href="Common/CSS/Custom/theme.css" rel="stylesheet" />
    <link href="Common/CSS/Custom/site.css" rel="stylesheet" />
    <link href="Common/CSS/Custom/pikaday.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js">
        </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <script src="Common/JS/Custom/pikaday.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
    

    
<link href="Common/CSS/Custom/register.css" rel="stylesheet" />
</head>

<body>
    <form id="form1" runat="server" name="nurseform">
            <div class="container register">
                <div class="row">
                    
                    <div class="col-md-3 register-left">
                        <img src="Common/Images/Logo.jpg" alt=""/>
                        <h3>Welcome to Nurse Safe Guard </h3>
                       
                       <a href="Login.aspx" class="btnRegister">Login</a>
                    </div>
                    <div class="col-md-9 register-right">
                        <ul class="nav nav-tabs nav-justified" id="myTab" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Nurse</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link"  href="HospitalRegistration.aspx" role="tab" aria-controls="profile1" aria-selected="false">Hospital</a>
                            </li>
                              <li class="nav-item">
                                <a class="nav-link" id="Agency-profile-tab" href="AgencyRegistration.aspx" >Agency</a>
                            </li>
                        </ul>
                        <div class="tab-content" id="myTabContent">
                          
                            <div class="tab-pane fade active show" id="home" role="tabpanel" aria-labelledby="home-tab">
                                <h3 class="register-heading">Nurse Registration</h3>
                                <div class="row register-form">
                                    <div class="col">
                                        <div class="form-group">
                                            <input type="text"  required="required" class="form-control" name="firstname" ng-model="firstname" placeholder="First Name*" value="" id="txtbxnfirstname" runat="server"/>
                                           <%-- <span style="color:red" ng-show="myForm.firstname.$dirty && myForm.firstname.$invalid">
                                            <span ng-show="myForm.firstname.$error.required">Username is required.</span>
                                            </span>--%>
                                           
                                        </div>
                                        <div class="form-group">
                                            <div>
                                            <input type="text"  required="required" class="form-control" placeholder="Last Name *" value="" id="txtbxnrlastname" runat="server" ng-model="nurseform.firstName" ng-required="true"/></div>
                                            <%-- <div><span ng-show="nurseform.firstname.$touched && nurseform.firstname.$error.required">First name is required.</span><br /><br /></div>--%>
                                        </div>
                                         <div class="form-group">
                                              <input type="text"  required="required" class="form-control" placeholder="Date of birth" value="" id="txtbxndob" runat="server"/>

                                         </div>                                        
                                        <div class="form-group">
                                            <input type="email"  required="required" class="form-control" placeholder="Your Email *" id="txtbxemail" value="" runat="server"/>
                                        </div>
                                         <div class="form-group"> 
                                            <select class="form-control" runat="server" id="selectqualifications">
                                                <option class="hidden" selected="" disabled="">Please select your Qualification</option>
                                                <option>Masters</option>
                                                <option>Bachelors</option>
                                                <option>Post-secondary</option>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <select class="form-control" runat="server" id="selectsecurityques">
                                                <option class="hidden" selected="" disabled="">Please select your Security Question</option>
                                                <option>What is your Birthdate?</option>
                                                <option>What is Your old Phone Number</option>
                                                <option>What is your Pet Name?</option>
                                            </select>
                                        </div>
                                          <div class="form-group">
                                            <input  required="required" type="text" class="form-control" placeholder="Enter Your Answer *" value="" id="txtbxsecanswer" runat="server"/>
                                        </div>
                                     
                                    </div>
                                    <div class="col-md-6">
                                         <div class="form-group"> 
                                            <input type="text" class="form-control" placeholder="Address"  value="" id="txtbxnaddress" runat="server" />
                                        </div>
                                        <div class="form-group">
                                            <input  required="required" type="text" minlength="10" maxlength="10" id="txtEmpphone" name="txtEmpPhone" class="form-control" placeholder="Your Phone *" value="" runat="server"/>
                                        </div>
                                 
                                        <div class="form-group">
                                             <select class="form-control" id="selectdesignation" runat="server">
                                                <option class="hidden" selected="" disabled="">Please select your Designation</option>
                                                <option>GNM</option>
                                                <option>RNM</option>
                                            </select>
                                        </div>
                                         <div class="form-group"> 
                                            <select class="form-control" runat="server" id="selectyearsofexp">
                                                <option class="hidden" selected="" disabled="">Years of practice as a nurse</option>
                                                <option>0</option>
                                                <option>2</option>
                                                <option>4</option>
                                                 <option>6</option>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                             <input type="text"  required="required" class="form-control" placeholder="User ID" value="" id="txtbxUserID" runat="server"/>
                                        </div>
                                        <div class="form-group">
                                            <input type="password"  required="required" class="form-control" placeholder="Password *" value="" runat="server" id="txtbxpwd"/>
                                        </div>
                                          <div class="form-group"> 
                                            <input type="password"  required="required" class="form-control" placeholder="Confirm Password *" value="" runat="server" id="txtbxconpwd"/>
                                               <span id='message'></span>
                                        </div>

                                        <asp:Button ID="btnNurseRegister" ValidationGroup="NUrse" runat="server" Text="Register" OnClick="btnNurseRegister_Click" />
                                    </div>
                                </div>
                            </div>
                       
                        </div>
                    </div>
                </div>
  
            </div>		
          </form>
   
    </body>
     <script type="text/javascript">
        var picker = new Pikaday(
    {
        field: document.getElementById('txtbxndob'),
        firstDay: 1,
        minDate: new Date('1980-01-01'),
        maxDate: new Date('2030-12-31'),
        yearRange: [1980, 2030],
        numberOfMonths: 2,
        theme: 'dark-theme'
             });

          
    
</script>
    <script>
    $(document).ready(function () {
                $('#txtbxpwd, #txtbxconpwd').on('keyup', function () {
                  if ($('#txtbxpwd').val() == $('#txtbxconpwd').val()) {
                    $('#message').html('Matching').css('color', 'white');
                  } else 
                    $('#message').html('Not Matching').css('color', 'red');
            });

          
        });
          
   <%-- <script type="text/javascript">
        $(document).ready(function () {
            $('#btnNurseRegister').click(function () {
               
                $("form input").on("invalid", function() {
                    //find tab id           
                    var element = $(this).closest('.ui-tabs-panel').index();
                     //goto tab id
                    $('#myTab').tabs('option', 'active', element)
             });


            });
        });--%>
    </script>
</html>
