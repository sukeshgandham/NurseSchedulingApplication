<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NurseDisplay.aspx.cs" Inherits="NurseSchedulingApplication.NurseDisplay" %>

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
      <link href="Content/Gridview.css" rel="stylesheet" />
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
                    <h1><asp:Label ID="lblusername" runat="server" class="logo"></asp:Label><a href="#" class="logo"><span>Nurse Safe Guard</span></a></h1>
                    <ul class="list-unstyled components mb-5">
                        <li>
                            <asp:Label ID="lblloggedinusername" runat="server" class="fa fa-user-circle" Text="Label"></asp:Label>
                        </li>
                        <li>
                            <a href="#"><span class="fa fa-home mr-3"></span>Home</a>
                        </li>
                        <li>
                            <a href="#"><span class="fa fa-briefcase mr-3"></span>Provide Availabilty</a>
                        </li>
                        <li>
                            <a href="#"><span class="fa fa-user mr-3"></span>Update Profile</a>
                        </li>
                        <li>
                            <a href="#"><span class="fa fa-user mr-3"></span>Update Preferences</a>
                        </li>

                        <li class="active" >
                            <a href="#"><span class="fa fa-suitcase mr-3"></span>Allocated Shifts</a>
                        </li>
                         <li>
                            <a href="/Login.aspx"><span class="fa fa-sign-out mr-3"></span>Logout</a>
                        </li>

                    </ul>
                </div>

            </nav>

            <!-- Page Content  -->
            <div id="content" class="p-4 p-md-5 pt-5">
                <h1>View Slots</h1>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <h2>Allocated Slots</h2>
                            <asp:GridView ID="grdviewAllocatedslots" CssClass="mydatagrid"  PagerStyle-CssClass="pager"
 HeaderStyle-CssClass="header"  runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AllowPaging="true" >
                                <Columns>
                                    <asp:BoundField DataField="nu_location" HeaderText="Location" SortExpression="nu_location" />
                                    <asp:BoundField DataField="nu_shiftDate" HeaderText="Shift Date" SortExpression="nu_shiftDate" DataFormatString="{0:D}" />
                                    <asp:BoundField DataField="nu_s1" HeaderText="Shift 1" SortExpression="nu_s1" />
                                    <asp:BoundField DataField="nu_s2" HeaderText="Shift 2" SortExpression="nu_s2" />
                                    <asp:BoundField DataField="nu_s3" HeaderText="Shift 3" SortExpression="nu_s3" />
                                    <asp:BoundField DataField="nu_s4" HeaderText="Shift 4" SortExpression="nu_s4" />
                                    <asp:BoundField DataField="nu_isAllocated" HeaderText="Is Allocated" SortExpression="nu_isAllocated" />
                                </Columns>
                            </asp:GridView>
                        
                            <br />
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server"  ConnectionString="<%$ conString %>" SelectCommand="SELECT [nu_location], [nu_shiftDate], [nu_s1], [nu_s2], [nu_s3], [nu_s4], [nu_isAllocated] FROM [nur_preferences]"></asp:SqlDataSource>
                        
                          </div>

                    </div>

                    <div class="col-md-6">
                    

                    </div>
                </div>
                <div class="row">
                    

                    
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
      
</script>

  </body>
</html>
