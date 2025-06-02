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
    <link rel="stylesheet" href="css/jquery-ui.min.css">
    <link rel="icon" href="images/ppt.png" type="image/x-icon">
    <title>Form Programa Slide Generator</title>
    <style>
        #item-list {
            margin-top: 2%;
            list-style: none;
            padding-left: 0;
        }
        #item-list li {
            background: #ffffff;
            padding: 8px 12px;
            margin-bottom: 5px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-radius: 4px;
        }
        .remove-btn {
            color: #dc3545;
            cursor: pointer;
            font-weight: bold;
        }
    </style>
</head>
<body class="hold-transition sidebar-mini layout-fixed">
    <div class="wrapper">
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
                            <h2>Famokarana Programa</h2>
                        </div>
                        <div class="card-body">
                            <form action="treatment-programa" method="post" enctype="multipart/form-data">
                        
                                <div class="row">
                                    <div class="col">
                                        <div class="mb-3">
                                            <label class="form-label">Toerena asiana an'ilay Programa</label>
                                            <input class="form-control" type="text" name="path"  value="./powerpoint">
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label">Anaran'ny Slide</label>
                                            <input class="form-control" type="text" name="name">
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label">Endrin'ny Litorjia</label>
                                            <select class="form-control" type="text" name="endriny">
                                                <option value="endriny_1">voalohany</option>
                                                <option value="endriny_2">faharoa</option>
                                                <option value="endriny_3">fahatelo</option>
                                                <option value="endriny_4">fahaefatra</option>
                                            </select>
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label">Vakiteny Fiderana</label>
                                            <input class="form-control" type="text" name="vakitenyFiderana">
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label">Vakiteny Sekoly Alahady</label>
                                            <input class="form-control" type="text" name="vakitenySA">
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label">Fanekem-pinoana</label>
                                            <select class="form-control" type="text" name="fanekemPinoana">
                                                <option value="voalohany">voalohany</option>
                                                <option value="faharoa">faharoa</option>
                                                <option value="fahatelo">fahatelo</option>
                                                <option value="fahaefatra">fahaefatra</option>
                                            </select>
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label">Hira Fidirana</label>
                                            <select name="hiraFidirana" id="select-hira-fidirana"  class="form-control">
                                                <% for (String item : lst) { %>
                                                    <option value="<%=item%>"><%=ObjectUtility.sexifyToUpperCase(item)%></option>
                                                <% } %>
                                            </select>
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label">Perikopa</label>
                                            <textarea class="form-control" name="perikopa" rows="3"></textarea>
                                        </div>
                                        <div class="mb-3" id="vavolombelona">
                                            <label class="form-label">Asa vavolombelona</label>
                                            <textarea class='form-control' name='asaVavolombelona' rows='3'></textarea>
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label">Asan'Andriamanitra</label>
                                            <textarea class='form-control' name='asanAndriamanitra' rows='3'></textarea>
                                        </div>
                                        <div class="mb-3"  id="fandraisana">
                                            <div class="row"> 
                                                <div class="col">
                                                    <label class="form-label">Fandraisana</label>
                                                </div>
                                                <div class="col">
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="radio" name="fandraisana" id="fandraisana_boolean" value="true">
                                                        <label class="form-check-label" for="fandraisana_boolean">Eny</label>
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="radio" name="fandraisana" id="fandraisana_boolean" value="false" checked>
                                                        <label class="form-check-label" for="fandraisana_boolean">Tsia</label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col">
                                        <div class="mb-3">
                                            <label class="form-label">Tarehan-tsoratra ny fafana</label>
                                            <input class="form-control" type="text" name="fontFamily"  value="Calibri">
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label">Haben'ny Tarehan-tsoratra</label>
                                            <input class="form-control" type="number" name="fontSize" value="250">
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label">Tarehan-tsoratra ho an'ny fafan'ny hira</label>
                                            <input class="form-control" type="text" name="fontFamilyHira" value="Calibri">
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label">Haben'ny Tarehan-tsoratra an'ny fafan'ny hira</label>
                                            <input class="form-control" type="number" name="fontSizeHira" value="220">
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label">Tahan-pahatakonan'ny sary</label>
                                            <input class="form-control" type="number" name="imageOpacity" value="30.0">
                                        </div>                                        
                                        <div class="container" id="hira-fandraisana">
                                            <div class="row">
                                                <div class="mb-3">
                                                    <label class="form-label">Hira Fanehoana</label>
                                                    <select name="hiraFanehoana" id="select-hira-fanehoana" class="form-control">
                                                        <% for (String item : lst) { %>
                                                            <option value="<%=item%>"><%=ObjectUtility.sexifyToUpperCase(item)%></option>
                                                        <% } %>
                                                    </select>
                                                </div>
                                            </div>  
                                            <div class="row">
                                                <div class="mb-3">
                                                    <label class="form-label">Hira Famaranana Fandraisana</label>
                                                    <select name="hiraFamaranana" id="select-hira-famaranana" class="form-control">
                                                        <% for (String item : lst) { %>
                                                            <option value="<%=item%>"><%=ObjectUtility.sexifyToUpperCase(item)%></option>
                                                        <% } %>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <div class="row">
                                    <div class="mb-3">
                                        <button class="btn btn-primary" type="submit">Hamarino</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>
</body>
</html>

<script src="js/bootstrap.bundle.min.js"></script>
<script src="js/jquery.min.js"></script>
<script src="js/jquery-editable-select.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/adminlte.min.js"></script>
<script src="js/jquery-ui.min.js"></script>
<script>
    $(document).ready(function () {
        $('#select-hira-fidirana').editableSelect();
        $('#select-hira-fanehoana').editableSelect();
        $('#select-hira-famaranana').editableSelect();

        $('#fandraisana').on('click', function () {
            const isVisible = $('#fandraisana_boolean').val() === "true";
            $('#hira-fandraisana').css('visibility', isVisible ? 'visible' : 'hidden');
        });

    });
</script>