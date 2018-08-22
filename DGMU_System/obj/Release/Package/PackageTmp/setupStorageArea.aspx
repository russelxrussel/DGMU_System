<%@ Page Title="" Language="C#" MasterPageFile="~/DGMU.Master" AutoEventWireup="true" CodeBehind="setupStorageArea.aspx.cs" Inherits="DGMU_System.setupStorageArea" %>
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
                      <%=txtStorageCode.UniqueID %>: {
                            required: true,
                            minlength: 6
                        
                        },

                        <%=txtStorageName.UniqueID %>: {
                         required: true
                     }

                  
                    
                    
                
                    }, messages: {
                        <%=txtStorageCode.UniqueID %>:{  
                         required: "Code is required." ,
                         minlength: "Required 6 Characters"
                     },

                     <%=txtStorageName.UniqueID %>: {
                         required: "Storage name required."
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
      Maintenance of Storage Area
    </div>
    <div class="panel-body">

    <!-- Display Gridview List of Items -->
    <asp:GridView runat="server" ID="gvStorageArea" 
            CssClass="table table-responsive table-hover table-condensed table-bordered" AutoGenerateColumns="False">
    
        <Columns>
            <asp:TemplateField ItemStyle-CssClass="text-left">
            <ItemTemplate>
            <asp:Button ID="btnEditItem" runat="server" CssClass="btn btn-primary btn-sm" Text="Edit" OnClick="btnEditItem_Click" />
            </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:BoundField DataField="StorageID" HeaderText="ID" ItemStyle-CssClass="hidden" HeaderStyle-CssClass="hidden" />
            <asp:BoundField DataField="StorageCode" HeaderText="Code" />
           <asp:BoundField DataField="StorageName" HeaderText="Name" />
       
           
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
                                        
                                            <asp:TextBox runat="server" CssClass="form-control text-uppercase" ID="txtStorageCode"
                                                placeholder="CODE" MaxLength="6"></asp:TextBox>
                                       

                                  </div>   
                                </div>
                        <div class="col-md-6">
                        <div class="form-group small has-error">
                                            <asp:TextBox runat="server" CssClass="form-control text-uppercase" ID="txtStorageName"
                                                placeholder="Storage Name"></asp:TextBox>
                                        </div>
                            
                        </div>

                        <div class="col-md-12">
                            <asp:TextBox runat="server" ID="txtDescription" placeholder="Description" CssClass="form-control" TextMode="MultiLine" Rows="2"></asp:TextBox>

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
     

               

    </ContentTemplate>
</asp:UpdatePanel>
</div><!-- END OF DIV CONTAINER-->


</asp:Content>
