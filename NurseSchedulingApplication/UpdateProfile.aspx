<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateProfile.aspx.cs" Inherits="NurseSchedulingApplication.UpdateProfile" %>

<!DOCTYPE html>

<html>
  <head>
  	<title>Update Profile</title>
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
                            <a href="#"><span class="fa fa-user mr-3"></span>Update Profile</a>
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

            <!-- Page Content  -->
            <div id="content" class="p-4 p-md-5 pt-5">
               <h1>Update Profile</h1>
                <div class="form-group">
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:CommandField ShowEditButton="True" />
                            <asp:BoundField DataField="Id"  HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                            <asp:BoundField DataField="nur_firstName" HeaderText="First Name" SortExpression="nur_firstName" />
                            <asp:BoundField DataField="nur_lastName" HeaderText="Last Name" SortExpression="nur_lastName" />
                            <asp:BoundField DataField="nur_middleName" Visible="false" HeaderText="nur_middleName" SortExpression="nur_middleName" />
                            <asp:BoundField DataField="nur_dob" Visible="false"  HeaderText="nur_dob" SortExpression="nur_dob" />
                            <asp:BoundField DataField="nur_qualifications" HeaderText="Qualifications" SortExpression="nur_qualifications" />
                            <asp:BoundField DataField="nur_designations" HeaderText="Designations" SortExpression="nur_designations" />
                            <asp:BoundField DataField="nur_practiceYears" HeaderText="Years of practice" SortExpression="nur_practiceYears" />
                            <asp:BoundField DataField="nur_phone"  HeaderText="Phone" SortExpression="nur_phone" />
                            <asp:BoundField DataField="nur_email" HeaderText="Email" SortExpression="nur_email" />
                            <asp:BoundField DataField="nur_userId" Visible="false" HeaderText="nur_userId" SortExpression="nur_userId" />
                            <asp:BoundField DataField="nur_pwd" Visible="false" HeaderText="nur_pwd" SortExpression="nur_pwd" />
                            <asp:BoundField DataField="nur_conPwd" Visible="false" HeaderText="nur_conPwd" SortExpression="nur_conPwd" />
                            <asp:BoundField DataField="nur_secQuestion" Visible="false" HeaderText="nur_secQuestion" SortExpression="nur_secQuestion" />
                            <asp:BoundField DataField="nur_secAnswer" Visible="false" HeaderText="nur_secAnswer" SortExpression="nur_secAnswer" />
                            <asp:BoundField DataField="created" Visible="false" HeaderText="created" SortExpression="created" />
                            <asp:BoundField DataField="createdby" Visible="false" HeaderText="createdby" SortExpression="createdby" />
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
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:nurse_scheduling_systemConnectionString %>" DeleteCommand="DELETE FROM [nur_registration] WHERE [Id] = @original_Id AND (([nur_firstName] = @original_nur_firstName) OR ([nur_firstName] IS NULL AND @original_nur_firstName IS NULL)) AND (([nur_lastName] = @original_nur_lastName) OR ([nur_lastName] IS NULL AND @original_nur_lastName IS NULL)) AND (([nur_middleName] = @original_nur_middleName) OR ([nur_middleName] IS NULL AND @original_nur_middleName IS NULL)) AND (([nur_dob] = @original_nur_dob) OR ([nur_dob] IS NULL AND @original_nur_dob IS NULL)) AND (([nur_qualifications] = @original_nur_qualifications) OR ([nur_qualifications] IS NULL AND @original_nur_qualifications IS NULL)) AND (([nur_designations] = @original_nur_designations) OR ([nur_designations] IS NULL AND @original_nur_designations IS NULL)) AND (([nur_practiceYears] = @original_nur_practiceYears) OR ([nur_practiceYears] IS NULL AND @original_nur_practiceYears IS NULL)) AND (([nur_phone] = @original_nur_phone) OR ([nur_phone] IS NULL AND @original_nur_phone IS NULL)) AND (([nur_email] = @original_nur_email) OR ([nur_email] IS NULL AND @original_nur_email IS NULL)) AND (([nur_userId] = @original_nur_userId) OR ([nur_userId] IS NULL AND @original_nur_userId IS NULL)) AND (([nur_pwd] = @original_nur_pwd) OR ([nur_pwd] IS NULL AND @original_nur_pwd IS NULL)) AND (([nur_conPwd] = @original_nur_conPwd) OR ([nur_conPwd] IS NULL AND @original_nur_conPwd IS NULL)) AND (([nur_secQuestion] = @original_nur_secQuestion) OR ([nur_secQuestion] IS NULL AND @original_nur_secQuestion IS NULL)) AND (([nur_secAnswer] = @original_nur_secAnswer) OR ([nur_secAnswer] IS NULL AND @original_nur_secAnswer IS NULL)) AND (([created] = @original_created) OR ([created] IS NULL AND @original_created IS NULL)) AND (([createdby] = @original_createdby) OR ([createdby] IS NULL AND @original_createdby IS NULL))" InsertCommand="INSERT INTO [nur_registration] ([nur_firstName], [nur_lastName], [nur_middleName], [nur_dob], [nur_qualifications], [nur_designations], [nur_practiceYears], [nur_phone], [nur_email], [nur_userId], [nur_pwd], [nur_conPwd], [nur_secQuestion], [nur_secAnswer], [created], [createdby]) VALUES (@nur_firstName, @nur_lastName, @nur_middleName, @nur_dob, @nur_qualifications, @nur_designations, @nur_practiceYears, @nur_phone, @nur_email, @nur_userId, @nur_pwd, @nur_conPwd, @nur_secQuestion, @nur_secAnswer, @created, @createdby)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [nur_registration] WHERE ([Id] = @Id)" UpdateCommand="UPDATE [nur_registration] SET [nur_firstName] = @nur_firstName, [nur_lastName] = @nur_lastName, [nur_middleName] = @nur_middleName, [nur_dob] = @nur_dob, [nur_qualifications] = @nur_qualifications, [nur_designations] = @nur_designations, [nur_practiceYears] = @nur_practiceYears, [nur_phone] = @nur_phone, [nur_email] = @nur_email, [nur_userId] = @nur_userId, [nur_pwd] = @nur_pwd, [nur_conPwd] = @nur_conPwd, [nur_secQuestion] = @nur_secQuestion, [nur_secAnswer] = @nur_secAnswer, [created] = @created, [createdby] = @createdby WHERE [Id] = @original_Id AND (([nur_firstName] = @original_nur_firstName) OR ([nur_firstName] IS NULL AND @original_nur_firstName IS NULL)) AND (([nur_lastName] = @original_nur_lastName) OR ([nur_lastName] IS NULL AND @original_nur_lastName IS NULL)) AND (([nur_middleName] = @original_nur_middleName) OR ([nur_middleName] IS NULL AND @original_nur_middleName IS NULL)) AND (([nur_dob] = @original_nur_dob) OR ([nur_dob] IS NULL AND @original_nur_dob IS NULL)) AND (([nur_qualifications] = @original_nur_qualifications) OR ([nur_qualifications] IS NULL AND @original_nur_qualifications IS NULL)) AND (([nur_designations] = @original_nur_designations) OR ([nur_designations] IS NULL AND @original_nur_designations IS NULL)) AND (([nur_practiceYears] = @original_nur_practiceYears) OR ([nur_practiceYears] IS NULL AND @original_nur_practiceYears IS NULL)) AND (([nur_phone] = @original_nur_phone) OR ([nur_phone] IS NULL AND @original_nur_phone IS NULL)) AND (([nur_email] = @original_nur_email) OR ([nur_email] IS NULL AND @original_nur_email IS NULL)) AND (([nur_userId] = @original_nur_userId) OR ([nur_userId] IS NULL AND @original_nur_userId IS NULL)) AND (([nur_pwd] = @original_nur_pwd) OR ([nur_pwd] IS NULL AND @original_nur_pwd IS NULL)) AND (([nur_conPwd] = @original_nur_conPwd) OR ([nur_conPwd] IS NULL AND @original_nur_conPwd IS NULL)) AND (([nur_secQuestion] = @original_nur_secQuestion) OR ([nur_secQuestion] IS NULL AND @original_nur_secQuestion IS NULL)) AND (([nur_secAnswer] = @original_nur_secAnswer) OR ([nur_secAnswer] IS NULL AND @original_nur_secAnswer IS NULL)) AND (([created] = @original_created) OR ([created] IS NULL AND @original_created IS NULL)) AND (([createdby] = @original_createdby) OR ([createdby] IS NULL AND @original_createdby IS NULL))">
                        <DeleteParameters>
                            <asp:Parameter Name="original_Id" Type="Int32" />
                            <asp:Parameter Name="original_nur_firstName" Type="String" />
                            <asp:Parameter Name="original_nur_lastName" Type="String" />
                            <asp:Parameter Name="original_nur_middleName" Type="String" />
                            <asp:Parameter Name="original_nur_dob" Type="DateTime" />
                            <asp:Parameter Name="original_nur_qualifications" Type="String" />
                            <asp:Parameter Name="original_nur_designations" Type="String" />
                            <asp:Parameter Name="original_nur_practiceYears" Type="Int32" />
                            <asp:Parameter Name="original_nur_phone" Type="Int32" />
                            <asp:Parameter Name="original_nur_email" Type="String" />
                            <asp:Parameter Name="original_nur_userId" Type="String" />
                            <asp:Parameter Name="original_nur_pwd" Type="String" />
                            <asp:Parameter Name="original_nur_conPwd" Type="String" />
                            <asp:Parameter Name="original_nur_secQuestion" Type="String" />
                            <asp:Parameter Name="original_nur_secAnswer" Type="String" />
                            <asp:Parameter Name="original_created" Type="DateTime" />
                            <asp:Parameter Name="original_createdby" Type="String" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="nur_firstName" Type="String" />
                            <asp:Parameter Name="nur_lastName" Type="String" />
                            <asp:Parameter Name="nur_middleName" Type="String" />
                            <asp:Parameter Name="nur_dob" Type="DateTime" />
                            <asp:Parameter Name="nur_qualifications" Type="String" />
                            <asp:Parameter Name="nur_designations" Type="String" />
                            <asp:Parameter Name="nur_practiceYears" Type="Int32" />
                            <asp:Parameter Name="nur_phone" Type="Int32" />
                            <asp:Parameter Name="nur_email" Type="String" />
                            <asp:Parameter Name="nur_userId" Type="String" />
                            <asp:Parameter Name="nur_pwd" Type="String" />
                            <asp:Parameter Name="nur_conPwd" Type="String" />
                            <asp:Parameter Name="nur_secQuestion" Type="String" />
                            <asp:Parameter Name="nur_secAnswer" Type="String" />
                            <asp:Parameter Name="created" Type="DateTime" />
                            <asp:Parameter Name="createdby" Type="String" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:CookieParameter CookieName="UserID" Name="Id" Type="Int32" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="nur_firstName" Type="String" />
                            <asp:Parameter Name="nur_lastName" Type="String" />
                            <asp:Parameter Name="nur_middleName" Type="String" />
                            <asp:Parameter Name="nur_dob" Type="DateTime" />
                            <asp:Parameter Name="nur_qualifications" Type="String" />
                            <asp:Parameter Name="nur_designations" Type="String" />
                            <asp:Parameter Name="nur_practiceYears" Type="Int32" />
                            <asp:Parameter Name="nur_phone" Type="Int32" />
                            <asp:Parameter Name="nur_email" Type="String" />
                            <asp:Parameter Name="nur_userId" Type="String" />
                            <asp:Parameter Name="nur_pwd" Type="String" />
                            <asp:Parameter Name="nur_conPwd" Type="String" />
                            <asp:Parameter Name="nur_secQuestion" Type="String" />
                            <asp:Parameter Name="nur_secAnswer" Type="String" />
                            <asp:Parameter Name="created" Type="DateTime" />
                            <asp:Parameter Name="createdby" Type="String" />
                            <asp:Parameter Name="original_Id" Type="Int32" />
                            <asp:Parameter Name="original_nur_firstName" Type="String" />
                            <asp:Parameter Name="original_nur_lastName" Type="String" />
                            <asp:Parameter Name="original_nur_middleName" Type="String" />
                            <asp:Parameter Name="original_nur_dob" Type="DateTime" />
                            <asp:Parameter Name="original_nur_qualifications" Type="String" />
                            <asp:Parameter Name="original_nur_designations" Type="String" />
                            <asp:Parameter Name="original_nur_practiceYears" Type="Int32" />
                            <asp:Parameter Name="original_nur_phone" Type="Int32" />
                            <asp:Parameter Name="original_nur_email" Type="String" />
                            <asp:Parameter Name="original_nur_userId" Type="String" />
                            <asp:Parameter Name="original_nur_pwd" Type="String" />
                            <asp:Parameter Name="original_nur_conPwd" Type="String" />
                            <asp:Parameter Name="original_nur_secQuestion" Type="String" />
                            <asp:Parameter Name="original_nur_secAnswer" Type="String" />
                            <asp:Parameter Name="original_created" Type="DateTime" />
                            <asp:Parameter Name="original_createdby" Type="String" />
                        </UpdateParameters>
                    </asp:SqlDataSource>

                </div>

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
