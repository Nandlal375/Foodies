<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Contacts.aspx.cs" Inherits="Foodies.Admin.Contacts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <script>
        window.onload = function () {
            setTimeout(function () {
                document.getElementById("<%=lblMsg.ClientID%>").style.display = "none";
        }, 5000);

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
                                   
                                    <div class="col-12 mobile-inputs">
                                        <h4 class="sub-title">Contact Lists</h4>

                                        <div class="card-block table-border-style">
                                            <div class="table-responsive">
                                                <asp:Repeater runat="server" ID="rContacts" OnItemCommand="rContacts_ItemCommand">
                                                    <HeaderTemplate>
                                                        <table class="table data-table-export table-hover nowrap">
                                                            <thead>
                                                                <tr>
                                                                    <th class="table-plus">SrNo</th>
                                                                    <th>User Name</th>
                                                                    <th>Email</th>
                                                                    <th>Subject</th>
                                                                    <th>Message</th>
                                                                    <th>Contact Date</th>
                                                                    <th class="datatable-nosort">Delete</th>

                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>

                                                        <tr>
                                                            <td><%#Eval("SrNo")%></td>
                                                            <td><%#Eval("Name")%></td>
                                                            <td><%#Eval("Email")%></td>
                                                            <td><%#Eval("Subject")%></td>
                                                            <td><%#Eval("Message")%></td>
                                                            <td><%#Eval("CreatedDate")%></td>
                                                            <td>
                                                                
                                                                <asp:LinkButton ID="lnkDelete" Text="Delete" runat="server" CssClass="badge bg-danger"
                                                                    CommandArgument='<%#Eval("ContactId")%>' CommandName="Delete"
                                                                    OnClientClick="return confirm('Do you want to delete this User?');">
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
