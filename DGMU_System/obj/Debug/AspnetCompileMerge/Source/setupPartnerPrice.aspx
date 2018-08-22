<%@ Page Title="" Language="C#" MasterPageFile="~/DGMU.Master" AutoEventWireup="true" CodeBehind="setupPartnerPrice.aspx.cs" Inherits="DGMU_System.setupPartnerPrice" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentBody" runat="server">
 


<div class="container container_content">
      <script type="text/javascript">
          $(document).ready(function() {

              $.validator.setDefaults({
                 
                  errorClass:'help-block',

                  highlight: function (element)
                  {
                      $(element)
                      .closest('.form-group')
                      .addClass('has-error');
                  },
                  unhighlight: function (element) {
                      $(element)
                      .closest('.form-group')
                      .removeClass('has-error')
                      .addClass('has-success');
                  }
              });

              $("#MasterForm").validate({
                  rules: {
                      <%=ddPartner.UniqueID %>: {
                          required: true

                        },

                        <%=ddItem.UniqueID %>: {
                         required: true
                     }

                  
                    
                    
                
                    }, messages: {
                        <%=ddPartner.UniqueID %>:{  
                         required: "Item Code is required."
                         
                     },

                     <%=ddItem.UniqueID %>: {
                         required: "Amount is required."
                     }
                    
                 }
                 
                });
            });
    </script>

<asp:UpdatePanel runat="server" ID="uplMain">
    <ContentTemplate>
<div class="row">
    
<div class="col-md-3">
    
    

 <asp:LinkButton runat="server" ID="lnkCreateItem" OnClick="lnkCreateItem_Click" 
        CssClass="btn btn-primary btn-sm"><span class="glyphicon glyphicon-plus-sign"></span> CREATE</asp:LinkButton>
</div>

 <div class="col-md-3 col-md-offset-6">
                     
                    </div>
</div>
 <hr />
  <div class="panel panel-warning">
    <div class="panel-heading">
      Maintenance of Partner Price
    </div>
    <div class="panel-body">

    <!-- Display Gridview List of Items -->
    <asp:GridView runat="server" ID="gvPartnerPriceList" 
            CssClass="table table-responsive table-hover table-condensed table-bordered" AutoGenerateColumns="False">
    
        <Columns>
            <asp:TemplateField ItemStyle-CssClass="text-left">
            <ItemTemplate>
                <asp:LinkButton runat="server" ID="lnkEditItem" CssClass="btn btn-primary btn-sm" OnClick="lnkEditItem_Click"><span class="glyphicon glyphicon-pencil"></span> Edit</asp:LinkButton>
            </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:BoundField DataField="PPID" HeaderText="ID" ItemStyle-CssClass="hidden" HeaderStyle-CssClass="hidden"/>
            <asp:BoundField DataField="PartnerName" HeaderText="Partner" />
            <asp:BoundField DataField="ItemName" HeaderText="Item" />
           <asp:BoundField DataField="PriceAmount" HeaderText="Price" />
            <asp:BoundField DataField="Description" HeaderText="Description" />
       
           
        </Columns>
    
    </asp:GridView>
 
    </div>
   </div>


        <!--MESSAGE MODAL SECTION-->

        <!--Create Update Container -->
        <div class="modal fade" id="ItemContainer" data-backdrop="static" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
              <div class="modal-content">
                <div class="modal-header bg-warning">
                    <button class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title"><asp:Label runat="server" ID="lblActionTitle"></asp:Label></h4>
                </div>

                <div class="modal-body">

                    <ul class="list-group">
                    
                    <li class="list-group-item">
                    
                    <div class="row">
                     
                          <div class="col-md-12">
                             <div class="form-group small has-error">
                                        
                                 <asp:DropDownList runat="server" CssClass="form-control" ID="ddPartner">

                                 </asp:DropDownList>
                                        

                                  </div>   
                                </div>
                        <div class="col-md-8">
                        <div class="form-group small has-error">
                             <asp:DropDownList runat="server" CssClass="form-control" ID="ddItem">
                                 </asp:DropDownList>
                                           </div>
                            
                        </div>

                        <div class="col-md-4">
                        <div class="form-group small has-error">
                             <asp:DropDownList runat="server" CssClass="form-control" ID="ddPrice">

                                 </asp:DropDownList>
                                     
                                        </div>
                            
                        </div>
                    
               
                    </li>

                    <li class="list-group-item">
                    <div class="row">
                      <div class="col-md-12">
              
                                <asp:TextBox runat="server" ID="txtRemarks" TextMode="MultiLine" Rows="2" placeholder="Description" CssClass="form-control"></asp:TextBox>
                     </div>
                        </div>
                    </li>

                    
               </ul>
              
              </div>

                <div class="modal-footer">
                    <asp:Button runat="server" ID="btnCreateUpdate"  CssClass="btn btn-success btn-sm" OnClick="btnCreateUpdate_Click" Text="Create" />
                
                <asp:LinkButton runat="server" ID="lnkClose" CssClass="btn btn-danger btn-sm" data-dismiss="modal">Cancel</asp:LinkButton>

                </div>

            </div>
            </div>

          
       </div>
     

                    <!--Message Save SUCCESS-->
                    <div class="modal fade" id="msgSuccessModal">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header bg-success">
                                    <button class="close" data-dismiss="modal">
                                        &times;</button>
                                    <h4 class="modal-title">
                                        Sr Pedro Warehouse System</h4>
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
                                        Sr Pedro Warehouse System</h4>
                                </div>
                                <div class="modal-body">
                                    <h4>
                                        <span class="glyphicon glyphicon-alert"></span>&nbsp;
                                        <asp:Label runat="server" ID="lblErrorPrompt"></asp:Label></h4>
                                </div>
                                <div class="modal-footer">
                                </div>
                            </div>
                        </div>
                    </div>

    </ContentTemplate>
</asp:UpdatePanel>
</div><!-- END OF DIV CONTAINER-->


</asp:Content>
