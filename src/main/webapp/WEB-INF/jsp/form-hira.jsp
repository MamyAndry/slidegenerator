<%@ page import="java.util.ArrayList" %>
<%@ page import="fjkm.agf.slidegenerator.utils.ObjectUtility" %>

<%
    ArrayList<String> lst = (ArrayList<String>)request.getAttribute("list");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
    <link rel="stylesheet" href="css/adminlte.min.css">
    <link rel="stylesheet" href="css/jquery-ui.min.css">
    <link rel="stylesheet" href="css/jquery-editable-select.min.css">
    <link rel="stylesheet" href="css/ionicons.min.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="icon" href="images/ppt.png" type="image/x-icon">
    <title>Form Programa Slide Generator</title>
</head>
<body>
    <nav class="main-header navbar navbar-expand navbar-white navbar-light">
        <%@ include file="fragments/nav-bar.html" %>
    </nav>

    <aside class="main-sidebar sidebar-dark-primary elevation-4">
        <%@ include file="fragments/side-bar.html" %>
    </aside>

    <div class="content-wrapper">
        <section class="content">
            <div class="container-fluid">
                <div class="card card-primary">
                    <div class="card-header">
                         <h2>Famokarana Hira</h2>
                    </div>
                    <div class="card-body">
                        <form action="treatment-hira" method="get">
                            <div class="mb-3">
                                <label class="form-label">Toerana ametrahana ny hira ho vokarina</label>
                                <input type="text" class="form-control" name="path">
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Tarehan-tsoratra ampiasaina</label>
                                <input type="text" class="form-control" name="fontFamily" value="Calibri">
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Haben'ny tarehan-tsoratra</label>
                                <input type="number" class="form-control" name="fontSize" value="220">
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Hira ho vokarina</label>
                                <select name="hira" id="select-hira" class="form-control">
                                    <% for (String item : lst) { %>
                                        <option value="<%=item%>"><%=ObjectUtility.sexifyToUpperCase(item)%></option>
                                    <% } %>
                                </select>
                            </div>
                            <div class="mb-3">
                                <button id="validate_vakiteny" class="btn btn-primary" type="submit">Hamarino</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>
    </div>
</body>
<script src="js/bootstrap.bundle.min.js"></script>
<script src="js/jquery.min.js"></script>
<script src="js/jquery-ui.min.js"></script>
<script src="js/jquery-editable-select.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/adminlte.min.js"></script>
<script src="js/jquery-ui.min.js"></script>

<script>
    $(document).ready(function () {
        $('#select-hira').editableSelect();
    });
</script>