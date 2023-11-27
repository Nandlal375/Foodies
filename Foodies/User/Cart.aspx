<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="Foodies.User.Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script>
        window.onload = function () {
            setTimeout(function () {
                document.getElementById("<%=lblMsg.ClientID%>").style.display = "none";
        }, 5000);

        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <section class="book_section layout_padding">
        <div class="container">
            <div class="heading_container">
                <div class="align-self-end">
                    <asp:Label runat="server" Visible="false" ID="lblMsg" />
                </div>
                <h2>Your Shopping Cart</h2>
            </div>
        </div>

        <div class="container">
            <asp:Repeater runat="server" ID="rCartItem" OnItemCommand="rCartItem_ItemCommand" OnItemDataBound="rCartItem_ItemDataBound">
                <HeaderTemplate>
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>Image</th>
                                <th>Unit Price</th>
                                <th>Quantity</th>
                                <th>Total Price</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td>
                            <asp:Label Text='<%# Eval("Name")%>' runat="server" ID="lblName"/>
                        </td>
                        <td>
                            <img alt="Img" width="60" src='<%#Foodies.Utils.GetImageUrl(Eval("ImageUrl"))%>' class="img-thumbnail"/>
                        </td>
                        <td>₹
                            <asp:Label Text='<%#Eval("Price")%>' runat="server" ID="lblPrice"></asp:Label>
                            <asp:HiddenField ID="hdnProductId" runat="server" Value='<%#Eval("ProductId")%>'/>
                            <asp:HiddenField ID="hdnQuantity" runat="server" Value='<%#Eval("Qty")%>'/>
                            <asp:HiddenField ID="hdnPrdQuantity" runat="server" Value='<%#Eval("PrdQty")%>'/>
                        </td>
                        <td>
                            <div class="product__details__option">
                                <div class="quantity">
                                    <div class="pro-qty">
                                        <asp:TextBox runat="server" ID="txtQuantity" TextMode="Number"
                                            Text='<%#Eval("Quantity")%>'/>
                                        <asp:RegularExpressionValidator ErrorMessage="*" ControlToValidate="txtQuantity" runat="server"
                                            ID="revQuantity" ForeColor="Red" Font-Size="Small" ValidationExpression="[1-9]*"
                                            Display="Dynamic" SetFocusOnError="true" EnableClientScript="true" />
                                    </div>
                                </div>
                            </div>
                        </td>
                        <td>₹<asp:Label runat="server" ID="lblTotalPrice" />
                        </td>
                        <td>
                            <asp:LinkButton Text="Remove" runat="server" ID="lbDelete"
                                CommandName="remove" CommandArgument='<%#Eval("ProductId")%>'
                                OnClientClick="return confirm('Do you want to remove this item from cart?');">
                                <i class="fa fa-close"></i>
                            </asp:LinkButton>
                        </td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    <tr>
                        <td colspan="3"></td>
                        <td class="pl-lg-5">
                            <b>Grand Total:-</b>
                        </td>
                        <td>₹<%Response.Write(Session["grandTotalPrice"]); %>
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td colspan="2" class="continue__btn">
                            <a href="Menu.aspx" class="btn btn-info">
                                <i class="fa fa-arrow-circle-left mr-2"></i>Continue Shopping
                            </a>
                        </td>
                        <td>
                            <asp:LinkButton runat="server"
                                ID="lbUpdateCart" CommandName="updateCart" CssClass="btn btn-warning">
                            <i class="fa fa-refresh mr-2"></i>Update Cart
                            </asp:LinkButton>
                        </td>
                        <td>
                            <asp:LinkButton runat="server"
                                ID="lblCheckout" CommandName="checkout" CssClass="btn btn-success">
                               Checkout<i class="fa fa-arrow-circle-right ml-2"></i>
                            </asp:LinkButton>

                        </td>
                    </tr>

                    </tbody>
                    </table>
                </FooterTemplate>
            </asp:Repeater>
        </div>
    </section>
</asp:Content>
