<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="CreateNewUser.aspx.cs" Inherits="Public_CreateNewUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style type="text/css">
    
    #RegisterWrapper
    {
        margin:0px 70px;
	padding: 20px;
	height:500px;
	width:800px;
	
//background: -moz-linear-gradient(left center , #CCCCCC, #CCCCCC 0.5%, white 0.5%, white) repeat scroll 0 0 #FFFFFF;
background: url("images/ui-bg_diagonals-thick_26_2293f7_40x40.png") repeat scroll 50% 50% rgb(34, 147, 247) 
    }


</style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<fieldset id="RegisterWrapper"> 
 <div>
    <legend>Creating user</legend>
        <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" 
            oncreateduser="CreateUserWizard1_CreatedUser">
            <WizardSteps>
                <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server">
                </asp:CreateUserWizardStep>
                <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server">
                </asp:CompleteWizardStep>
            </WizardSteps>
        </asp:CreateUserWizard>
    </div>
    </fieldset>

</asp:Content>

