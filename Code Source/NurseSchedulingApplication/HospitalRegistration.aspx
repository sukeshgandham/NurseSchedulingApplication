<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HospitalRegistration.aspx.cs" Inherits="NurseSchedulingApplication.HospitalRegistration" %>

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
                                <a class="nav-link" id="home-tab" href="Registration.aspx">Nurse</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" id="Hospital-profile-tab" data-toggle="tab" href="#Hospitalprofile" role="tab" aria-controls="profile1" aria-selected="false">Hospital</a>
                            </li>
                              <li class="nav-item">
                                <a class="nav-link" href="AgencyRegistration.aspx">Agency</a>
                            </li>
                        </ul>
                        <div class="tab-content" id="myTabContent">
                          
                         
                                <h3 class="register-heading">Hospital Registration</h3>
                                <div class="row register-form">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input id="txtbxihospitalname" type="text" runat="server" class="form-control" placeholder="Hospital Name" required="required" />
                                        </div>
                                        <div class="form-group">
                                            <input id="txtbxiAddress" type="text" runat="server" class="form-control" placeholder="Address" />
                                        </div>
                                        <div class="form-group">
                                            <input id="txtbxihospitalphone" type="text" runat="server" class="form-control" placeholder="Phone *"  />
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
                                            <input id="txtbxihospitalAnswer" runat="server" class="form-control" placeholder="Answer*" type="text" />
                                        </div>
                                           <div class="form-group">
                                             <input type="email" id="txtbxhospitalemail" runat="server" class="form-control" placeholder="Email *" value="">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                         <div class="form-group">
                                            <input type="text" id="txtbxhospitalauthID" runat="server" class="form-control" placeholder="Hospital authorization ID *" value="" required="required">
                                        </div>
                                        <div class="form-group">
                                            <input type="text" id="txtbxhospitalLocation" runat="server" class="form-control" placeholder="Location" value="" required>
                                           
                                        </div>
                                     
                                         <div class="form-group">
                                             <input type="text" id="txtbxhospiuserid" runat="server" class="form-control" placeholder="UserID" value="" />
                                           
                                        </div>
                                           <br />
                                        <div class="form-group">
                                            <input type="password" id="txtbxhospitalpwd" runat="server" class="form-control" placeholder="Password *" value="">
                                        </div>
                                     
                                        <div class="form-group">
                                            <input type="password" id="txtbxhospitalcnfmpwd" runat="server" class="form-control" placeholder="Confirm Password *" value="">
                                        </div>
                                        <asp:Button ID="btnHospitalReg"  runat="server" Text="Register"  OnClick="btnHospitalReg_Click1"/>
                                        
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
        });
    </script>--%>
</html>
