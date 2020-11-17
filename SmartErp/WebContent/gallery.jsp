<%@include file="header.jsp" %>

<div id="middle">
<h1>GALLERY PAGE</h1>
<form action="FileUploadSer" name="frm1" method="post" enctype="multipart/form-data">
          
            <input type="file" name="file" />
            <br>
            <input type="submit" name="btnsubmit" value="Upload" />
          
          
        </form>
</div>

<%@include file="footer.jsp" %>
