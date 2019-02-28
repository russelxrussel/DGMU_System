<%@ Page Title="" Language="C#" MasterPageFile="~/DGMU.Master" AutoEventWireup="true" CodeBehind="BranchSalesEntry.aspx.cs" Inherits="DGMU_System.BranchSalesEntry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentBody" runat="server">
       
  <br />
   <div class="container container_content">
      <asp:UpdatePanel runat="server" ID="uplSupplier" UpdateMode="Conditional">
        <ContentTemplate>

              <script type="text/javascript">
        
                  $(function () {
                      $('.calendarInput').datetimepicker(
                          {
                              format: 'L'
                          });
                  });
            //Search function
            $(function searchInput() {
                $('[id*=txtSearch]').on("keyup", function () {
                    var value = $(this).val().toLowerCase();
                    $('[id*=gvBranchList] tr').filter(function () {
                        $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                    });
                });
            });

            //On UpdatePanel Refresh
            var prm = Sys.WebForms.PageRequestManager.getInstance();
            if (prm != null) {
                prm.add_endRequest(function (sender, e) {
                    if (sender._postBackSettings.panelsToUpdate != null) {
                       
                        $(function () {
                            $('.calendarInput').datetimepicker(
                                {
                                    format: 'L'
                                });
                        });

                        //Search function
                        $(function searchInput() {
                            $('[id*=txtSearch]').on("keyup", function () {
                                var value = $(this).val().toLowerCase();
                                $('[id*=gvBranchList] tr').filter(function () {
                                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                                });
                            });
                        });

                    }
                });
            };
    </script>
              
              <div class="panel panel-danger">
               <div class="panel-heading">Branch Sales Entry</div>
                  <div class="panel-body">
                <div class="row">
                    <!--Main Row -->
                    <!--Left Column -->
                    <div class="col-md-5">
                        <!--Supplier Panel -->
                        <div class="panel panel-success">
                            <div class="panel-heading">
                                Branches Selection
                            </div>
                            <div class="panel-body">
                                <ul class="list-group">

                                    <li class="list-group-item">
                                        <!-- Branch -->
                                        <div class="input-group">
                                            <asp:TextBox runat="server" ID="txtSearch" CssClass="form-control" placeholder="Search"></asp:TextBox>
                                            <span class="input-group-addon"><span class="glyphicon glyphicon-search"></span></span>
                                        </div>
                                    </li>

                                    <li class="list-group-item">
                                        <asp:Panel runat="server" Height="500px" ScrollBars="Vertical">
                                            <asp:GridView runat="server" ID="gvBranchList" CssClass="table table-hover table-responsive table-condensed" AutoGenerateColumns="false" OnRowCommand="gvBranchList_RowCommand">
                                                <Columns>
                                                    <asp:BoundField DataField="BranchCode" HeaderText="Code" />
                                                    <asp:BoundField DataField="BranchName" HeaderText="Description" />

                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <asp:LinkButton runat="server" ID="lnkEncodeSales" CssClass="btn btn-sm btn-primary" CommandName="Select"><span class="glyphicon glyphicon-pencil"></span></asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    
                                                </Columns>
                                            </asp:GridView>
                                        </asp:Panel>
                                    </li>


                                </ul>

                            </div>
                            </div>
                        </div>
                        <!--End of Supplier Panel -->
                   
                    <!--End of Left Column -->
                    <!--Middle Column -->
                    <div class="col-md-7">
                        <div class="panel panel-success">
                            <div class="panel-heading"><asp:Label runat="server" ID="lblBranchSelected"></asp:Label></div>
                            <div class="panel-body">
                                
                                <asp:Panel runat="server" ID="panelEntry" Enabled="false">
                                    <ul class="list-group">
                                        <li class="list-group-item">
                                             <!-- Date-->
                                                                                
                                         <div class="input-group">
                                             <span class="input-group-addon">Sales Date <span class="glyphicon glyphicon-calendar"></span></span>
                                            <asp:TextBox runat="server" ID="txtDate" CssClass="calendarInput form-control"></asp:TextBox>
                                        </div>
                                        </li>
                                        <li class="list-group-item">
                                             <asp:GridView runat="server" ID="gvItemList" CssClass="table table-responsive" AutoGenerateColumns="false" OnRowDataBound="gvItemList_RowDataBound">
                                        <Columns>
                                            <asp:BoundField DataField="Branch_ItemCode" HeaderText="Code" />
                                            <asp:BoundField DataField="Branch_ItemName" HeaderText="Description" />

                                            <asp:TemplateField HeaderText="Quantity" HeaderStyle-CssClass="text-center">

                                                <ItemTemplate>
                                                    <asp:TextBox runat="server" ID="txtQuantity" CssClass="form-control text-center" Text="0" onkeypress="return(event.charCode == 8 || event.charCode == 0) ? null: event.charCode >= 46 && event.charCode <=57"></asp:TextBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Available" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" ID="lblBranchItemAvailable"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                        </li>

                                        <li class="list-group-item">
                                            <div class="text-right">
                                            <asp:LinkButton runat="server" ID="lnkProcessSales" CssClass="btn btn-primary" OnClick="lnkProcessSales_Click"><span class="glyphicon glyphicon-transfer"></span> Process</asp:LinkButton>
                                            </div>
                                        </li>
                                    </ul>
                                      
                                   
                               </asp:Panel>
                            </div>
                        </div>
                    </div>
                    <!--End of Right Column -->

                    <!--End of Main Row -->
                </div>
              </div>
      
                </div>

              <!--MESSAGE MODAL SECTION-->
                    <!--Message Save SUCCESS-->
                    <div class="modal fade" id="msgSuccessModal">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header bg-success">
                                    <button class="close" data-dismiss="modal">
                                        &times;</button>
                                    <h4 class="modal-title">
                                         DGMU Enterprise System</h4>
                                </div>
                                <div class="modal-body">
                                    <h4>
                                        <span class="glyphicon glyphicon-success"></span>&nbsp;
                                        <asp:Label runat="server" ID="lblMessageSuccess"></asp:Label></h4>
                                </div>
                                <div class="modal-footer">
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--Message Error -->
                        <!--Message Error -->
                    <div class="modal fade" id="msgErrorModal">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header bg-danger">
                                    <button class="close" data-dismiss="modal">
                                        &times;</button>
                                    <h4 class="modal-title">
                                        DGMU Enterprise System</h4>
                                </div>
                                <div class="modal-body">
                                    <h4>
                                        <span class="glyphicon glyphicon-alert"></span>&nbsp;
                                        <asp:Label runat="server" ID="lblErrorMessage"></asp:Label></h4>
                                </div>
                                <div class="modal-footer">
                                     <p>Developed by: Russel Vasquez &copy;</p>
                                </div>
                            </div>
                        </div>
                    </div>
     </ContentTemplate>
                 </asp:UpdatePanel>  
            </div>


      
     

</asp:Content>
