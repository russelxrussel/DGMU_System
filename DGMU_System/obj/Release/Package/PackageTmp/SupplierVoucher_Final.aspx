<%@ Page Title="" Language="C#" MasterPageFile="~/DGMU.Master" AutoEventWireup="true" CodeBehind="SupplierVoucher_Final.aspx.cs" Inherits="DGMU_System.SupplierVoucher_Final" %>
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

       function CalculateItemCost() {
           var grid = document.getElementById("<%= gvSupplierItems.ClientID%>");
           for (var i = 0; i <= grid.rows.length - 1; i++) {
               var txtItemPerKilo = $("input[id*=txtItemPeKilo]")
               var txtItemPrice = $("input[id*=txtItemPrice]")
               var txtItemCost = $("input[id*=txtItemCost]")
               
              
               if (txtItemCost[i].value != '') {
                   
                   txtItemCost[i].value = parseFloat(txtItemPerKilo[i].value * txtItemPrice[i].value);   
                   
               }
               else {
                   txtItemCost[i].value = '0'
               }

               

           
           }


<%--           var fields = document.getElementsByClassName('xTotal');
           var runningCost = document.getElementById("<%= lblRunningCost.ClientID%>");
           var sum = 0;
           for (var i = 0; i < fields.length; ++i) {
               var item = fields[i];
               sum += parseInt(item.innerHTML);
             

               runningCost.innerHTML = sum;
           }--%>

           

          
       }
     


    
      </script>  

    <asp:UpdatePanel runat="server" ID="uplSupplier" UpdateMode="Conditional">
        <ContentTemplate>
  
            <div class="container container_content">
               
         
                <div class="panel panel-warning">
                    <div class="panel-heading">
                        <div class="row">
                    <div class="col-md-3">
                        <asp:Panel runat="server" ID="xPanelControls">
                            <asp:LinkButton runat="server" ID="U_Save_S" CssClass="btn btn-success btn-sm" OnClick="U_Save_S_Click"><span class="glyphicon glyphicon-saved"></span> SAVE and PROCESS</asp:LinkButton>
                        </asp:Panel>
                    </div>
                    
                    <div class="col-md-3 col-md-offset-6">
                        <div class="input-group input-group-sm">
                            <asp:TextBox runat="server" ID="txtPrintTransaction" CssClass="form-control" placeholder="Re-Print Voucher"></asp:TextBox>
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
                                        Supplier Input
                                    </div>
                                    <div class="panel-body">
                                        <ul class="list-group">
                                           
                                            <li class="list-group-item">
                                                <!-- Request Date-->
                                                <div class="input-group input-group-sm has-error">
                                                    <span class="input-group-addon alert-danger"><span class="glyphicon glyphicon-calendar">
                                                    </span></span>
                                                    <asp:TextBox runat="server" ID="txtReceiveDate" CssClass="calendarInput form-control"
                                                        placeholder="Date"></asp:TextBox>
                                                </div>
                                                 
                                            </li>
                                            <li class="list-group-item">
                                                <!-- Supplier-->
                                                <div class="input-group input-group-sm">
                                                    <span class="input-group-addon alert-danger"><span class="glyphicon glyphicon-record"></span>
                                                    </span>
                                                    <asp:DropDownList ID="ddSupplierList" runat="server" CssClass="dropdown form-control"
                                                        OnSelectedIndexChanged="ddSupplierList_SelectedIndexChanged" AutoPostBack="True">
                                                    </asp:DropDownList>
                                            
                                  
                                            <strong>
                                            <asp:Label runat="server" ID="lblSupplierContact" CssClass="form-control"></asp:Label></strong>
                                            <asp:Label runat="server" ID="lblSupplierNumbers" CssClass="form-control text-nowrap"></asp:Label>
                                            <asp:Label runat="server" ID="lblSupplierAddress" CssClass="form-control text-nowrap"></asp:Label>
                                           

                                        
                                        </div>
                                            </li>

                                            <li class="list-group-item">
                                                <!-- Remarks-->
                                                <asp:TextBox runat="server" ID="txtRemarks" CssClass="form-control" placeholder="Remarks"
                                                    Rows="2" TextMode="MultiLine"></asp:TextBox>
                                            </li>
                                        </ul>
                                       
                                    </div>
                                    <!--End of Supplier Panel Body -->
                                </div>
                                <!--End of Supplier Panel -->
                            </div>
                            <!--End of Left Column -->
                            <!--Middle Column -->
                            <div class="col-md-5">
   
                                        <!--Display added  Items -->
                                        <div class="panel panel-warning">
                                            <div class="panel-heading">
                                                List of Item(s) order from Supplier
                                            </div>
                                            <div class="panel-body">
                                                <div class="row">
                                                    <asp:GridView runat="server" ID="gvSupplierItems" CssClass="table table-responsive" AutoGenerateColumns="False">
                                                        <Columns>
                                                            <asp:BoundField DataField="ItemSubCatID" HeaderStyle-CssClass ="hidden" FooterStyle-CssClass="hidden" ItemStyle-CssClass="hidden">   
                                                            <FooterStyle CssClass="hidden" />
                                                            <HeaderStyle CssClass="hidden" />
                                                            <ItemStyle CssClass="hidden" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="ItemCode" HeaderStyle-CssClass ="hidden" FooterStyle-CssClass="hidden" ItemStyle-CssClass="hidden" >
                                                            <FooterStyle CssClass="hidden" />
                                                            <HeaderStyle CssClass="hidden" />
                                                            <ItemStyle CssClass="hidden" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField ="ItemSubName" />

                                                            <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Piece" ItemStyle-Width="20%">
                                                                <ItemTemplate>
                                                                   <asp:TextBox runat="server" ID="txtItemPerPiece"  CssClass="form-control"  onkeyup="CalculateItemCost(this.value)" onkeypress="return(event.charCode == 8 || event.charCode == 0) ? null: event.charCode >= 46 && event.charCode <=57"></asp:TextBox>
                                                                
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Center" Width="20%" />
                                                            </asp:TemplateField>
                                                             <asp:BoundField DataField ="InvUomCode" HeaderStyle-CssClass ="hidden" FooterStyle-CssClass="hidden" ItemStyle-CssClass="hidden" >

                                                             <FooterStyle CssClass="hidden" />
                                                            <HeaderStyle CssClass="hidden" />
                                                            <ItemStyle CssClass="hidden" />
                                                            </asp:BoundField>

                                                             <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Kilo"   ItemStyle-Width="20%">
                                                                <ItemTemplate>
                                                                   <asp:TextBox runat="server" ID="txtItemPeKilo"  CssClass="form-control" onkeyup="CalculateItemCost(this.value)" onkeypress="return(event.charCode == 8 || event.charCode == 0) ? 0: event.charCode >= 46 && event.charCode <=57"></asp:TextBox>
                                                                  
                                                                </ItemTemplate>
                                                                 <ItemStyle HorizontalAlign="Center" Width="20%" />
                                                            </asp:TemplateField>
                                                              <asp:BoundField DataField ="PurchasingUomCode" HeaderStyle-CssClass ="hidden" FooterStyle-CssClass="hidden" ItemStyle-CssClass="hidden" >

                                                             <FooterStyle CssClass="hidden" />
                                                            <HeaderStyle CssClass="hidden" />
                                                            <ItemStyle CssClass="hidden" />
                                                            </asp:BoundField>

                                                             <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Price" ItemStyle-Width="20%">
                                                                <ItemTemplate> 
                                                                        <asp:TextBox runat="server" ID="txtItemPrice" Text='<%# Eval("PriceAmount") %>' CssClass="form-control" Enabled="false"></asp:TextBox>
                                                                           
                                                                </ItemTemplate>
                                                                 <ItemStyle HorizontalAlign="Center" Width="20%" />
                                                            </asp:TemplateField>

                                                          

                                                             <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Item Cost" ItemStyle-Width="20%">
                                                                <ItemTemplate>
                                                                    
                                                                        <asp:TextBox runat="server" ID="txtItemCost"  ForeColor="Red" Font-Bold="true" CssClass="form-control xTotal"></asp:TextBox>
                                                                      
                                                                </ItemTemplate>

                                                                 <FooterTemplate>
                                                                   
                                                                 </FooterTemplate>
                                                                 <ItemStyle HorizontalAlign="Center" Width="20%" />
                                                            </asp:TemplateField>

                                                        
                                                        </Columns>
                                                        
                                                    </asp:GridView>
                                                </div>
                                            </div>
                                            <!--End of Display Panel Body -->
                                            <div class="panel-footer">
                                                <div class="text-right">
                                                    <strong>
                                                        <asp:Label runat="server" ID="lblRunningCost" CssClass="text-danger"></asp:Label></strong>
                                                        
                                                </div>
                                            </div>
                                        </div>
                                  
        
                                </div>
                            <!--Right Column -->
                            <div class="col-md-3">
                                <div class="panel panel-warning">
                                    <div class="panel-heading">Bank and Cheque Details</div>
                                    <div class="panel-body">
                                        <ul class="list-group">
                                            <li class="list-group-item">
                                                  <div class="input-group input-group-sm has-error">
                                                    <span class="input-group-addon alert-danger"><span class="glyphicon glyphicon-bookmark">
                                                    </span></span>
                                                    <asp:TextBox runat="server" ID="txtBank" CssClass= "form-control"
                                                        placeholder="Bank"></asp:TextBox>
                                                </div>
                                            </li>

                                            <li class="list-group-item">
                                                <div class="input-group input-group-sm has-error">
                                                    <span class="input-group-addon alert-danger"><span class="glyphicon glyphicon-asterisk">
                                                    </span></span>
                                                    <asp:TextBox runat="server" ID="txtChequeNumber" CssClass= "form-control"
                                                        placeholder="Cheque #"></asp:TextBox>
                                                </div>

                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            </div>
                            <!--End of Right Column -->
                        </div>
                        <!--End of Main Row -->
                    </div>
                    <!--End of Panel Body -->
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

        </ContentTemplate>
    </asp:UpdatePanel>  
     

</asp:Content>
