<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NurseAllocatedShifts.aspx.cs" Inherits="NurseSchedulingApplication.NurseAllocatedShifts" %>

<!DOCTYPE html>

<html>
  <head>
  	<title>Allocated Slots</title>
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
                    <h1><asp:Label ID="lblusername" runat="server" class="logo"></asp:Label><a href="#" class="logo"><span>Nurse Safe Guard</span></a></h1>
                    <ul class="list-unstyled components mb-5">
                        <li>
                            <asp:Label ID="lblloggedinusername" runat="server" class="fa fa-user-circle" Text="Label"></asp:Label>
                        </li>
                        <li class="active">
                            <a href="NurseHome.aspx"><span class="fa fa-briefcase mr-3"></span>Provide Availabilty</a>
                        </li>
                        <li>
                            <a href="UpdateProfile.aspx"><span class="fa fa-user mr-3"></span>Update Profile</a>
                        </li>
                        <li>
                            <a href="UpdatePreferences.aspx"><span class="fa fa-user mr-3"></span>Update Preferences</a>
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
               <h1>Allocated shifts</h1>
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="Id" Visible="false" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                        <asp:BoundField DataField="nu_Id" Visible="false" HeaderText="nu_Id" SortExpression="nu_Id" />
                        <asp:BoundField DataField="nu_location" HeaderText="Location" SortExpression="nu_location" />
                        <asp:BoundField DataField="nu_shiftDate" HeaderText="Shift Date" SortExpression="nu_shiftDate" DataFormatString="{0:D}" />
                        <asp:BoundField DataField="nu_s1" HeaderText="Shift 1" SortExpression="nu_s1" />
                        <asp:BoundField DataField="nu_s2" HeaderText="Shift 2" SortExpression="nu_s2" />
                        <asp:BoundField DataField="nu_s3" HeaderText="Shift 3" SortExpression="nu_s3" />
                        <asp:BoundField DataField="nu_s4" HeaderText="Shift 4" SortExpression="nu_s4" />
                        <asp:BoundField DataField="nu_isAllocated" Visible="false" HeaderText="nu_isAllocated" SortExpression="nu_isAllocated" />
                    </Columns>
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    <SortedAscendingCellStyle BackColor="#FDF5AC" />
                    <SortedAscendingHeaderStyle BackColor="#4D0000" />
                    <SortedDescendingCellStyle BackColor="#FCF6C0" />
                    <SortedDescendingHeaderStyle BackColor="#820000" />
                </asp:GridView>

                <br />
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:nurse_scheduling_systemConnectionString %>" SelectCommand="SELECT * FROM [nur_preferences] WHERE (([nu_Id] = @nu_Id) AND ([nu_isAllocated] = @nu_isAllocated))">
                    <SelectParameters>
                        <asp:CookieParameter CookieName="UserID" Name="nu_Id" Type="Int32" />
                        <asp:Parameter DefaultValue="Y" Name="nu_isAllocated" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>

            </div>
            </div>
    </form>
    
        <script src="Common/JS/Custom/jquery.min.js"></script>
        <script src="Common/JS/Custom/popper.js"></script> 
        <script src="Common/JS/Custom/bootstrap.min.js"></script>   
        <script src="Common/JS/Custom/main.js"></script>
         <script src="Common/JS/Custom/pikaday.js"></script>
     


  </body>
</html>
