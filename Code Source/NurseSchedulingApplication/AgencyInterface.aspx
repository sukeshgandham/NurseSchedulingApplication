<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AgencyInterface.aspx.cs" Inherits="NurseSchedulingApplication.AgencyInterface" %>

<!DOCTYPE html>

<html>
  <head>
  	<title>Agency Interface</title>
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
                    <h1><a href="#" class="logo">Nurse SafeGuard</a></h1>
                    <ul class="list-unstyled components mb-5">
                        <li>
                            <asp:Label ID="lblloggedinusername" runat="server" class="fa fa-user-circle" Text="Label"></asp:Label>
                        </li>
                        <li>
                            <a href="#"><span class="fa fa-home mr-3"></span>Home</a>
                        </li>
                        <li class="active">
                            <a href="#"><span class="fa fa-briefcase mr-3"></span>Allocate Nurses</a>
                        </li>
                        <li>
                            <a href="UpdateProfile.aspx"><span class="fa fa-user mr-3"></span>Update Profile</a>
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
                <h1>Agency</h1>
                <div class="row">
                    <div class="col-md-6">

                        <div class="form-group">
                            <h2>Select Date</h2>
                            <input id="TextBox12" runat="server" style="width:122px" type="text" />
                           <%-- <asp:TextBox ID="TextBox1" runat="server" Width="122px"></asp:TextBox>--%>

                        

                            <asp:ImageButton ID="ImageButton1" runat="server" Height="20px" ImageAlign="Top" ImageUrl="~/Common/Images/calender.png" Width="16px" OnClick="ImageButton1_Click"/>
        
                            <br />
                            <asp:Calendar  ID="Calendar1" runat="server" BackColor="White" BorderColor="Black" BorderStyle="Solid" CellSpacing="1" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="250px" NextPrevFormat="ShortMonth" Width="330px" OnSelectionChanged="Calendar1_SelectionChanged" OnDayRender="Calendar1_DayRender">
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
                            <asp:Button ID="btnretrieveRequests" runat="server" Text="Retrieve" OnClick="btnretrieveRequests_Click" />
                            </div>
                    
                         
                    <div class="row">
                        <h3>Requests from hospital</h3>
                      <div class="col-md-9">
                        <div class="form-group">
                            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None" >
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:BoundField DataField="Id" Visible="false" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                                    <asp:BoundField DataField="h_id"  HeaderText="Hospital ID" SortExpression="h_id" />
                                    <asp:BoundField DataField="h_shiftDate" HeaderText="Request Date" SortExpression="h_shiftDate" />
                                    <asp:BoundField DataField="h_s1" HeaderText="Shift 1" SortExpression="h_s1" />
                                    <asp:BoundField DataField="h_s2" HeaderText="Shift 2" SortExpression="h_s2" />
                                    <asp:BoundField DataField="h_s3" HeaderText="Shift 3" SortExpression="h_s3" />
                                    <asp:BoundField DataField="h_s4" HeaderText="Shift 4" SortExpression="h_s4" />
                                    <asp:BoundField DataField="h_reqNursesInTotal" HeaderText="Total Nurses Required" SortExpression="h_reqNursesInTotal" />
                                    <asp:BoundField DataField="h_AllocatedinTotal" HeaderText="Allocated" SortExpression="h_AllocatedinTotal" />
                                    <asp:BoundField DataField="h_location" HeaderText="Location" SortExpression="h_location" />
                                </Columns>
                                <EditRowStyle BackColor="#2461BF" />
                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#EFF3FB" />
                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                <SortedDescendingHeaderStyle BackColor="#4870BE" />
                            </asp:GridView>
                            <br />
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conString %>" SelectCommand="SELECT * FROM [hospital_Requests] WHERE ([h_shiftDate] = @h_shiftDate)">
                                <SelectParameters>
                                    <asp:QueryStringParameter Name="h_shiftDate" QueryStringField="Date" Type="DateTime" />
                                </SelectParameters>
                            </asp:SqlDataSource>

                        </div>
                          </div>
                    </div>
                        <div class="row">
                            <h3>Allocated Nurses</h3>
                            <div class="col-md-9">
                                <asp:GridView ID="grdunallocated" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id" DataSourceID="unallocatedsqlsource" ForeColor="#333333" GridLines="None">
                                    <AlternatingRowStyle BackColor="White" />
                                    <Columns>
                                        <asp:BoundField DataField="Id" HeaderText="Id" Visible="false" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                                        <asp:BoundField DataField="h_Id" HeaderText="Hospital ID" SortExpression="h_Id" />
                                         <asp:BoundField DataField="h_shiftDate" HeaderText="Shift Date" SortExpression="h_shiftDate" />
                                        <asp:BoundField DataField="h_S1A" HeaderText="Shift1 Allocated" SortExpression="h_S1A" />
                                        <asp:BoundField DataField="h_S2A" HeaderText="Shift2 Allocated" SortExpression="h_S2A" />
                                        <asp:BoundField DataField="h_S3A" HeaderText="Shift3 Allocated" SortExpression="h_S3A" />
                                        <asp:BoundField DataField="h_S4A" HeaderText="Shift4 Allocated" SortExpression="h_S4A" />
                                        <asp:BoundField DataField="h_TotalAllocatedNurses" HeaderText="Total Allocated" SortExpression="h_TotalAllocatedNurses" />
                                       
                                    </Columns>
                                    <EditRowStyle BackColor="#2461BF" />
                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#EFF3FB" />
                                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                </asp:GridView>
                                <br />
                                <asp:SqlDataSource ID="unallocatedsqlsource" runat="server" ConnectionString="<%$ ConnectionStrings:conString %>" SelectCommand="SELECT * FROM [h_UnAllocatedRequests] WHERE ([h_shiftDate] = @h_shiftDate)">
                                    <SelectParameters>
                                        <asp:QueryStringParameter Name="h_shiftDate" QueryStringField="Date" Type="DateTime" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>
                        </div>
                    
                        <div class="row">
                            <h3>Available Nurses</h3>
                            <div class="col-md-9">

                                <asp:GridView ID="grdviewnurses" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id" DataSourceID="nursesqldatasource" ForeColor="#333333" GridLines="None">
                                    <AlternatingRowStyle BackColor="White" />
                                    <Columns>
                                        <asp:BoundField DataField="Id" HeaderText="Id" Visible="false" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                                        <asp:BoundField DataField="nu_Id" HeaderText="Nurse ID" SortExpression="nu_Id" />
                                        <asp:BoundField DataField="nu_location" HeaderText="Location" SortExpression="nu_location" />
                                        <asp:BoundField DataField="nu_shiftDate" HeaderText="Shift Date" SortExpression="nu_shiftDate" />
                                        <asp:BoundField DataField="nu_s1" HeaderText="Shift 1" SortExpression="nu_s1" />
                                        <asp:BoundField DataField="nu_s2" HeaderText="Shift 2" SortExpression="nu_s2" />
                                        <asp:BoundField DataField="nu_s3" HeaderText="Shift 3" SortExpression="nu_s3" />
                                        <asp:BoundField DataField="nu_s4" HeaderText="Shift 4" SortExpression="nu_s4" />
                                        <asp:BoundField DataField="nu_isAllocated" Visible="false" HeaderText="nu_isAllocated" SortExpression="nu_isAllocated" />
                                    </Columns>
                                    <EditRowStyle BackColor="#2461BF" />
                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#EFF3FB" />
                                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                </asp:GridView>
                                <br />
                                <asp:SqlDataSource ID="nursesqldatasource" runat="server" ConnectionString="<%$ ConnectionStrings:conString %>" SelectCommand="SELECT * FROM [nur_preferences] WHERE (([nu_shiftDate] = @nu_shiftDate) AND ([nu_isAllocated] = @nu_isAllocated))">
                                    <SelectParameters>
                                        <asp:QueryStringParameter DefaultValue="" Name="nu_shiftDate" QueryStringField="Date" Type="DateTime" />
                                        <asp:Parameter DefaultValue="N" Name="nu_isAllocated" Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>
                        </div>
                     <div class="row">
                         <asp:Button ID="btnAllocate"  runat="server" Text="Allocate" OnClick="btnAllocate_Click"/>
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
