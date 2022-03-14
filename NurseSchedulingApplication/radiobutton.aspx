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
    <form runat="server" name="nurseform" ng-app  novalidate>
<div class="container register">
                <div class="row">
                    <div class="col-md-3 register-left">
                        <img src="Common/Images/Logo.jpg" alt=""/>
                        <h3>Welcome to Nurse Safe Guard </h3>
                        <input type="submit" name="" value="Login"/><br/>
                    </div>
                    <div class="col-md-9 register-right">
                        <ul class="nav nav-tabs nav-justified" id="myTab" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Nurse</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="Hospital-profile-tab" data-toggle="tab" href="#Hospitalprofile" role="tab" aria-controls="profile1" aria-selected="false">Hospital</a>
                            </li>
                              <li class="nav-item">
                                <a class="nav-link" id="Agency-profile-tab" data-toggle="tab" href="#Agnecyprofile" role="tab" aria-controls="profile2" aria-selected="false">Agency</a>
                            </li>
                        </ul>
                        <div class="tab-content" id="myTabContent">
                            <div class="tab-pane fade active show" id="home" role="tabpanel" aria-labelledby="home-tab">
                                <h3 class="register-heading">Nurse Registration</h3>
                                <div class="row register-form">
                                    
                                    <div class="col-md-6">
                                        <div class="form-group">
                                             <input id="txtbxfirstname" runat="server" class="form-control" placeholder="First Name" />
                                        </div>
                                        <div class="form-group">
                                              <input type="text" id="txtbxnulastname" runat="server" class="form-control" placeholder="Last Name" />
                                        </div>
                                        <div class="form-group">
                                            <input type="text" class="form-control" placeholder="Date of birth" value="" id="txtbxndob" runat="server" />
                                        </div>
                                        <div class="form-group">
                                            <input type="text" class="form-control" placeholder="Address" value="" id="txtbxnaddress" runat="server" />
                                        </div>
                                        <div class="form-group">
                                            <input type="email" class="form-control" placeholder="Your Email *" id="txtbxemail" value="" runat="server" />
                                        </div>
                                        <div class="form-group">
                                            <input type="text" id="txtEmpphone" name="txtEmpPhone" class="form-control" placeholder="Your Phone *" value="" runat="server" />
                                        </div>
                                        
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <select class="form-control" id="selectdesignation" runat="server">
                                                <option class="hidden" selected="" disabled="">Please select your Designation</option>
                                                <option>GNM</option>
                                                <option>RNM</option>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <input type="text" class="form-control" placeholder="UserID" value="" id="txtbxUserID" runat="server" />
                                        </div>
                                        <div class="form-group">
                                            <input type="password" class="form-control" placeholder="Password *" value="" runat="server" id="txtbxpwd" />
                                        </div>
                                        <div class="form-group">
                                            <input type="password" class="form-control" placeholder="Confirm Password *" value="" runat="server" id="txtbxconpwd" />
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
                                            <select class="form-control" runat="server" id="selectsecurityques">
                                                <option class="hidden" selected="" disabled="">Please select your Sequrity Question</option>
                                                <option>What is your Birthdate?</option>
                                                <option>What is Your old Phone Number</option>
                                                <option>What is your Pet Name?</option>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <input type="text" class="form-control" placeholder="Enter Your Answer *" value="" id="txtbxsecanswer" runat="server" />
                                        </div>
                                      <asp:Button ID="btnNurseRegister" runat="server" Text="Register" OnClick="btnNurseRegister_Click" />
                                    
                                    </div>
                                </div>

                                <div class="tab-pane fade" id="Hospitalprofile" role="tabpanel" aria-labelledby="Hospital-profile-tab">
                                    <h3 class="register-heading">Hospital Registration</h3>
                                    <div class="row register-form">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <asp:TextBox ID="txtbxhospitalname" runat="server" class="form-control" placeholder="Hospital Name"></asp:TextBox>
                                            </div>
                                            <div class="form-group">
                                                <asp:TextBox ID="txtbxAddress" runat="server" class="form-control" placeholder="Address"></asp:TextBox>

                                            </div>
                                            <div class="form-group">
                                                <asp:TextBox ID="txtbxhospitalphone" runat="server" class="form-control" placeholder="Phone *"></asp:TextBox>
                                            </div>
                                            <div class="form-group">
                                                <asp:DropDownList ID="ddlsecurityquestion" runat="server" CssClass="form-control">
                                                    <asp:ListItem>Please select your Sequrity Question</asp:ListItem>
                                                    <asp:ListItem>What is your Birthdate?</asp:ListItem>
                                                    <asp:ListItem>What is Your old Phone Number</asp:ListItem>
                                                    <asp:ListItem>What is your Pet Name?</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                            <div class="form-group">
                                                <asp:TextBox ID="txtbxhospitalAnswer" runat="server" class="form-control" placeholder="Answer*"></asp:TextBox>
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
                                                <input type="email" id="txtbxhospitalemail" runat="server" class="form-control" placeholder="Email *" value="">
                                            </div>
                                            <br />
                                            <div class="form-group">
                                                <input type="password" id="txtbxhospitalpwd" runat="server" class="form-control" placeholder="Password *" value="">
                                            </div>

                                            <div class="form-group">
                                                <input type="password" id="txtbxhospitalcnfmpwd" runat="server" class="form-control" placeholder="Confirm Password *" value="">
                                            </div>
                                            <asp:Button ID="btnHospitalReg" runat="server" Text="Register" OnClick="btnHospitalReg_Click" />
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="Agnecyprofile" role="tabpanel" aria-labelledby="Agency-profile-tab">
                                    <h3 class="register-heading">Agency Registration</h3>
                                    <div class="row register-form">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <input type="text" class="form-control" placeholder="Agency Name *" value="">
                                            </div>
                                            <div class="form-group">
                                                <input type="text" class="form-control" placeholder="Address" value="">
                                            </div>
                                            <div class="form-group">
                                                <input type="text" maxlength="10" minlength="10" class="form-control" placeholder="Phone *" value="">
                                            </div>
                                            <div class="form-group">
                                                <select class="form-control">
                                                    <option class="hidden" selected="" disabled="">Please select your Sequrity Question</option>
                                                    <option>What is your Birthdate?</option>
                                                    <option>What is Your old Phone Number</option>
                                                    <option>What is your Pet Name?</option>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <input type="text" class="form-control" placeholder="Answer*" value="">
                                            </div>

                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <input type="text" class="form-control" placeholder="Agency Registration Number *" value="">
                                            </div>
                                            <div class="form-group">
                                                <input type="text" class="form-control" placeholder="Location" value="">
                                            </div>
                                            <div class="form-group">
                                                <input type="email" class="form-control" placeholder="Email *" value="">
                                            </div>
                                            <br />
                                            <div class="form-group">
                                                <input type="password" class="form-control" placeholder="Password *" value="">
                                            </div>

                                            <div class="form-group">
                                                <input type="password" class="form-control" placeholder="Confirm Password *" value="">
                                            </div>
                                            <asp:Button ID="btnAgencyReg" runat="server" Text="Register" OnClick="btnAgencyReg_Click" />
                                        </div>
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

          var app = angular.module('myApp', []);
            app.controller('validateCtrl', function($scope) {
              
            });
    
</script>
</html>
