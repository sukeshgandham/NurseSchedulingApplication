<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Hospital.aspx.cs" Inherits="NurseSchedulingApplication.Hopsital" %>

<!DOCTYPE html>

<html>
  <head>
  	<title>Sidebar 05</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
		
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
		
    <link href="Common/CSS/Custom/style.css" rel="stylesheet" />
    <link href="Common/CSS/Custom/pikaday.css" rel="stylesheet" />
  </head>
  <body>
		<form runat="server">
		<div class="wrapper d-flex align-items-stretch">
            <nav id="sidebar">
                <div class="custom-menu">
                    <button type="button" id="sidebarCollapse" class="btn btn-primary">
                        <i class="fa fa-bars"></i>
                        <span class="sr-only">Toggle Menu</span>
                    </button>
                </div>
                <div class="p-4">
                    <h1><a href="index.html" class="logo">Hospital Employee <span>Nurse Safe Guard</span></a></h1>
                    <ul class="list-unstyled components mb-5">
                        <li>
                            <asp:Label ID="lblloggedinusername" runat="server" class="fa fa-user-circle" Text="Label"></asp:Label>
                        </li>
                        <li>
                            <a href="#"><span class="fa fa-home mr-3"></span>Home</a>
                        </li>
                        <li class="active">
                            <a href="#"><span class="fa fa-briefcase mr-3"></span>Provide Shift Requests</a>
                        </li>
                        <li>
                            <a href="#"><span class="fa fa-user mr-3"></span>Update Profile</a>
                        </li>
                        <li>
                            <a href="#"><span class="fa fa-suitcase mr-3"></span>Allocated Shifts</a>
                        </li>
                        <li>
                            <a href="ResetPassword.aspx"><span class="fa fa-sign-out mr-3"></span>Reset Password</a>
                        </li>
                         <li>
                            <a href="/Login.aspx"><span class="fa fa-sign-out mr-3"></span>Logout</a>
                        </li>

                    </ul>
                </div>

            </nav>

            <!-- Page Content  -->
            <div id="content" class="p-4 p-md-5 pt-5">
                <h1>Hospital</h1>
                <div class="row">
                    <div class="col-md-6">

                        <div class="form-group">
                            <h2>Date</h2>
                            <asp:TextBox ID="TextBox1" runat="server" Width="122px"></asp:TextBox>

                        
                            <asp:ImageButton ID="ImageButton1" runat="server" Height="20px" ImageAlign="Top" ImageUrl="~/Common/Images/calender.png" Width="16px" OnClick="ImageButton1_Click" />
        
                            <br />
                            <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="Black" BorderStyle="Solid" CellSpacing="1" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="250px" NextPrevFormat="ShortMonth" Width="330px" OnSelectionChanged="Calendar1_SelectionChanged" OnDayRender="Calendar1_DayRender">
                                <DayHeaderStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" Height="8pt" />
                                <DayStyle BackColor="#CCCCCC" />
                                <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="White" />
                                <OtherMonthDayStyle ForeColor="#999999" />
                                <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                                <TitleStyle BackColor="#333399" BorderStyle="Solid" Font-Bold="True" Font-Size="12pt" ForeColor="White" Height="12pt" />
                                <TodayDayStyle BackColor="#999999" ForeColor="White" />
                            </asp:Calendar>

                        
                          </div>

                    </div>
 
                </div>
                <div class="row">
                    <div class="col-md-9">
                        <div class="form-group">
                            <h3>Location</h3>
                            <asp:DropDownList ID="ddllocation" runat="server">
                                <asp:ListItem>Laval</asp:ListItem>
                                <asp:ListItem>Notredam</asp:ListItem>
                                <asp:ListItem>Montreal centre</asp:ListItem>
                            </asp:DropDownList>
                           
                        </div>

                    </div>

                    
                </div>
                
                <div class="row">
                    <div class="col-md-9">
                        <div class="form-group">
                            <h3>select shifts</h3>
                            <table style="width: 100%;">
                                <tr>
                                     <td>
                                        
                                    </td>
                                    <td>
                                        Shift 1 (8 AM - 8 PM)
                                    </td>
                                    <td>
                                         Shift 2 (8PM - 12 AM)
                                    </td>
                                    <td>
                                         Shift 3 (12am - 8am)
                                    </td>
                                    <td>
                                         Shift 4 (8pm-7am)
                                    </td>
                                </tr>
                                <tr>
                                     <td style="font:bold">No.of Nurses Required</td>
                                    <td> <asp:TextBox ID="txtbxShift1" runat="server"></asp:TextBox></td>
                                    <td> <asp:TextBox ID="txtbxShift2" runat="server"></asp:TextBox></td>
                                    <td> <asp:TextBox ID="txtbxShift3" runat="server"></asp:TextBox></td>
                                    <td> <asp:TextBox ID="txtbxShift4" runat="server"></asp:TextBox></td>
                                  
                                </tr>
                               
                            </table>
                        </div>

                    </div>

                    
                </div>
                <div class="row">
                    <div class="col-md-9">
                        <div class="form-group">
                            <asp:Button ID="btnRegister" runat="server" Text="Submit" OnClick="btnRegister_Click" />
                      
                            </div>
                    </div>

                    
                </div>

            </div>
        </div>
    </form>
    
        <script src="Common/JS/Custom/jquery.min.js"></script>
        <script src="Common/JS/Custom/popper.js"></script> 
        <script src="Common/JS/Custom/bootstrap.min.js"></script>   
        <script src="Common/JS/Custom/main.js"></script>
         <script src="Common/JS/Custom/pikaday.js"></script>
        <script type="text/javascript">
        var picker = new Pikaday(
    {
        field: document.getElementById('txtbxnfrom'),
        firstDay: 1,
        minDate: new Date('2021-01-01'),
        maxDate: new Date('2030-12-31'),
        yearRange: [2021, 2030],
        numberOfMonths: 1,
        theme: 'dark-theme'
              });

    var picker1 = new Pikaday(
    {
        field: document.getElementById('txtbxnto'),
        firstDay: 1,
        minDate: new Date('2021-01-01'),
        maxDate: new Date('2030-12-31'),
        yearRange: [2021, 2030],
        numberOfMonths: 1,
        theme: 'dark-theme'
    });
</script>
  </body>
</html>
