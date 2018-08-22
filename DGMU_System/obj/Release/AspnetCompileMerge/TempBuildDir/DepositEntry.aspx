<%@ Page Title="" Language="C#" MasterPageFile="~/DGMU.Master" AutoEventWireup="true" CodeBehind="DepositEntry.aspx.cs" Inherits="DGMU_System.DepositEntry" %>

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

  <%--  <asp:UpdatePanel runat="server" ID="uplSupplier" UpdateMode="Conditional">
        <ContentTemplate>--%>
  
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
                            <asp:TextBox runat="server" ID="txtPrintTransaction" CssClass="form-control" placeholder="Re-Print PD#" MaxLength="9"></asp:TextBox>
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
                                       Partner Payment
                                    </div>
                                    <div class="panel-body">
                                        <ul class="list-group">
                                           
                                           <li class="list-group-item">
                                                <div class="input-group input-group-sm has-error">
                                                    <span class="input-group-addon alert-danger"><span class="glyphicon glyphicon-calendar">
                                                    </span></span>
                                                    <asp:DropDownList ID="ddPartner" OnSelectedIndexChanged="ddPartner_SelectedIndexChanged" runat="server" AutoPostBack="true"
                                                  CssClass="dropdown form-control">
                                                            </asp:DropDownList>
                                                </div>
                                            </li>

                                            <li class="list-group-item">
                                                <!-- Date-->
                                                <div class="input-group input-group-sm has-error">
                                                    <span class="input-group-addon alert-danger"><span class="glyphicon glyphicon-calendar">
                                                    </span></span>
                                                    <asp:TextBox runat="server" ID="txtPaymentDate"  CssClass="form-control calendarInput" placeholder="Payment Date"></asp:TextBox>
                                                </div>
                                                 
                                            </li>

                                             <li class="list-group-item">
                                                <!-- Payment -->
                                                <div class="input-group input-group-sm has-error">
                                                    <span class="input-group-addon alert-danger"><span class="glyphicon glyphicon-calendar">
                                                    </span></span>
                                                    <asp:TextBox runat="server" ID="txtPaymentAmount" CssClass="form-control"
                                                        placeholder="Amount" onkeypress="return(event.charCode == 8 || event.charCode == 0) ? null: event.charCode >= 46 && event.charCode <=57"></asp:TextBox>
                                                </div>
                                                 
                                            </li>

                                             
                                             <li class="list-group-item">
                                                <!-- Date-->
                                                <div class="input-group input-group-sm has-error">
                                                    <span class="input-group-addon alert-danger"><span class="glyphicon glyphicon-calendar">
                                                    </span></span>
                                                    <asp:TextBox runat="server" ID="txtBank" CssClass="form-control"
                                                        placeholder="Bank"></asp:TextBox>
                                                </div>
                                                 
                                            </li>

                                             <li class="list-group-item">
                                                
                                                <div class="input-group input-group-sm has-error">
                                                    <span class="input-group-addon alert-danger"><span class="glyphicon glyphicon-calendar">
                                                    </span></span>
                                                    <asp:TextBox runat="server" ID="txtChequeNumber" CssClass="form-control"
                                                        placeholder="Cheque Number"></asp:TextBox>
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
                            <div class="col-md-5 small">
                           
                                    <div class="panel panel-success">
                                    <div class="panel-heading">Payment Deposit Details</div>
                                  <div class="panel-body">
                                     <asp:Panel runat="server" ID="panPaymentHistory" Height="400px" ScrollBars="Vertical">
                                         <asp:GridView runat="server" ID="gvPaymentHistory" CssClass="table table-condensed" AutoGenerateColumns="false">
                                             <Columns>
                                                 
                                                 <asp:BoundField DataField="DepositNum" HeaderText="Deposit #" />
                                                 <asp:BoundField DataField="DepositDate" HeaderText="Payment Date" dataformatstring="{0:MM-d-yyyy}" />
                                                 <asp:BoundField DataField="DepositAmount" HeaderText="Amount" DataFormatString="{0:N2}" />
                                             </Columns>
                                         </asp:GridView>

                                     </asp:Panel>
                                  </div>    
                                  </div>
                                </div>
                                 
                           
                            <!--End of Right Column -->
                         <!--Middle Column -->
                            <div class="col-md-3 small">
                                <div class="row">
                                      <asp:Panel runat="server" ID="panelBalanceDetails">
                                        <div class="panel panel-danger">
                                            <div class="panel-heading">Balance Details</div>
                                        <div class="panel-body">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <ul class="list-group">
                                                        <li class="list-group-item">
                                                          Deposit:  <asp:label runat="server" ID="lblTotalPayment"></asp:label>
                                                        </li>
                                                        <li class="list-group-item">
                                                          Payable:  <asp:Label runat="server" ID="lblTotalPayable"></asp:Label>
                                                        </li>
                                                        <li class="list-group-item list-group-item-danger text-center">
                                                          <h4><asp:Label runat="server" ID="lblTotalBalance" CssClass=""></asp:Label></h4>
                                                        </li>
                                                    </ul>
                                                </div>
                                               
                                                    
                                               
                                            </div>
                                        </div>
                                        </div>
                                    </asp:Panel>
                                </div>
                                <div class="row">
                                  <div class="panel panel-warning">
                                    <div class="panel-heading">Partner Payable</div>
                                  <div class="panel-body">
                                      <asp:Panel runat="server" ID="panPayable" Height="200px" ScrollBars="Vertical">
                                         <asp:GridView runat="server" ID="gvPartnerPayable" CssClass="table table-condensed" AutoGenerateColumns="false">
                                             <Columns>
                                                 
                                                 <asp:BoundField DataField="OrderDate" HeaderText="Date" dataformatstring="{0:MM-d-yyyy}" />
                                                 <asp:BoundField DataField="PayableAmount" HeaderText="Payable" DataFormatString="{0:N2}" />
                                             </Columns>
                                         </asp:GridView>

                                     </asp:Panel>
                                  </div>    
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
          

            <!-- End of Main Panel -->
            <!-- End of Container -->

     <%--   </ContentTemplate>
    </asp:UpdatePanel>  --%>
     

</asp:Content>
