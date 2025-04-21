<%
    String[] lst = (String[])request.getAttribute("list");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="icon" href="images/ppt.png" type="image/x-icon">
    <title>Index</title>
</head>
<body>

    <%@ include file = "header.html" %>
    <%@ include file = "navbar.html" %>
    <div class="container">
        <div class="row">
            <div class="col-1">

            </div>
            <div class="col-10">
                <h1>${message}</h1>
            </div>
            <div class="col-1">

            </div>

        </div>
    </div>

</body>
</html>
<script src="js/bootstrap.bundle.min.js"></script>
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>