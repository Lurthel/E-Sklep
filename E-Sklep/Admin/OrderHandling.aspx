<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="OrderHandling.aspx.cs" Inherits="E_Sklep.Admin.OrderHandling" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div align="center">
        <h4>
            Zamówienia</h4>
        <hr />
    </div>
    <table align="center" cellspacing="1" style="width: 100%; background-color: #FFFFFF;">
        <tr><td style="width: 440px">

            <asp:GridView ID="zamgv" runat="server">
                <Columns>
                    <asp:ButtonField ButtonType="Button" CommandName="Zrealizuj();" Text="Zrealizowane" />
                </Columns>
            </asp:GridView>
            </td></tr>
        </table>

</asp:Content>
