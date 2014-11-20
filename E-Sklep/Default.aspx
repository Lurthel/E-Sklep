<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="E_Sklep.Default" %>

<!DOCTYPE html>
 
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
 <link rel="stylesheet" type="text/css" href="Styles.css" />   
    <style type="text/css">
        .auto-style2 {
            width: 121px;
            height: 26px;
        }
        .auto-style3 {
            height: 26px;
        }
    </style>
</head>
<body>
    
    <form id="form1" runat="server">
<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
        <ContentTemplate>
            <table align="center" class="style1">
                <tr>
                    <td>
                        <table align="center" class="style1" style="border-bottom-style: ridge;border-width:medium; 
                           border-color:#9933FF">
                            <tr>
                                <td class="style8" align="center" rowspan="2">
                                    <asp:Image ID="Image1" runat="server" Height="72px" ImageUrl="http://ftp.mgkrakow.pl/files/eSklep.gif" Width="72px" />
                                    &nbsp;
                                </td>
                                <td class="style6" rowspan="2">
                                    <asp:LinkButton ID="lblLogo" runat="server" Text="E-Sklep" Font-Names="Eras Demi ITC"
                                        Font-Size="20pt" ForeColor="#6600CC" OnClick="lblLogo_Click"></asp:LinkButton>
                                    <br />
                                    Dla tych co lubią Kupować!
                                </td>
                                <td class="style7" rowspan="2">
                                    <asp:Image ID="Image3" runat="server" Height="67px" ImageUrl="http://thecrystalinfotech.in/images/banner-laptop-sales.jpg"
                                        Width="282px" />
                                </td>
                                <td rowspan="2" align="right">
                                    <asp:ImageButton ID="Image2" runat="server" Height="70px" ImageUrl="http://icons.iconarchive.com/icons/designcontest/ecommerce-business/256/shopping-icon.png"
                                        Width="70px" OnClick="btnE_Sklep_Click"/>
                               </td>
                                <td align="left">

                                    <asp:LinkButton ID="btnE_Sklep" runat="server" Font-Underline="False" Font-Size="20pt"
                                        ForeColor="Red" OnClick="btnE_Sklep_Click">0</asp:LinkButton>
                                </td>
                            </tr>
                            <tr>
                                <td class="style3" valign="middle">
                                    <asp:Label ID="errorlbl" runat="server"></asp:Label>
                                    &nbsp;
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table align="center" class="style1" style="border: thin ridge #9900FF">
                            <tr>
                                <td class="style2">
                                    &nbsp;
                                    <asp:Label ID="lblCategoryName" runat="server" Font-Size="15pt" ForeColor="#6600CC"></asp:Label>
                                    </td>
                                <td class="style3" style="border-left-style:ridge; border-width:thin; border-color:#9900FF">
                                    &nbsp;
                                    <asp:Label ID="lblProducts" runat="server" Text="Produkty" Font-Size="15pt" ForeColor="#6600CC"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table align="center" class="style1">
                            <tr>
                                <td class="style2" valign="top">
                                    <asp:Panel ID="pnlProducts" runat="server" ScrollBars="Auto" Height="600px" BorderColor="Black"
                                        BorderStyle="Inset" BorderWidth="1">
                                        <asp:DataList ID="dlProducts" runat="server" RepeatColumns="3" Width="600px" Font-Bold="false"
                                            Font-Italic="false" Font-Overline="false" Font-Strikeout="false" Font-Underline="false">
                                            <ItemTemplate>
                                                <div align="left">
                                                    <table cellspacing="1" class="style4" style="border:1px ridge #9900FF">
                                                        <tr>
                                                            <td style="border-bottom-style:ridge; border-width:1px; border-color:#000000">
                                                                <asp:Label ID="lblProductName" runat="server" Text='<%# Eval("Name")%>' Style="font-weight:700"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <img alt="" src='<%# Bind("ImageUrl") %>' runat="server" id="imgProductPhoto" style="border:ridge 1px black;
                                                                    width:173px;height:160px;" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="lblDescription" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                Cena: <asp:Label ID="lblPrice" runat="server" Text='<%# Bind("Price") %>'></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:Button ID="btnAddToCart" runat="server" CommandArgument='<%# Bind("ProductID") %>'
                                                                    OnClick="btnAddToCart_Click" Text="Dodaj do koszyka" Width="100%" BorderColor="Black"
                                                                    BorderStyle="Inset" BorderWidth="1px" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>
                                            </ItemTemplate>
                                        </asp:DataList>
                                    </asp:Panel>
                                    <asp:Panel ID="pnlMyCart" runat="server" ScrollBars="Auto" Height="500px" BorderColor="Black"
                                        BorderStyle="Inset" BorderWidth="1px" Visible="false">
                                        <table align="center" cellspacing="1">
                                            <tr>
                                                <td align="center">
                                                    <asp:DataList ID="dlCartProducts" runat="server" RepeatColumns="3" Font-Bold="false"
                                                        Font-Italic="false" Font-Overline="false" Font-Strikeout="false" Font-Underline="false"
                                                        Width="551px">
                                                        <ItemTemplate>
                                                            <div align="left">
                                                                <table cellspacing="1" style="border:1px ridge #9900FF; text-align:center; width:172px;">
                                                                   <tr>
                                                                       <td style="border-bottom-style:ridge;border-width:1px;border-color:#000000">
                                                                           <asp:Label ID="lblProductName" runat="server" Text='<%# Eval("Name") %>' Style="font-weight:700"></asp:Label>
                                                                       </td>
                                                                   </tr>
                                                                       <tr>
                                                                           <td>
                                                                               <img alt="" src='<%# Bind("ImageUrl") %>' runat="server" id="imgProductPhoto" style="border:ridge 1px black;
                                                                                    width:112px; height:100px;" />
                                                                           </td>
                                                                       </tr>
                                                                       <tr>
                                                                           <td>
                                                                               <asp:Button ID="btnRemoveFromCart" runat="server" CommandArgument='<%# Bind("ProductID") %>'
                                                                                   Text="Usuń z Koszyka" Width="100%" BorderColor="Black" BorderStyle="Inset" BorderWidth="1px"
                                                                                   OnClick="btnRemoveFromCart_Click" />
                                                                           </td>
                                                                       </tr>
                                                                    
                                                                </table>
                                                            </div>
                                                        </ItemTemplate>
                                                    </asp:DataList>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                </td>
                                <td class="style3" valign="top" align="center">
                                    <asp:Panel ID="pnlCategories" runat="server" ScrollBars="Auto" Height="600px" BorderColor="Black"
                                        BorderStyle="Inset" BorderWidth="1px">
                                        <asp:DataList ID="dlCategories" runat="server" BackColor="White" BorderColor="#CCCCCC"
                                            BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal"
                                            Width="252px">
                                            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                                            <HeaderStyle BackColor="#333333" Font-Bold="true" ForeColor="White" />
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lbtnCategory" runat="server" Text='<%# Bind("CategoryName") %>'
                                                    OnClick="lbtnCategory_Click" CommandArgument='<%# Bind("CategoryID") %>'></asp:LinkButton>
                                            </ItemTemplate>
                                            <SelectedItemStyle BackColor="#CC3333" Font-Bold="true" ForeColor="White" />
                                        </asp:DataList>
                                    </asp:Panel>
                                    <asp:Panel ID="pnlCheckOut" runat="server" ScrollBars="Auto" Height="500px" BorderColor="Black"
                                        BorderStyle="Inset" BorderWidth="1px" Visible="false">
                                        <table style="width:258px; height: 30px;">
                                            <tr>
                                                <td align="left" class="auto-style2">
                                                    Suma Produktów:
                                                </td>
                                            
                                                <td align="left" class="auto-style3">
                                                    <asp:Label ID="lblTotalProducts" runat="server" Text="Suma" Font-Size="15pt" ForeColor="#6600CC"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr><td>Dane do wysyłki:</td></tr>
                                            <tr>
                                                <td><label id="imienazwlbl" runat="server">Imię i Nazwisko:</label></td>
                                                <td><asp:TextBox ID="imienazwtb" runat="server" Width="100%"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td><label id="adrlbl" runat="server">Adres:</label></td>
                                                <td><asp:TextBox ID="adrtb" runat="server" Width="100%" Height="100px"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td><label id="tellbl" runat="server">Nr Telefonu:</label></td>
                                                <td><asp:TextBox ID="teltb" runat="server" Width="100%" ></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td><asp:Button ID="zamowButton" runat="server" Text="Zamów Produkty" OnClick="zamowButton_Click" /></td>
                                                <td></td>
                                            </tr>
                                            <tr><td><asp:Label ID="alertlbl" runat="server" ForeColor="Red"></asp:Label></td></tr>
                                        </table>
                                    </asp:Panel>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center" style="border: thin ridge #9900FF">
                                    &nbsp; Sebastian Pietrulewicz || <a href="Admin/Login.aspx">AdminPanel</a>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
    </form>
</body>
</html>
