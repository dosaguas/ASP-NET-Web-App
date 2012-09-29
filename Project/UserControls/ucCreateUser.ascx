<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucCreateUser.ascx.cs" Inherits="UserControls_ucCreateUser" %>



<div id="createUser">
Sign Up for Your New Account <br />
<label for="ctluserName">User Name: * </label> 
<asp:TextBox ID="ctluserName" runat="server"></asp:TextBox>
<br />
<label for="ctlPass">Password: * </label> 
<asp:TextBox ID="ctlPass" runat="server"></asp:TextBox>
<br />
<label for="ctlConfirmPass">Confirm Password: * </label> 
<asp:TextBox ID="ctlConfirmPass" runat="server"></asp:TextBox>
<br />
<label for="ctlEmail">E-mail: * </label> 
<asp:TextBox ID="ctlEmail" runat="server"></asp:TextBox>
<br />
<label for="ctlSecQuestion">Security Question: * </label> 
<asp:TextBox ID="ctlSecQuestion" runat="server"></asp:TextBox>
<br />
<label for="ctlSecAnswer">Security Answer: * </label> 
<asp:TextBox ID="ctlSecAnswer" runat="server"></asp:TextBox>
<br />
The Password and Confirmation Password must match. 
</div>