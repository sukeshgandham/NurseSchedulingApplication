<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ResetPassword.aspx.cs" Inherits="NurseSchedulingApplication.ResetPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
     <title>Reset Password</title>
    <link href="Common/CSS/Custom/theme.css" rel="stylesheet" />
    <link href="Common/CSS/Custom/site.css" rel="stylesheet" />
    <link href="Common/CSS/Custom/pikaday.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js">
    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script src="Common/JS/Custom/pikaday.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>



    <link href="Common/CSS/Custom/register.css" rel="stylesheet" />

    <script type="text/javascript">
        $(document).ready(function () {
                $('#txtbxpassword, #txtbxcnfrmpassword').on('keyup', function () {
                  if ($('#txtbxpassword').val() == $('#txtbxcnfrmpassword').val()) {
                    $('#message').html('Matching').css('color', 'white');
                  } else 
                    $('#message').html('Not Matching').css('color', 'red');
            });

          
        });
          
    
    </script>
</head>
<body>
    <form id="form1" runat="server" name="nurseform">
        <div class="container register">
            <div class="row">

                <div class="col-md-3 register-left">
                    <img src="Common/Images/Logo.jpg" alt="" />
                    <h3>Welcome to Nurse Safe Guard </h3>

                   <a href="Login.aspx" class="btnRegister">Login</a>
                </div>
                <div class="col-md-9">
                        <div>
                            <h3 class="form-text">Reset Password</h3>
                            <div class="row register-form">
                                <div class="col-md-6">
                                     <div class="form-group">
                                   <select class="form-control" id="selectusertype" runat="server">
                                            <option class="hidden" selected="" disabled="">Please select Type</option>
                                            <option>Nurse</option>
                                            <option>Hospital</option>
                                            <option>Agency</option>
                                        </select>
                                    </div>

                                   <div class="form-group">
                                        <input type="text" id="txtbxUserID" runat="server" required="required" class="form-control" placeholder="User ID" value=""/>
                                    </div>
                                    <div class="form-group">
                                        <input type="password"  id="txtbxpassword" runat="server" required="required"  class="form-control" placeholder="Password *" value=""/>
                                    </div>

                                    <div class="form-group">
                                        <input type="password"  id="txtbxcnfrmpassword" runat="server" required="required"  class="form-control" placeholder="Confirm Password *" value=""/>
                                         <span id='message'></span>
                                    </div>
                                    <div class="form-group">
                                        <select class="form-control" id="selectquestion" runat="server">
                                            <option class="hidden" selected="" disabled="">Please select your Sequrity Question</option>
                                            <option>What is your Birthdate?</option>
                                            <option>What is Your old Phone Number</option>
                                            <option>What is your Pet Name?</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <input type="text" id="txtbxanswer" class="form-control" runat="server" placeholder="Answer*" value="">
                                    </div>
                                    <asp:Button ID="btnreset" runat="server" Text="Reset" OnClick="btnreset_Click" />

                              
                                    
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

        </div>
    </form>
</body>

    
</html>
