<%@ Page Title="" Language="C#" MasterPageFile="~/DGMU.Master" AutoEventWireup="true" CodeBehind="BranchSalesPosting.aspx.cs" Inherits="DGMU_System.BranchSalesPosting" %>
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
                    $('[id*=gvBranchSalesForPosting] tr').filter(function () {
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
                                $('[id*=gvBranchSalesForPosting] tr').filter(function () {
                                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                                });
                            });
                        });

                    }
                });
            };
    </script>



                <div class="panel panel-primary">
                    <div class="panel-heading">
                       
                        Sales Posting
                       
                            
                        
                    </div>
                    
                    <div class="panel-body">
                    
                        <div class="row">
                            <div class="col-md-5">
                                <div class="input-group">
                                            <asp:TextBox runat="server" ID="txtSearch" CssClass="form-control" placeholder="Search"></asp:TextBox>
                                            <span class="input-group-addon"><span class="glyphicon glyphicon-search"></span></span>
                                        </div>     
                            </div>
                            <div class="col-md-5 col-md-offset-2 text-right">
                                <asp:LinkButton runat="server" ID="lnkPostAll" CssClass="btn btn-primary" OnClick="lnkPostAll_Click">POST ALL</asp:LinkButton>
                            </div>
                            
                            

                        </div>
                        <br />
                        

                    <div class="row">
                                                       
                            <div class="col-md-12">
                                <asp:Panel ID="panelBranchItemStocks" runat="server" Height="600px" ScrollBars="Vertical">
                                    <asp:GridView ID="gvBranchSalesForPosting" runat="server" AutoGenerateColumns="false" CssClass="table table-responsive table-hover" OnRowCommand="gvBranchSalesForPosting_RowCommand">
                                        <Columns>
                                            <asp:BoundField DataField="salesNum" />
                                            <asp:BoundField DataField="branchName" HeaderText ="Branch" />
                                            <asp:BoundField DataField="SalesDate" DataFormatString="{0:d}"  HeaderText ="Sales Date"/>
                                           <asp:TemplateField>
                                                <ItemTemplate>
                                                 <asp:LinkButton runat="server" ID="lnkView" CssClass="btn btn-sm btn-warning" CommandName="View"><span class="glyphicon glyphicon-search"></span> View</asp:LinkButton>
                                                 <asp:LinkButton runat="server" ID="lnkPost" CssClass="btn btn-sm btn-primary" CommandName="Post"><span class="glyphicon glyphicon-ok"></span> Post</asp:LinkButton>
                                                 
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                             <asp:TemplateField>
                                                <ItemTemplate>
                                             <asp:LinkButton runat="server" ID="lnkCancel" CssClass="btn btn-sm btn-danger" CommandName="Cancel"><span class="glyphicon glyphicon-remove"></span> CANCEL</asp:LinkButton>     
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </asp:Panel>
                            </div>
                           </h4>
                        
                  </div>
                    

                    <div class="modal fade" id="ItemContainer" data-backdrop="static" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
              <div class="modal-content">
                <div class="modal-header bg-warning">
                    <button class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title"><asp:Label runat="server" ID="lblActionTitle"></asp:Label></h4>
                </div>

                <div class="modal-body">

                   <div class="row">
                       <div class="col-md-12">
                       <asp:GridView runat="server" ID="gvSalesItemList" CssClass="table table-responsive table-hover" AutoGenerateColumns="false">
                           <columns>
                               <asp:BoundField DataField="SalesDate" DataFormatString="{0:d}" HeaderText="Sales Date" />
                               <asp:BoundField DataField="Branch_ItemName" HeaderText="Item" />
                               <asp:BoundField DataField="Quantity" HeaderText="Quantity"/>
                           </columns>
                       </asp:GridView>
                           </div>
                   </div>
                          
                    </div>

                <div class="modal-footer">
                  
                
                <asp:LinkButton runat="server" ID="lnkClose" CssClass="btn btn-danger btn-sm" data-dismiss="modal">Close</asp:LinkButton>

                </div>

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
                                    <p>Developed by: Russel Vasquez &copy;</p>
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
