<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="OrderHandling.aspx.cs" Inherits="E_Sklep.Admin.OrderHandling" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div align="center">
        <h4>
            Zamówienia</h4>
        <hr />
    </div>
    <table align="center" cellspacing="1" style="width: 100%; background-color: #FFFFFF;">
        <tr><td style="width: 631px">

            <asp:GridView ID="zamgv" runat="server" Width="100%">
            </asp:GridView>
            </td>
            <td>
                <table>
                    <tr><td><asp:Label ID="reallbl" runat="server" Text="Id zamówienia zrealizowanego"></asp:Label></td></tr>
                    <tr><td><asp:TextBox ID="realtb" runat="server" Width="100%"></asp:TextBox></td></tr>
                    <tr><td><asp:Button ID="realbtn" runat="server" text="Zrealizuj" OnClick="realbtn_Click" /></td></tr>
                
                 </table>
            </td>
        </tr>
        </table>

</asp:Content>
