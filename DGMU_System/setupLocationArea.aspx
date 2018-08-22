<%@ Page Title="" Language="C#" MasterPageFile="~/DGMU.Master" AutoEventWireup="true" CodeBehind="setupLocationArea.aspx.cs" Inherits="DGMU_System.setupLocationArea" %>
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
                      <%=txtLocationAreaCode.UniqueID %>: {
                            required: true,
                            minlength: 6
                        
                        },

                        <%=txtLocationName.UniqueID %>: {
                         required: true
                     }

                  
                    
                    
                
                    }, messages: {
                        <%=txtLocationAreaCode.UniqueID %>:{  
                         required: "Item Code is required." ,
                         minlength: "Required 6 Characters"
                     },

                     <%=txtLocationName.UniqueID %>: {
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
      Maintenance of Location Area
    </div>
    <div class="panel-body">

    <!-- Display Gridview List of Items -->
    <asp:GridView runat="server" ID="gvLocationArea" 
            CssClass="table table-responsive table-hover table-condensed table-bordered" AutoGenerateColumns="False">
    
        <Columns>
            <asp:TemplateField ItemStyle-CssClass="text-left">
            <ItemTemplate>
            <asp:Button ID="btnEditItem" runat="server" CssClass="btn btn-primary btn-sm" Text="Edit" OnClick="btnEditItem_Click" />
            </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:BoundField DataField="LAID" HeaderText="ID" ItemStyle-CssClass="hidden" HeaderStyle-CssClass="hidden" />
            <asp:BoundField DataField="LACode" HeaderText="Code" />
           <asp:BoundField DataField="LAName" HeaderText="Name" />
       
           
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
                     
                          <div class="col-md-6">
                             <div class="form-group small has-error">
                                        
                                            <asp:TextBox runat="server" CssClass="form-control text-uppercase" ID="txtLocationAreaCode"
                                                placeholder="AREA CODE" MaxLength="6"></asp:TextBox>
                                       

                                  </div>   
                                </div>
                        <div class="col-md-6">
                        <div class="form-group small has-error">
                                            <asp:TextBox runat="server" CssClass="form-control text-uppercase" ID="txtLocationName"
                                                placeholder="Location Name"></asp:TextBox>
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
