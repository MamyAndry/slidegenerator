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
    <link rel="stylesheet" href="css/style.css">
    <title>Form Programa Slide Generator</title>
</head>
<body>
    <%@ include file = "header.html" %>
    <div class="form-container">

        <h2>Famokarana Hira</h2>
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
                <input type="number" class="form-control" name="fontSize" value="80">
            </div>
            <div class="mb-3">
                <label class="form-label">Hira ho vokarina</label>
                <select name="hira" id="hira" class="form-control">
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
</body>