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
                                        <div class="mb-3">
                                            <div class="row">
                                                <!--
                                                    <div class="col-9">
                                                        <label class="form-label button-label">Hira</label>
                                                    </div>
                                                    <div class="col">
                                                        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#hira">
                                                            Manampy
                                                        </button>
                                                    </div>
                                                -->
                                                <label class="form-label button-label">Hira</label>
                                                <div class="input-group">
                                                    <select name="hira-nosafidiana" id="hira-nosafidiana" class="form-control">
                                                        <% for (String item : lst) { %>
                                                            <option value="<%=item%>"><%=ObjectUtility.sexifyToUpperCase(item)%></option>
                                                        <% } %>
                                                    </select>
                                                    <div class="input-group-append">
                                                        <button id="add-hira-button" type="button" class="btn btn-primary">Manampy</button>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="container">
                                                <ul id="sortable-list-hira"></ul>
                                            </div>
                                            <!-- <div class="container" id="hira-voasafidy"></div>  -->
                                        </div>
                                        <div class="mb-3">
                                            <div class="row">
                                                <!--
                                                    <div class="col-9">
                                                        <label class="form-label button-label">Hira Rakitra</label>
                                                    </div>
                                                    <div class="col">
                                                        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#hira-rakitra">
                                                            Manampy
                                                        </button>
                                                    </div>
                                                -->
                                                <label class="form-label button-label">Hira Rakitra</label>
                                                <div class="input-group">
                                                    <select name="hira-rakitra-nosafidiana" id="hira-rakitra-nosafidiana" class="form-control">
                                                        <% for (String item : lst) { %>
                                                            <option value="<%=item%>"><%=ObjectUtility.sexifyToUpperCase(item)%></option>
                                                        <% } %>
                                                    </select>
                                                    <div class="input-group-append">
                                                        <button id="add-hira-rakitra-button" type="button" class="btn btn-success">Manampy</button>
                                                    </div>
                                                </div>
                                                <div class="container">
                                                    <ul id="sortable-list-hira-rakitra"></ul>
                                                </div>  
                                            </div>
                                            <!-- <div class="container" id="hira-rakitra-voasafidy"></div> -->
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
                                                    <div class='row'>
                                                        <!-- <div class='col-9'>
                                                            <label class='form-label'>Hira Fizarana Fandraisana</label>
                                                        </div>
                                                        <div class='col'>
                                                            <button type='button' class='btn btn-primary' data-bs-toggle='modal' data-bs-target='#fizarana'>Manampy</button></div></div><div class='container' id='hira-fizarana-voasafidy'>
                                                        </div> -->
                                                        
                                                        <label class="form-label button-label">Hira Fizarana Fandraisana</label>
                                                        <div class="input-group">
                                                            <select name="hira-fizarana-nosafidiana" id="hira-fizarana-nosafidiana" class="form-control">
                                                                <% for (String item : lst) { %>
                                                                    <option value="<%=item%>"><%=ObjectUtility.sexifyToUpperCase(item)%></option>
                                                                <% } %>
                                                            </select>
                                                            <div class="input-group-append">
                                                                <button id="add-hira-fizarana-button" type="button" class="btn btn-primary">Manampy</button>
                                                            </div>
                                                        </div>
                                                        <div class="container">
                                                            <ul id="sortable-list-hira-fizarana"></ul>
                                                        </div>  
                                                    </div>
                                                </div>
                                            </div> 
                                            <div class="row">
                                                <div class="mb-3">
                                                    <div class='row'>
                                                        <!-- <div class='col-9'>
                                                            <label class='form-label'>Hira Fandraisana Fanangonana</label>
                                                        </div>
                                                        <div class='col'>
                                                            <button type='button' class='btn btn-primary' data-bs-toggle='modal' data-bs-target='#fanangonana'>Manampy</button></div></div><div class='container' id='hira-fanangonana-voasafidy'>
                                                        </div> -->
                                                        <label class="form-label button-label">Hira Fanangonana Fandraisana</label>
                                                        <div class="input-group">
                                                            <select name="hira-fanangonana-nosafidiana" id="hira-fanangonana-nosafidiana" class="form-control">
                                                                <% for (String item : lst) { %>
                                                                    <option value="<%=item%>"><%=ObjectUtility.sexifyToUpperCase(item)%></option>
                                                                <% } %>
                                                            </select>
                                                            <div class="input-group-append">
                                                                <button id="add-hira-fanangonana-button" type="button" class="btn btn-primary">Manampy</button>
                                                            </div>
                                                        </div>
                                                        <div class="container">
                                                            <ul id="sortable-list-hira-fanangonana"></ul>
                                                        </div>  
                                                    </div>
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
                <!-- MODAL FANAMPIANA HIRA ATAO AMIN'NY FOTOAM-PIVAVAHANA -->
                <!--    
                    <div class="modal fade" id="hira" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Hira atao mandritry ny Fotoam-pivavahana</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <form action="#">
                                        <div class="mb-3">
                                            <select name="hira-nosafidiana" id="hira-nosafidiana" class="form-control">
                                                <% for (String item : lst) { %>
                                                    <option value="<%=item%>"><%=ObjectUtility.sexifyToUpperCase(item)%></option>
                                                <% } %>
                                            </select>
                                        </div>
                                        <div class="mb-3">
                                            <button id="validate_hira" class="btn btn-primary" type="button">Hamarino</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                -->
                <!-- MODAL FANAMPIANA HIRA ATAO AMIN'NY RAKITRA -->
                    <!-- <div class="modal fade" id="hira-rakitra" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Hira atao mandritry ny Rakitra</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <form action="#">
                                        <div class="mb-3">
                                            <select name="hira-rakitra-nosafidiana" id="hira-rakitra-nosafidiana" class="form-control">
                                                <% for (String item : lst) { %>
                                                    <option value="<%=item%>"><%=ObjectUtility.sexifyToUpperCase(item)%></option>
                                                <% } %>
                                            </select>
                                        </div>
                                        <div class="mb-3">
                                            <button id="validate_hira_rakitra" class="btn btn-primary" type="button">Hamarino</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div> -->
                <!-- MODAL FANAMPIANA HIRA ATAO MANDRITRA NY FIZARANA NY KAPOAKA SY MOFO AMIN'NY FANDRAISANA -->
                    <!-- <div class="modal fade" id="fizarana" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Hira atao mandritry ny fizarana ny kapoaka sy ny mofo</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <form action="#">
                                        <div class="mb-3">
                                            <select name="hira-fizarana-nosafidiana" id="hira-fizarana-nosafidiana" class="form-control">
                                                <% for (String item : lst) { %>
                                                    <option value="<%=item%>"><%=ObjectUtility.sexifyToUpperCase(item)%></option>
                                                <% } %>
                                            </select>
                                        </div>
                                        <div class="mb-3">
                                            <button id="validate_hira_fizarana" class="btn btn-primary" type="button">Hamarino</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div> -->
                <!-- MODAL FANAMPIANA HIRA ATAO MANDRITRA NY FANANGONAN NY KAPOAKA SY RAKITRA AORIAN'NY FANDRAISANA -->
                    <!-- <div class="modal fade" id="fanangonana" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Hira atao mandritry ny fanangonana ny kapoaka sy fanataterana ny Rakitra</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <form action="#">
                                        <div class="mb-3">
                                            <select name="hira-fanangonana-nosafidiana" id="hira-fanangonana-nosafidiana" class="form-control">
                                                <% for (String item : lst) { %>
                                                    <option value="<%=item%>"><%=ObjectUtility.sexifyToUpperCase(item)%></option>
                                                <% } %>
                                            </select>
                                        </div>
                                        <div class="mb-3">
                                            <button id="validate_hira_fanangonana" class="btn btn-primary" type="button">Hamarino</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div> -->
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
<script src="js/programme.js"></script>
<script>
        
    $('#add-hira-button').on('click', function (e) {
        e.preventDefault();
        console.log('add-hira-button clicked');
        const value = $('#hira-nosafidiana').val().trim();
        if (value !== '') {
            console.log(value);
            hiraVoasafidy.add(value);
            const $li = $('<li>').addClass('d-flex justify-content-between align-items-center mb-1').css({
                background: '#f4f6f9',
                padding: '8px 12px',
                borderRadius: '4px'
            });

            const $text = $('<span>').text(value);
            const $removeBtn = $('<span>')
                .addClass('remove-btn')
                .html('&times;')
                .css({
                    color: '#dc3545',
                    cursor: 'pointer',
                    fontWeight: 'bold'
                });

            $li.append($text, $removeBtn);
            $('#sortable-list-hira').append($li);

            $('#hira-nosafidiana').val('');
        }
    });

    // Supprimer un élément
    $('#sortable-list-hira').on('click', '.delete-btn', function () {
        const text = $(this).siblings('span').first().text();
        hiraVoasafidy = hiraVoasafidy.filter(item => item !== text);
        $(this).closest('li').remove();
    });


    $('#add-hira-rakitra-button').on('click', function (e) {
        e.preventDefault();
        console.log('add-hira-rakitra-button clicked');
        const value = $('#hira-rakitra-nosafidiana').val().trim();
        if (value !== '') {
            console.log(value);
            hiraRakitraVoasafidy.add(value);
            // Créer chaque élément avec jQuery
            const $li = $('<li>').addClass('d-flex justify-content-between align-items-center mb-1').css({
                background: '#f4f6f9',
                padding: '8px 12px',
                borderRadius: '4px'
            });

            const $text = $('<span>').text(value);
            const $removeBtn = $('<span>')
                .addClass('remove-btn')
                .html('&times;')
                .css({
                    color: '#dc3545',
                    cursor: 'pointer',
                    fontWeight: 'bold'
                });

            $li.append($text, $removeBtn);
            $('#sortable-list-hira-rakitra').append($li);

            $('#hira-rakitra-nosafidiana').val('');
        }
    });

    // Supprimer un élément
    $('#sortable-list-hira-rakitra').on('click', '.delete-btn', function () {
        const text = $(this).siblings('span').first().text();
        hiraRakitraVoasafidy = hiraRakitraVoasafidy.filter(item => item !== text);
        $(this).closest('li').remove();
    });


    $('#add-hira-fizarana-button').on('click', function (e) {
        e.preventDefault();
        const value = $('#hira-fizarana-nosafidiana').val().trim();
        if (value !== '') {
            console.log(value);
            hiraFizaranaVoasafidy.add(value);
            const $li = $('<li>').addClass('d-flex justify-content-between align-items-center mb-1').css({
                background: '#f4f6f9',
                padding: '8px 12px',
                borderRadius: '4px'
            });

            const $text = $('<span>').text(value);
            const $removeBtn = $('<span>')
                .addClass('remove-btn')
                .html('&times;')
                .css({
                    color: '#dc3545',
                    cursor: 'pointer',
                    fontWeight: 'bold'
                });

            $li.append($text, $removeBtn);
            $('#sortable-list-hira-fizarana').append($li);

            $('#hira-fizarana-nosafidiana').val('');
        }
    });

    // Supprimer un élément
    $('#sortable-list-hira-fizarana').on('click', '.delete-btn', function () {
        const text = $(this).siblings('span').first().text();
        hiraFizaranaVoasafidy = hiraFizaranaVoasafidy.filter(item => item !== text);
        $(this).closest('li').remove();
    });


    $('#add-hira-fanangonana-button').on('click', function (e) {
        e.preventDefault();
        const value = $('#hira-fanangonana-nosafidiana').val().trim();
        if (value !== '') {
            console.log(value);
            hiraFanangonanaVoasafidy.add(value);
            const $li = $('<li>').addClass('d-flex justify-content-between align-items-center mb-1').css({
                background: '#f4f6f9',
                padding: '8px 12px',
                borderRadius: '4px'
            });

            const $text = $('<span>').text(value);
            const $removeBtn = $('<span>')
                .addClass('remove-btn')
                .html('&times;')
                .css({
                    color: '#dc3545',
                    cursor: 'pointer',
                    fontWeight: 'bold'
                });

            $li.append($text, $removeBtn);
            $('#sortable-list-hira-fanangonana').append($li);

            $('#hira-fanangonana-nosafidiana').val('');
        }
    });

    // Supprimer un élément
    $('#sortable-list-hira-fanangonana').on('click', '.delete-btn', function () {
        const text = $(this).siblings('span').first().text();
        hiraFanangonanaVoasafidy = hiraFanangonanaVoasafidy.filter(item => item !== text);
        $(this).closest('li').remove();
    });

    $(document).ready(function () {
        $('#select-hira-fidirana').editableSelect();
        $('#select-hira-fanehoana').editableSelect();
        $('#select-hira-famaranana').editableSelect();
        $('#hira-fizarana-nosafidiana').editableSelect();
        $('#hira-fanangonana-nosafidiana').editableSelect();
        $('#hira-rakitra-nosafidiana').editableSelect();
        $('#hira-nosafidiana').editableSelect();
        
        $('#sortable-list-hira').sortable({
            update: function () {
                var hiraVoasafidy = new Set();
                $('#item-list li span:first-child').each(function () {
                    hiraVoasafidy.push($(this).text());
                });
            }
        });
        $('#sortable-list-hira-rakitra').sortable({
            update: function () {
                var hiraRakitraVoasafidy = new Set();
                $('#item-list li span:first-child').each(function () {
                    hiraRakitraVoasafidy.push($(this).text());
                });
            }
        });
        $('#sortable-list-hira-fizarana').sortable({
            update: function () {
                var hiraFizaranaVoasafidy = new Set();
                $('#item-list li span:first-child').each(function () {
                    hiraFizaranaVoasafidy.push($(this).text());
                });
            }
        });
        $('#sortable-list-hira-fanangonana').sortable({
            update: function () {
                var hiraFanangonanaVoasafidy = new Set();
                $('#item-list li span:first-child').each(function () {
                    hiraFanangonanaVoasafidy.push($(this).text());
                });
            }
        });
    });
</script>