<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AddEditCategory.aspx.cs" Inherits="E_Sklep.Admin.AddEditCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div align="center">
        <h4>
            Nowa Kategoria</h4>
        <hr />
    </div>
    <table align="center" cellspacing="1" style="width: 100%; background-color: #FFFFFF;">
        <tr>
            <td style="width: 50%; padding-left:100px;" align="left">
                Nazwa Kategorii:
            </td>
            <td style="width: 50%;" align="left">
                <asp:TextBox ID="txtCategoryName" runat="server" Width="212px">
                </asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 50%; padding-left:100px;" align="left">
                &nbsp;
            </td>
            <td style="width: 50%;" align="left">
                <asp:Button ID="btnSubmit" runat="server" Text="Zastosuj" Width="100px" 
                    Height="30px" OnClick="btnSubmit_Click" />
            </td>
        </tr>
        <tr>
            <td style="width: 50%;" align="left">
                &nbsp;
            </td>
            <td style="width: 50%;" align="left">
               &nbsp;
            </td>
        </tr>
        <tr>
            <td style="width: 50%;" align="left">
                &nbsp;
            </td>
            <td style="width: 50%;" align="left">
               &nbsp;
            </td>
        </tr>
    </table>
</asp:Content>
