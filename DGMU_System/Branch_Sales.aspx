<%@ Page Title="" Language="C#" MasterPageFile="~/DGMU.Master" AutoEventWireup="true" CodeBehind="Branch_Sales.aspx.cs" Inherits="DGMU_System.Branch_Sales" %>
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

 
<asp:UpdatePanel runat="server" ID="upMain" UpdateMode="Conditional">
<ContentTemplate> 

<div class="panel panel-default">
<div class="panel-heading">
 <div class="row">
 
     <div class="col-md-8">
       Branch Sales Entry
     </div>
    
 </div>   
   

    
</div>
<div class="panel-body">


<div class="row">

    <!-- LEFT SELECTION -->
    <div class="col-md-4">
        <div class="panel panel-success">
            <div class="panel-heading">Selection</div>
            <div class="panel-body">
                <ul class="list-group">
                    <li class="list-group-item">
                       <div class="input-group"><span class="input-group-addon"> Date Sales:</span> <asp:TextBox runat="server" ID="txtSalesDate" CssClass="form-control calendarInput"></asp:TextBox></div> </li>
                    <li class="list-group-item"><div class="input-group"><span class="input-group-addon"> Partner:</span><asp:DropDownList runat="server" ID="ddPartnerList" CssClass="form-control dropdown"></asp:DropDownList> </div> </li>
                    <li class="list-group-item"><asp:LinkButton runat="server" ID="lnkSet" CssClass="btn btn-primary" OnClick="lnkSet_Click">VIEW</asp:LinkButton></li>
                </ul>
            </div>
        </div>
    </div>

    <div class="col-md-9"></div>

</div><!--End of Main Row-->


</div>
</div>



 <div class="modal fade" id="msgSuccessModal">
         <div class="modal-dialog">
             <div class="modal-content">
                 <div class="modal-header bg-success">
                     <button class="close" data-dismiss="modal">
                         &times;</button>
                     <h4 class="modal-title">
                         DGMU Enterprises System</h4>
                 </div>
                 <div class="modal-body">
                     <h4 class="text-success">
                         <span class="glyphicon glyphicon-saved"></span>&nbsp;
                         <asp:Label runat="server" ID="lblSuccessMessage"></asp:Label></h4>
                 </div>
                 <div class="modal-footer">
                 </div>
             </div>
         </div>
     </div>     

   
    <div class="modal fade" id="msgErrorModal">
         <div class="modal-dialog">
             <div class="modal-content">
                 <div class="modal-header bg-danger">
                     <button class="close" data-dismiss="modal">
                         &times;</button>
                     <h4 class="modal-title">
                         DGMU Enterprises System</h4>
                 </div>
                 <div class="modal-body">
                     <h4 class="text-danger">
                         <span class="glyphicon glyphicon-remove"></span>&nbsp;
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


    

</asp:Content>
