<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DGMULogin.aspx.cs" Inherits="DGMU_System.DGMULogin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="bootstrap/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css" />

    <style type="text/css">
    
  body
    {
        
 margin-top: 20px;

    }
    
    .pnlTop
    {
    margin-top: 15px;    
    }
    
    </style>

    <title>DGMU Enterprises</title>

</head>
<body>
    
    <form id="form1" runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>  

       <div class="container">
        <div class="panel panel-info">
           
         <div class="panel-heading">
                <table>
                    <tbody>
                        <tr>
                            <td>
                               <%-- <img src="images/logo_ssi.png" width="75px" width="75px"/>--%>
                            </td>
                            <td>
                                <h2 class="panel-title">
                                    <strong>DGMU Enterprises System</strong></h2>
                             <%--   <h6>
                                    Excellence through Multiple Intelligences, Positive Values and 21st Century Skills</h6>--%>
      
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>


        <!-- This will be the Body -->
        <div class="panel-body">
        <div class="row">
            <div class="col-md-4">
                  <img src="images/user_authentication_02.png" width="300px" height="300px" /> 
            </div>
      <div class="col-md-8">
          
         
        
        <div class="pnlTop">

                      <asp:UpdatePanel runat="server" ID="upLogin" UpdateMode="Conditional">
                        <ContentTemplate>
                        <!--Panel for Login -->
                        <div class="panel panel-warning">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    User Authentication</h4>
                            </div>

                            <!--Panel Body -->
                            <div class="panel-body">
                               
                                <div class="input-group input-group-lg">
                                    <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
                                    <asp:TextBox ID="txtUserId" runat="server" CssClass="form-control focus" AutoCompleteType="Disabled"></asp:TextBox>
                                </div>
                                <br />
                                <div class="input-group input-group-lg">
                                    <span class="input-group-addon"><span class="glyphicon glyphicon-credit-card"></span>
                                    </span>
                                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                                </div>
                                <br />
                                
                                <div class="text-right">
                                    <asp:Button ID="btnLogin" runat="server" CssClass="btn btn-primary" Text="Login" OnClick="btnLogin_Click"
                                       />
                                </div>

                              

                            </div>

                            <!--Panel Footer -->
                            
                            <div class="panel-footer">
                       <asp:UpdatePanel runat="server" ID="upDateTime" UpdateMode="Conditional">
        <ContentTemplate>
        <asp:Timer ID="Timer1" runat="server" ontick="Timer1_Tick" Interval="1000"></asp:Timer>
        <span class="glyphicon glyphicon-time"></span> <asp:Label runat="server" ID="lblDT"></asp:Label>
        </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
            </Triggers>
        </asp:UpdatePanel>
                      
                    </div>
                        
                        </div><!--End of Login Panel -->
                        
                        <%--Message POPUP--%>
                        <div class="modal fade" id="msgModal">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header bg-danger">
                                        <button class="close" data-dismiss="modal">
                                            &times;</button>
                                        <h4 class="modal-title">
                                            School Integrated Management System</h4>
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

                            <%--Video POPUP--%>
                
                        <div class="modal fade" id="modalVideo">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header bg-primary">
                                        <button class="close" data-dismiss="modal">
                                            &times;</button>
                                        <h4 class="modal-title">
                                            Multiple Intelligences Video</h4>
                                    </div>
                                    <div class="modal-body">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <video id="videoMI" class="img-responsive" controls>
                                        <source src="videos/mi1.mp4" type="video/mp4"></source>
                                        Your browser does not support HTML5 video.
                                        </video>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                    </div>
                                </div>
                            </div>
                            </div>

                        </ContentTemplate>
            </asp:UpdatePanel>
                    </div> <!--End of Column 2 right -->

            
          

          


        </div>  
          

    
        

             <div class="col-md-3">

        </div>
            
        </div>
           
            </div>
           
        <!-- This will be the panel footer -->
       <div class="panel-footer bg-info">
       <div class="text-right small text-warning">
      <p class="small"> Developed by: Russel Vasquez &COPY;</p>
       </div>
       </div>


       </div> <!-- End of Primary Panel -->





 </div><!-- End of Container -->
 

       
    </form>

    <script src="bootstrap/js/jquery-3.1.1.min.js" type="text/javascript"></script>
    <script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
   


</body>
</html>

