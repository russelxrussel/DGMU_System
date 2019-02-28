<%@ Page Title="" Language="C#" MasterPageFile="~/DGMU.Master" AutoEventWireup="true" CodeBehind="BranchBeginningStock.aspx.cs" Inherits="DGMU_System.BranchBeginningStock" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentBody" runat="server">
   
            <div class="container container_content">
                <br />

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
                    $('[id*=gvBranchStockList] tr').filter(function () {
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
                                $('[id*=gvBranchStockList] tr').filter(function () {
                                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                                });
                            });
                        });

                    }
                });
            };
    </script>



                <div class="panel panel-info">
                    <div class="panel-heading">
                        
                        <div class="row">
                           
                            <div class="col-md-4">
                                <div class="input-group">
                                    <span class="input-group-addon alert-danger"><span class="glyphicon glyphicon-briefcase"></span> Select Partner:
                                    </span>
                                    <asp:DropDownList runat="server" ID="ddPartnerList" CssClass="form-control"></asp:DropDownList>
                                    

                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="input-group">
                                    <span class="input-group-addon alert-danger"><span class="glyphicon glyphicon-compressed"></span> Select Item
                                    </span>
                                   
                                    <asp:DropDownList runat="server" ID="ddItemList" CssClass="form-control"></asp:DropDownList>
                                    <span class="input-group-btn">
                                        <asp:LinkButton runat="server" OnClick="lnkViewStock_Click" ID="lnkViewStock" CssClass="btn btn-primary"><span class="glyphicon glyphicon-arrow-right"></span></asp:LinkButton></span>

                                </div>
                            </div>
                        </div>
                        
                       
                            
                        
                    </div>
                    
                    <div class="panel-body">
                    
                        <div class="row">
                            <div class="col-md-5">
                                <asp:Label runat="server" ID="lblPartnersBranch"></asp:Label>
                               
                            </div>
                            <div class="col-md-5 col-md-offset-2 text-right">
                                <div class="input-group">
                                            <asp:TextBox runat="server" ID="txtSearch" CssClass="form-control" placeholder="Search"></asp:TextBox>
                                            <span class="input-group-addon"><span class="glyphicon glyphicon-search"></span></span>
                                        </div>
                                 <br />
                                <asp:LinkButton runat="server" ID="lnkUpdateBeginning" CssClass="btn btn-primary" OnClick="lnkUpdateBeginning_Click">Update </asp:LinkButton>
                            </div>
                            
                            

                        </div>
                        <br />

                    <div class="row">
                                                       
                            <div class="col-md-12">
                                <asp:Panel ID="panelBranchItemStocks" runat="server" Height="600px" ScrollBars="Vertical">
                                    <asp:GridView ID="gvBranchStockList" runat="server" AutoGenerateColumns="false" CssClass="table table-responsive table-hover" OnRowDataBound="gvBranchStockList_RowDataBound">
                                        <Columns>
                                            <asp:BoundField DataField="BranchCode" />
                                            <asp:BoundField DataField="BranchName" HeaderText="Branch" />
                                            <asp:TemplateField HeaderStyle-CssClass="text-center" HeaderText="Beginning Stock" ItemStyle-CssClass="text-center text-success" ItemStyle-Font-Bold="true">
                                                <ItemTemplate>
                                                    <strong>
                                                    <asp:TextBox runat="server" ID="txtBeginningStock" Text='<%# Eval("Beginning_Stock") %>' CssClass="form-control" onkeypress="return(event.charCode == 8 || event.charCode == 0) ? null: event.charCode >= 46 && event.charCode <=57"></asp:TextBox>
                                                    </strong>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <%--<asp:TemplateField HeaderStyle-CssClass="text-center" HeaderText="Opening" ItemStyle-CssClass="text-center" ItemStyle-Font-Bold="true">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblOpening" runat="server"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderStyle-CssClass="text-center" HeaderText="Delivered" ItemStyle-CssClass="text-center text-primary" ItemStyle-Font-Bold="true">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblDelivered" runat="server"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderStyle-CssClass="text-center" HeaderText="Sales/Return" ItemStyle-CssClass="text-center text-danger" ItemStyle-Font-Bold="true">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblSalesReturn" runat="server"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderStyle-CssClass="text-center" HeaderText="Stock On Hand" ItemStyle-CssClass="text-center text-success" ItemStyle-Font-Bold="true">
                                                <ItemTemplate>
                                                    <strong>
                                                    <asp:Label ID="lblStockOnHand" runat="server"></asp:Label>
                                                    </strong>
                                                </ItemTemplate>
                                            </asp:TemplateField>--%>
                                        </Columns>
                                    </asp:GridView>
                                </asp:Panel>
                            </div>
                           </h4>
                        
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
                   
                   
                  </div>
                </div>
                <!--End of Main Panel Body -->
                <!-- End of uplSupplier -->
     
            
      </ContentTemplate>
                 </asp:UpdatePanel>  
                </div>
            <!-- End of Main Panel -->
            <!-- End of Container -->

      
     

</asp:Content>
