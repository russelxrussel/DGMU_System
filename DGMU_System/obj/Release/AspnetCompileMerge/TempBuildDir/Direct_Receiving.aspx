<%@ Page Title="" Language="C#" MasterPageFile="~/DGMU.Master" AutoEventWireup="true" CodeBehind="Direct_Receiving.aspx.cs" Inherits="DGMU_System.Direct_Receiving" %>
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
                            <asp:TextBox runat="server" ID="txtPrintTransaction" CssClass="form-control" placeholder="Re-Print Receiving" MaxLength="12"></asp:TextBox>
                            <span class="input-group-btn">
                                <asp:LinkButton runat="server" ID="lnkPrintTransaction" CssClass="btn btn-primary btn-sm"
                                    OnClick="lnkPrintTransaction_Click">Print</asp:LinkButton>
                            </span>
                        </div>
                    </div>
                </div>
                    </div>
 <asp:UpdatePanel runat="server" ID="uplSupplier" UpdateMode="Conditional">
        <ContentTemplate>
                    <div class="panel-body">
                        <div class="row">
                            <!--Main Row -->
                            <!--Left Column -->
                            <div class="col-md-5">
                                <!--Supplier Panel -->
                                <div class="panel panel-success">
                                    <div class="panel-heading">
                                       Receiving Details
                                    </div>
                                    <div class="panel-body">
                                        <ul class="list-group">
                                           
                                            <li class="list-group-item">
                                                <!-- Date-->
                                                <div class="input-group input-group-sm has-error">
                                                    <span class="input-group-addon alert-danger"><span class="glyphicon glyphicon-calendar">
                                                    </span></span>
                                                    <asp:TextBox runat="server" ID="txtReceiveDate" CssClass="calendarInput form-control"
                                                        placeholder="Receiving Date"></asp:TextBox>
                                                </div>
                                                 
                                            </li>
                                            
                                            <li class="list-group-item">
                                                <!-- Branch -->
                                                <div class="input-group input-group-sm has-error">
                                                    <span class="input-group-addon alert-danger"><span class="glyphicon glyphicon-record">
                                                    </span></span>
                                                 <asp:DropDownList ID="ddSupplierList" runat="server"  CssClass="dropdown form-control">
                                                            </asp:DropDownList>
                                                </div>
                                            </li>

                                            <li class="list-group-item">
                                                <!-- Remarks-->
                                                <asp:TextBox runat="server" ID="txtRemarks" CssClass="form-control" placeholder="Remarks"
                                                    Rows="3" TextMode="MultiLine"></asp:TextBox>
                                            </li>

                                            <li class="list-group-item">
                                                <div class="input-group">

                                                
                                              

                    </div>
                                            </li>
                                        </ul>
                                       
                                    </div>
                               
                                </div>
                                <!--End of Supplier Panel -->
                            </div>
                            <!--End of Left Column -->
                            <!--Middle Column -->
                            <div class="col-md-7">
                                  <div class="panel panel-success">
                                    <div class="panel-heading">Receive Item</div>
                                  <div class="panel-body">
                                    <asp:GridView runat="server" ID="gvItemList" CssClass="table table-responsive" AutoGenerateColumns="false">
                                        <Columns>
                                            <asp:BoundField DataField="ItemCode" HeaderText ="Code"/>
                                            <asp:BoundField DataField="ItemName" HeaderText ="Description" />
                                           
                                             <asp:TemplateField HeaderText="Quantity" HeaderStyle-CssClass="text-center">
                                              
                                                <ItemTemplate>
                                                    <asp:TextBox runat="server" ID="txtQuantity" CssClass="form-control text-center" Text="0" onkeypress="return(event.charCode == 8 || event.charCode == 0) ? null: event.charCode >= 46 && event.charCode <=57"></asp:TextBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                  </div>    
                                  </div>
                            </div>
                            <!--End of Right Column -->
                        
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
                     </ContentTemplate>
                 </asp:UpdatePanel>  

                </div>
                <!--End of Main Panel Body -->
                <!-- End of uplSupplier -->
     
            </div>

            <!-- End of Main Panel -->
            <!-- End of Container -->

      
     

</asp:Content>
