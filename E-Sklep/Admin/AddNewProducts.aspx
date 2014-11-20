<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AddNewProducts.aspx.cs" Inherits="E_Sklep.Admin.AddNewProducts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div align="center">
        <h4>
            Nowy Produkt</h4>
        <hr />
    </div>
    <table align="center" cellspacing="1" style="width: 100%; background-color: #FFFFFF;">
        <tr>
            <td style="width: 50%; padding-left:100px;" align="left">
Nazwa Produktu:
            </td>
            <td style="width: 50%;" align="left">
                &nbsp;
                <asp:TextBox ID="txtProductName" runat="server" Width="212px">
                </asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 50%; padding-left:100px;" align="left">
                &nbsp;</td>
            <td style="width: 50%;" align="left">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 50%; padding-left:100px;" align="left">
                Kategoria Produktu:
            </td>
            <td style="width: 50%;" align="left">
               &nbsp;
                <asp:DropDownList ID="ddlCategory" runat="server" Width="212px" >
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td style="width: 50%; height: 22px;"align="left">
                &nbsp;
            </td>
            <td style="width: 50%; height: 22px;"align="left">
               &nbsp;
            </td>
        </tr>
        <tr>
            <td style="width: 50%; padding-left:100px; height: 100px;"align="left">
                Opis Produktu:
            </td>
            <td style="width: 50%; height: 100px;"align="left">
               &nbsp;
                <asp:TextBox ID="txtProductDescription" runat="server" Width="212px" Height="80px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 50%; padding-left:100px;" align="left">
                
                            
               Zdjęcie Produktu:</td>
            <td style="width: 50%;" align="left">
               &nbsp;
                <asp:FileUpload ID="uploadProductPhoto" runat="server" />
            </td>
        </tr>
        <tr>
            <td style="width: 50%;" align="left">
                
                &nbsp;</td>
            <td style="width: 50%;" align="left">
               &nbsp;
            </td>
        </tr>
        <tr>
            <td style="width: 50%; padding-left:100px;" align="left">
               
                Cena:</td>
            <td style="width: 50%;" align="left">
               &nbsp;
                <asp:TextBox ID="txtProductPrice" runat="server" Width="212px">
                </asp:TextBox>
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
                <asp:Button ID="btnSubmit" runat="server" Text="Zastosuj" Width="100px" 
                    Height="30px" OnClick="btnSubmit_Click" />
            </td>
        </tr>
    </table>
</asp:Content>
