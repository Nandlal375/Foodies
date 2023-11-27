<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Category.aspx.cs" Inherits="Foodies.Admin.Category" %>

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

                    $("#<%=imgCategory.ClientID%>").prop('src', e.target.result)
                        .width(200)
                        .height(200);
                };
                render.readAsDataURL(input.files[0]);
            }
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
                                            <h4 class="sub-title">Category</h4>
                                            <div>
                                                <div class="form-group">
                                                    <label>Category Name</label>
                                                    <div>
                                                        <asp:TextBox runat="server" ID="txtName" CssClass="form-control" Placeholder="Enter Category Name" required>
                                                        </asp:TextBox>
                                                        <asp:HiddenField runat="server" Value="0" ID="hdnId"></asp:HiddenField>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label>Category Image</label>
                                                    <div>
                                                        <asp:FileUpload runat="server" ID="fuCategoryImage" CssClass="form-control" onchange="ImagePreview(this);"></asp:FileUpload>
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
                                                    <asp:Image runat="server" ID="imgCategory" CssClass="img-thumbnail"></asp:Image>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-sm-6 col-md-8 col-lg-8 mobile-inputs">
                                            <h4 class="sub-title">Category List</h4>

                                            <div class="card-block table-border-style">
                                                <div class="table-responsive">
                                                    <asp:Repeater runat="server" ID="rCategory" OnItemCommand="rCategory_ItemCommand" OnItemDataBound="rCategory_ItemDataBound">
                                                        <HeaderTemplate>
                                                            <table class="table data-table-export table-hover nowrap">
                                                                <thead>
                                                                    <tr>
                                                                        <th class="table-plus">Name</th>
                                                                        <th>Image</th>
                                                                        <th>IsActive</th>
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

                                                                <td>
                                                                    <asp:Label ID="lblIsActive" runat="server" Text='<%#Eval("IsActive")%>'></asp:Label>
                                                                </td>
                                                                <td><%#Eval("CreatedDate")%></td>
                                                                <td>
                                                                    <asp:LinkButton ID="lnkEdit" Text="Edit" runat="server" CssClass="badge bg-primary"
                                                                        CommandArgument='<%#Eval("CategoryId")%>' CommandName="Edit">
                                                                        <i class="ti-pencil"></i>
                                                                    </asp:LinkButton>
                                                                    <asp:LinkButton ID="lnkDelete" Text="Delete" runat="server" CssClass="badge bg-danger"
                                                                        CommandArgument='<%#Eval("CategoryId")%>' CommandName="Delete"
                                                                        OnClientClick="return confirm('Do you want to delete this category?');">
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
