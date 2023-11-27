<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="Foodies.Admin.Product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        window.onload = function () {
            setTimeout(function () {
                document.getElementById("<%=lblMsg.ClientID%>").style.display = "none";
            }, 5000);

        }
        function ImagePreview(input) {
            if (input.files && input.files[0]) {
                var render = new FileReader();
                render.onload = function (e) {

                    $("#<%=imgProduct.ClientID%>").prop('src', e.target.result)
                        .width(200)
                        .height(200);
                };
                render.readAsDataURL(input.files[0]);
            }
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceholder1" runat="server">

    <div class="pcoded-inner-content pt-0">
        <div class="align-align-self-end">
            <asp:Label runat="server" ID="lblMsg" Visible="false"></asp:Label>
        </div>
        <div class="main-body">
            <div class="page-wrapper">
                <div class="page-body">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="card">
                                <div class="card-header">
                                </div>
                                <div class="card-block">
                                    <div class="row">
                                        <div class="col-sm-6 col-md-4 col-lg-4">
                                            <h4 class="sub-title">Product</h4>
                                            <div>
                                                <div class="form-group">
                                                    <label>Product Name</label>
                                                    <div>
                                                        <asp:TextBox runat="server" ID="txtName" CssClass="form-control" Placeholder="Enter Product Name">
                                                        </asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Product Name is required" Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtName" ForeColor="Red"></asp:RequiredFieldValidator>
                                                        <asp:HiddenField runat="server" Value="0" ID="hdnId"></asp:HiddenField>
                                                    </div>
                                                </div>


                                                <div class="form-group">
                                                    <label>Product Description</label>
                                                    <div>
                                                        <asp:TextBox runat="server" ID="txtDescription" CssClass="form-control" Placeholder="Enter Product Description" TextMode="MultiLine">
                                                        </asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Description is required" Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtDescription" ForeColor="Red"></asp:RequiredFieldValidator>

                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label>Product Price (₹)</label>
                                                    <div>
                                                        <asp:TextBox runat="server" ID="txtPrice" CssClass="form-control" Placeholder="Enter Product Price">
                                                        </asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Price is required" Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtPrice" ForeColor="Red">
                                                        </asp:RequiredFieldValidator>
                                                        <%--<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Price must be number" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtPrice"
                                                            ValidationExpression="^\d{0,8(\.\d{1,4})?$}"></asp:RegularExpressionValidator>--%>

                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label>Product Quantity</label>
                                                    <div>
                                                        <asp:TextBox runat="server" ID="txtQuantity" CssClass="form-control" Placeholder="Enter Product Quantity" TextMode="Number">
                                                        </asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Quantity is required" Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtQuantity" ForeColor="Red"></asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Quantity must be not negative number" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtQuantity"
                                                            ValidationExpression="^([1-9]\d*|0)$"></asp:RegularExpressionValidator>

                                                    </div>
                                                </div>


                                                <div class="form-group">
                                                    <label>Product Image</label>
                                                    <div>
                                                        <asp:FileUpload runat="server" ID="fuProductImage" CssClass="form-control" onchange="ImagePreview(this);"></asp:FileUpload>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Image is required" ForeColor="Red" ControlToValidate="fuProductImage" SetFocusOnError="true"></asp:RequiredFieldValidator>

                                                    </div>
                                                </div>


                                                <div class="form-group">
                                                    <label>Product Category</label>
                                                    <div>
                                                        
                                                        <asp:DropDownList ID="ddlCategories" runat="server" CssClass="form-control" 
                                                          DataSourceID="SqlDataSource1" 
                                                          DataTextField="Name" 
                                                          DataValueField="CategoryId"
                                                           AppendDataBoundItems="true">
                                                            <asp:ListItem Value="0">Select Category</asp:ListItem>
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Categories is required" Display="Dynamic" SetFocusOnError="true" ControlToValidate="ddlCategories" ForeColor="Red"></asp:RequiredFieldValidator>
                                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CS %>" SelectCommand="SELECT [CategoryId], [Name] FROM [Categories]"></asp:SqlDataSource>   

                                                    </div>
                                                </div>





                                                <div class="form-check pl-4">
                                                    <asp:CheckBox runat="server" ID="cbIsActive" Text="&nbsp; IsActive" CssClass="form-check-input"></asp:CheckBox>
                                                    
                                                </div>
                                                <div class="pb-5">
                                                    <asp:Button runat="server" Text="Add" ID="btnAddorUpdate" CssClass="btn btn-primary" OnClick="btnAddorUpdate_Click" />
                                                    &nbsp;
                                                <asp:Button runat="server" Text="Clear" ID="btnClear" CssClass="btn btn-primary" CauseValidation="false" OnClick="btnClear_Click" />

                                                </div>
                                                <div>
                                                    <asp:Image runat="server" ID="imgProduct" CssClass="img-thumbnail"></asp:Image>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-sm-6 col-md-8 col-lg-8 mobile-inputs">
                                            <h4 class="sub-title">Category List</h4>

                                            <div class="card-block table-border-style">
                                                <div class="table-responsive">
                                                    <asp:Repeater runat="server" ID="rProduct" OnItemCommand="rProduct_ItemCommand" OnItemDataBound="rProduct_ItemDataBound">
                                                        <HeaderTemplate>
                                                            <table class="table data-table-export table-hover nowrap">
                                                                <thead>
                                                                    <tr>
                                                                        <th class="table-plus">Name</th>
                                                                        <th>Image</th>
                                                                        <th>Price</th>
                                                                        <th>Qty</th>
                                                                        <th>Category</th>
                                                                        <th>IsActive</th>
                                                                        <th>Description</th>
                                                                        <th>Created Date</th>
                                                                        <th class="datatable-nosort">Action</th>

                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>

                                                            <tr>
                                                                <td class="table-plus"><%#Eval("Name")%></td>
                                                                <td>
                                                                    <img src="<%#Foodies.Utils.GetImageUrl(Eval("ImageUrl"))%>" style="width: 40px;" class="img-thumbnail" />


                                                                </td>
                                                                <td><%#Eval("Price")%></td>
                                                                <td><asp:Label ID="lblQuantity" runat="server" Text='<%#Eval("Quantity")%>'></asp:Label></td>
                                                                <td><%#Eval("CategoryName")%></td>
                                                                <td>
                                                                    <asp:Label ID="lblIsActive" runat="server" Text='<%#Eval("IsActive")%>'></asp:Label>
                                                                </td>
                                                                <td><%#Eval("Description")%></td>

                                                                <td><%#Eval("CreatedDate")%></td>
                                                                <td>
                                                                    <asp:LinkButton ID="lnkEdit" Text="Edit" runat="server" CssClass="badge bg-primary"
                                                                        CommandArgument='<%#Eval("ProductId")%>' CommandName="Edit" CausesValidation="false">
                                                                    <i class="ti-pencil"></i>
                                                                    </asp:LinkButton>
                                                                    <asp:LinkButton ID="lnkDelete" Text="Delete" runat="server" CssClass="badge bg-danger"
                                                                        CommandArgument='<%#Eval("ProductId")%>' CommandName="Delete"
                                                                        OnClientClick="return confirm('Do you want to delete this Product?');" CausesValidation="false">
                                                                    <i class="ti-trash"></i>
                                                                    </asp:LinkButton>


                                                                </td>
                                                            </tr>

                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            </tbody>
                                               </table>
                                                        </FooterTemplate>


                                                    </asp:Repeater>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>


</asp:Content>
