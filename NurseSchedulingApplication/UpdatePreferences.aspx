<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdatePreferences.aspx.cs" Inherits="NurseSchedulingApplication.UpdatePreferences" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link href="Common/CSS/Custom/theme.css" rel="stylesheet" />
    <link href="Common/CSS/Custom/site.css" rel="stylesheet" />
    <link href="Common/CSS/Custom/pikaday.css" rel="stylesheet" />
     <link href="Common/CSS/Custom/style.css" rel="stylesheet" />
   
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js">
    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script src="Common/JS/Custom/pikaday.js"></script>
 
     <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet"/>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
		
    <link href="Common/CSS/Custom/Updatepref.css" rel="stylesheet" />
       <script src="Common/JS/Custom/jquery.min.js"></script>
        <script src="Common/JS/Custom/popper.js"></script> 
        <script src="Common/JS/Custom/bootstrap.min.js"></script>   
        <script src="Common/JS/Custom/main.js"></script>
         <script src="Common/JS/Custom/pikaday.js"></script>
        
</head>
<body>
   <form id="form1" runat="server" name="nurseform">
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
                            <a href="NurseAllocatedShifts.aspx"><span class="fa fa-suitcase mr-3"></span>Allocated Shifts</a>
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
             <div id="content" class="p-4 p-md-5 pt-5">
                <h1>Update Preferences</h1>
                <div class="col-md-12">
                        <div>
                            <div class="form-group">

                                <asp:GridView ID="GridView1"  runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" AllowPaging="True" CellPadding="4" ForeColor="#333333" GridLines="None" AllowSorting="True">
                                    <AlternatingRowStyle BackColor="White" />
                                    <Columns>
                                        <asp:CommandField ShowEditButton="True" />
                                        <asp:BoundField DataField="Id" Visible="false" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                                        <asp:BoundField DataField="nu_Id"  HeaderText="Nurse ID" SortExpression="nu_Id" />
                                        <asp:BoundField DataField="nu_location"  HeaderText="Location" SortExpression="nu_location" />
                                        <asp:BoundField DataField="nu_shiftDate" HeaderText="Shift Date" SortExpression="nu_shiftDate"  DataFormatString="{0:D}"  />
                                        <asp:BoundField DataField="nu_s1" HeaderText="Shift 1" SortExpression="nu_s1" />
                                        <asp:BoundField DataField="nu_s2" HeaderText="Shift 2" SortExpression="nu_s2" />
                                        <asp:BoundField DataField="nu_s3" HeaderText="Shift 3" SortExpression="nu_s3" />
                                        <asp:BoundField DataField="nu_s4" HeaderText="Shift 4" SortExpression="nu_s4" />
                                        <asp:BoundField DataField="nu_isAllocated" ReadOnly="true" HeaderText="Is Allocated" SortExpression="nu_isAllocated" />
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
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conString %>" DeleteCommand="DELETE FROM [nur_preferences] WHERE [Id] = @original_Id AND (([nu_Id] = @original_nu_Id) OR ([nu_Id] IS NULL AND @original_nu_Id IS NULL)) AND (([nu_location] = @original_nu_location) OR ([nu_location] IS NULL AND @original_nu_location IS NULL)) AND (([nu_shiftDate] = @original_nu_shiftDate) OR ([nu_shiftDate] IS NULL AND @original_nu_shiftDate IS NULL)) AND (([nu_s1] = @original_nu_s1) OR ([nu_s1] IS NULL AND @original_nu_s1 IS NULL)) AND (([nu_s2] = @original_nu_s2) OR ([nu_s2] IS NULL AND @original_nu_s2 IS NULL)) AND (([nu_s3] = @original_nu_s3) OR ([nu_s3] IS NULL AND @original_nu_s3 IS NULL)) AND (([nu_s4] = @original_nu_s4) OR ([nu_s4] IS NULL AND @original_nu_s4 IS NULL)) AND (([nu_isAllocated] = @original_nu_isAllocated) OR ([nu_isAllocated] IS NULL AND @original_nu_isAllocated IS NULL))" InsertCommand="INSERT INTO [nur_preferences] ([nu_Id], [nu_location], [nu_shiftDate], [nu_s1], [nu_s2], [nu_s3], [nu_s4], [nu_isAllocated]) VALUES (@nu_Id, @nu_location, @nu_shiftDate, @nu_s1, @nu_s2, @nu_s3, @nu_s4, @nu_isAllocated)" SelectCommand="SELECT * FROM [nur_preferences] WHERE (([nu_Id] = @nu_Id) AND ([nu_isAllocated] = @nu_isAllocated))" UpdateCommand="UPDATE [nur_preferences] SET [nu_Id] = @nu_Id, [nu_location] = @nu_location, [nu_shiftDate] = @nu_shiftDate, [nu_s1] = @nu_s1, [nu_s2] = @nu_s2, [nu_s3] = @nu_s3, [nu_s4] = @nu_s4, [nu_isAllocated] = @nu_isAllocated WHERE [Id] = @original_Id AND (([nu_Id] = @original_nu_Id) OR ([nu_Id] IS NULL AND @original_nu_Id IS NULL)) AND (([nu_location] = @original_nu_location) OR ([nu_location] IS NULL AND @original_nu_location IS NULL)) AND (([nu_shiftDate] = @original_nu_shiftDate) OR ([nu_shiftDate] IS NULL AND @original_nu_shiftDate IS NULL)) AND (([nu_s1] = @original_nu_s1) OR ([nu_s1] IS NULL AND @original_nu_s1 IS NULL)) AND (([nu_s2] = @original_nu_s2) OR ([nu_s2] IS NULL AND @original_nu_s2 IS NULL)) AND (([nu_s3] = @original_nu_s3) OR ([nu_s3] IS NULL AND @original_nu_s3 IS NULL)) AND (([nu_s4] = @original_nu_s4) OR ([nu_s4] IS NULL AND @original_nu_s4 IS NULL)) AND (([nu_isAllocated] = @original_nu_isAllocated) OR ([nu_isAllocated] IS NULL AND @original_nu_isAllocated IS NULL))" ConflictDetection="CompareAllValues" OldValuesParameterFormatString="original_{0}">
                                    <DeleteParameters>
                                        <asp:Parameter Name="original_Id" Type="Int32" />
                                        <asp:Parameter Name="original_nu_Id" Type="Int32" />
                                        <asp:Parameter Name="original_nu_location" Type="String" />
                                        <asp:Parameter Name="original_nu_shiftDate" Type="DateTime" />
                                        <asp:Parameter Name="original_nu_s1" Type="String" />
                                        <asp:Parameter Name="original_nu_s2" Type="String" />
                                        <asp:Parameter Name="original_nu_s3" Type="String" />
                                        <asp:Parameter Name="original_nu_s4" Type="String" />
                                        <asp:Parameter Name="original_nu_isAllocated" Type="String" />
                                    </DeleteParameters>
                                    <InsertParameters>
                                        <asp:Parameter Name="nu_Id" Type="Int32" />
                                        <asp:Parameter Name="nu_location" Type="String" />
                                        <asp:Parameter Name="nu_shiftDate" Type="DateTime" />
                                        <asp:Parameter Name="nu_s1" Type="String" />
                                        <asp:Parameter Name="nu_s2" Type="String" />
                                        <asp:Parameter Name="nu_s3" Type="String" />
                                        <asp:Parameter Name="nu_s4" Type="String" />
                                        <asp:Parameter Name="nu_isAllocated" Type="String" />
                                    </InsertParameters>
                                    <SelectParameters>
                                        <asp:CookieParameter CookieName="UserID" Name="nu_Id" Type="Int32" />
                                        <asp:Parameter DefaultValue="N" Name="nu_isAllocated" Type="String" />
                                    </SelectParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="nu_Id" Type="Int32" />
                                        <asp:Parameter Name="nu_location" Type="String" />
                                        <asp:Parameter Name="nu_shiftDate" Type="DateTime" />
                                        <asp:Parameter Name="nu_s1" Type="String" />
                                        <asp:Parameter Name="nu_s2" Type="String" />
                                        <asp:Parameter Name="nu_s3" Type="String" />
                                        <asp:Parameter Name="nu_s4" Type="String" />
                                        <asp:Parameter Name="nu_isAllocated" Type="String" />
                                        <asp:Parameter Name="original_Id" Type="Int32" />
                                        <asp:Parameter Name="original_nu_Id" Type="Int32" />
                                        <asp:Parameter Name="original_nu_location" Type="String" />
                                        <asp:Parameter Name="original_nu_shiftDate" Type="DateTime" />
                                        <asp:Parameter Name="original_nu_s1" Type="String" />
                                        <asp:Parameter Name="original_nu_s2" Type="String" />
                                        <asp:Parameter Name="original_nu_s3" Type="String" />
                                        <asp:Parameter Name="original_nu_s4" Type="String" />
                                        <asp:Parameter Name="original_nu_isAllocated" Type="String" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>

                            </div>
                        </div>

                    </div>
                </div>
            </div>

  
    </form>
</body>
</html>
