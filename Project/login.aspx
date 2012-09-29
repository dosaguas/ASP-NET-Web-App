<%@ Page Title="Login Time" Theme="Theme1" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>
<%@ Register Src="~/UserControls/ucLogin.ascx"  TagName="login" TagPrefix="uc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="CSS/login.css" rel="stylesheet" type="text/css" />
    <script src="Scripts/jquery-ui-1.8.18.custom/js/jquery-1.7.1.min.js" type="text/javascript"></script>
    <script src="Scripts/jquery-ui-1.8.18.custom/js/jquery-ui-1.8.18.custom.min.js" type="text/javascript"></script>
    <link href="Scripts/jquery-ui-1.8.18.custom/css/excite-bike/jquery-ui-1.8.18.custom.css"
        rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2"  ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
            <asp:Panel ID="pnlLogin" class="ui-widget-content" ClientIDMode="Static" runat="server">
        
        <h1>WELCOME TO WEDEVELOP.ORG</h1>

  
    <div id="stat" >
    &nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:LoginView ID="LoginView1" runat="server">
            <AnonymousTemplate>
             <p>You are not logged in!</p>
              </AnonymousTemplate>
            <LoggedInTemplate>
              <p>This content is special, and shown only to authenticated users</p>
            </LoggedInTemplate>
        </asp:LoginView>
        <br />
    <!-- LOGIN GOES HERE  -->
    
       <div id="loginbox" class="ui-widget-header">
    <asp:Login ID="loginctl" ClientIDMode="Static" InstructionText="Please fill out the following information!" 
     runat="server" Font-Names="Verdana" 
     Font-Size="1em"
               MembershipProvider="SqlProvider" 
               CreateUserIconUrl="~/Public/CreateNewUser.aspx" 
               CreateUserText="Need To Register?" ViewStateMode="Enabled" 
               DestinationPageUrl="~/Admin/Default.aspx" BackColor="#F7F6F3" 
               BorderColor="#E6E2D8" BorderPadding="4" BorderStyle="Solid" BorderWidth="1px" 
               ForeColor="#333333" Orientation="Horizontal">
     
        <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
        <LayoutTemplate>
            <table cellpadding="4" cellspacing="0" style="border-collapse:collapse;">
                <tr>
                    <td>
                        <table cellpadding="0">
                            <tr>
                                <td align="center" colspan="2" 
                                    
                                    style="color:White;background-color:#507CD1; font-weight:bold; font-size: 0.9em;">
                                    Log In</td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2" style="color:Black;font-style:italic;">
                                    Please fill out the following information!</td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="UserName" runat="server" Font-Size="0.8em"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
                                        ControlToValidate="UserName" ErrorMessage="User Name is required." 
                                        ToolTip="User Name is required." ValidationGroup="loginctl">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="Password" runat="server" TextMode="Password" Font-Size="0.8em"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" 
                                        ControlToValidate="Password" ErrorMessage="Password is required." 
                                        ToolTip="Password is required." ValidationGroup="loginctl">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:CheckBox ID="RememberMe" runat="server" Text="Remember me next time." />
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2" style="color:Red;">
                                    <asp:Literal ID="FailureText" runat="server" EnableViewState="False" 
                                        Text="Your password or username is invalid" Visible="False"></asp:Literal>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" colspan="2">
                                    <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Log In" 
                                        ValidationGroup="loginctl" BackColor="White" BorderColor="#507CD1" 
                                        BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" 
                                        ForeColor="#284E98" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <img src="Public/CreateNewUser.aspx" alt="Need To Register?" />
                                    <asp:HyperLink ID="CreateUserLink" runat="server">Need To Register?</asp:HyperLink>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
        <LoginButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderStyle="Solid" 
            BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" 
            ForeColor="#284775" />
        <TextBoxStyle Font-Size="0.8em" />
     
        <TitleTextStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="#FFFFFF" 
            Font-Size="0.9em" />
    </asp:Login>
    

    </div>
    
    </div>
        </asp:Panel>


</asp:Content>

