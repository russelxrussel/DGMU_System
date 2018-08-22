<%@ Page Title="" Language="C#" MasterPageFile="~/DGMU.Master" AutoEventWireup="true" CodeBehind="StockTransfer.aspx.cs" Inherits="DGMU_System.StockTransfer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentBody" runat="server">
   <script type="text/javascript">
       $(function () {
           $('.calendarInput').datetimepicker(
               {
                format: 'L'
               });
       });
      </script>  

    <asp:UpdatePanel runat="server" ID="uplSupplier" UpdateMode="Conditional">
        <ContentTemplate>
  
            <div class="container container_content">
     
                <div class="panel panel-warning">
                    <div class="panel-heading">
                        <div class="row">
                    <div class="col-md-3">
                        <asp:Panel runat="server" ID="xPanelControls">
                            <asp:LinkButton runat="server" ID="U_Save_S" CssClass="btn btn-success btn-sm" OnClick="U_Save_S_Click"><span class="glyphicon glyphicon-saved"></span> PROCESS</asp:LinkButton>
                        </asp:Panel>
                    </div>
                    
                    <div class="col-md-3 col-md-offset-6">
                        <div class="input-group input-group-sm">
                            <asp:TextBox runat="server" ID="txtPrintTransaction" CssClass="form-control" placeholder="Re-Print ST#" MaxLength="9"></asp:TextBox>
                            <span class="input-group-btn">
                                <asp:LinkButton runat="server" ID="lnkPrintTransaction" CssClass="btn btn-primary btn-sm"
                                    OnClick="lnkPrintTransaction_Click">Print</asp:LinkButton>
                            </span>
                        </div>
                    </div>
                </div>
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <!--Main Row -->
                            <!--Left Column -->
                            <div class="col-md-4">
                                <!--Supplier Panel -->
                                <div class="panel panel-warning">
                                    <div class="panel-heading">
                                       Transfer Stock
                                    </div>
                                    <div class="panel-body">
                                        <ul class="list-group">
                                           
                                            <li class="list-group-item">
                                                <!-- Date-->
                                                <div class="input-group input-group-sm has-error">
                                                    <span class="input-group-addon alert-danger"><span class="glyphicon glyphicon-calendar">
                                                    </span></span>
                                                    <asp:TextBox runat="server" ID="txtTransferDate" CssClass="calendarInput form-control"
                                                        placeholder="Transfer Date"></asp:TextBox>
                                                </div>
                                                 
                                            </li>
                                            

                                            <li class="list-group-item">
                                                <!-- Remarks-->
                                                <asp:TextBox runat="server" ID="txtRemarks" CssClass="form-control" placeholder="Remarks"
                                                    Rows="3" TextMode="MultiLine"></asp:TextBox>
                                            </li>
                                        </ul>
                                       
                                    </div>
                               
                                </div>
                                <!--End of Supplier Panel -->
                            </div>
                            <!--End of Left Column -->
                            <!--Middle Column -->
                            <div class="col-md-4">
                                  <div class="panel panel-warning">
                                    <div class="panel-heading">Stock From</div>
                                  <div class="panel-body">
                                      <ul class="list-group">
                                          <li class="list-group-item">
                                               <div class="input-group input-group-sm has-error">
                                                    <span class="input-group-addon alert-danger"><span class="glyphicon glyphicon-record"></span>
                                                    </span>
                                                <asp:DropDownList ID="ddStorageFrom" runat="server"  CssClass="dropdown form-control">
                                                            </asp:DropDownList>
                                                
                                                </div>
                                          </li>

                                          <li class="list-group-item">
                                              
                                               <div class="input-group input-group-sm has-error">
                                                    <span class="input-group-addon alert-danger"><span class="glyphicon glyphicon-record"></span>
                                                    </span>
                                                <asp:DropDownList ID="ddItem" runat="server" AutoPostBack="true"
                                                  CssClass="dropdown form-control" OnSelectedIndexChanged="ddItem_SelectedIndexChanged">
                                                            </asp:DropDownList>
                                                   <span class="input-group-addon">
                                                <asp:Label runat="server" ID="lblAvailableStock"></asp:Label>
                                                       </span>
                                                </div>
                                        
                                     
                                          </li>

                                          <li class="list-group-item">
                                                 <!--Quantity Input -->
                                                       
                                                        <div class="input-group input-group-sm  has-error">
                                                            <span class="input-group-addon alert-danger">Quantity</span><asp:TextBox runat="server"
                                                                CssClass="form-control" ID="txtQuantity" MaxLength="8" placeholder="Quantity" onkeypress="return(event.charCode == 8 || event.charCode == 0) ? null: event.charCode >= 46 && event.charCode <=57"></asp:TextBox>
                                                            
                                                        </div>
                                                   
                                          </li>

                                      </ul>
                                  </div>    
                                  </div>
                            </div>
                            <!--End of Right Column -->
                         <!--Middle Column -->
                            <div class="col-md-4">
                                  <div class="panel panel-warning">
                                    <div class="panel-heading">Stock To</div>
                                  <div class="panel-body">
                                      <ul class="list-group">
                                          <li class="list-group-item">
                                               <div class="input-group input-group-sm has-error">
                                                    <span class="input-group-addon alert-danger"><span class="glyphicon glyphicon-record"></span>
                                                    </span>
                                                <asp:DropDownList ID="ddStorageTo" runat="server" CssClass="dropdown form-control">
                                                            </asp:DropDownList>
                                                
                                                </div>
                                          </li>

                                          

                                         

                                      </ul>
                                  </div>    
                                  </div>
                            </div>
                        <!--End of Main Row -->
                    </div>
                    <!--End of Panel Body -->
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
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--End of Main Panel Body -->
                <!-- End of uplSupplier -->
            </div>

            <!-- End of Main Panel -->
            <!-- End of Container -->

        </ContentTemplate>
    </asp:UpdatePanel>  
     

</asp:Content>
