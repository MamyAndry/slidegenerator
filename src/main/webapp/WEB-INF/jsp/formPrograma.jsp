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

        <h2>Famokarana Programa</h2>
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
                        <select name="hiraFidirana"  class="form-control">
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
                        <input class="form-control" type="number" name="fontSize" value="80.0">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Tarehan-tsoratra ho an'ny fafan'ny hira</label>
                        <input class="form-control" type="text" name="fontFamilyHira" value="Calibri">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Haben'ny Tarehan-tsoratra an'ny fafan'ny hira</label>
                        <input class="form-control" type="number" name="fontSizeHira" value="80.0">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Tahan-pahatakonan'ny sary</label>
                        <input class="form-control" type="number" name="imageOpacity" value="30.0">
                    </div>
                    <div class="mb-3">
                        <div class="row">
                            <div class="col-9">
                                <label class="form-label button-label">Hira</label>
                            </div>
                            <div class="col">
                                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#hira">
                                    Manampy
                                </button>
                            </div>
                        </div>
                        <div class="container" id="hira-voasafidy"></div>
                    </div>
                    <div class="mb-3">
                        <div class="row">
                            <div class="col-9">
                                <label class="form-label button-label">Hira Rakitra</label>
                            </div>
                            <div class="col">
                                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#hira-rakitra">
                                    Manampy
                                </button>
                            </div>
                        </div>
                        <div class="container" id="hira-rakitra-voasafidy"></div>
                    </div>
                    <div class="container" id="hira-fandraisana">
                        <div class="row">
                            <div class="mb-3">
                                <label class="form-label">Hira Fanehoana</label>
                                <select name="hiraFanehoana"  class="form-control">
                                    <% for (String item : lst) { %>
                                        <option value="<%=item%>"><%=ObjectUtility.sexifyToUpperCase(item)%></option>
                                    <% } %>
                                </select>
                            </div>
                        </div>  
                        <div class="row">
                            <div class="mb-3">
                                <div class='row'>
                                    <div class='col-9'>
                                        <label class='form-label'>Hira Fizarana Fandraisana</label>
                                    </div>
                                    <div class='col'>
                                        <button type='button' class='btn btn-primary' data-bs-toggle='modal' data-bs-target='#fizarana'>Manampy</button></div></div><div class='container' id='hira-fizarana-voasafidy'>
                                    </div>
                            </div>
                        </div> 
                        <div class="row">
                            <div class="mb-3">
                                <div class='row'>
                                    <div class='col-9'>
                                        <label class='form-label'>Hira Fandraisana Fanangonana</label>
                                    </div>
                                    <div class='col'>
                                        <button type='button' class='btn btn-primary' data-bs-toggle='modal' data-bs-target='#fanangonana'>Manampy</button></div></div><div class='container' id='hira-fanangonana-voasafidy'>
                                    </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="mb-3">
                                <label class="form-label">Hira Famaranana Fandraisana</label>
                                <select name="hiraFamaranana"  class="form-control">
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
<!-- MODAL FANAMPIANA NY VAKITENY -->
    <div class="modal fade" id="perikopa" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Perikopa</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="#">
                        <div class="mb-3">
                            <input name="vakiteny" id="vakiteny" type="text" class="form-control">
                        </div>
                        <div class="mb-3">
                            <button id="validate_vakiteny" class="btn btn-primary" type="button">Hamarino</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
<!-- MODAL FANAMPIANA HIRA ATAO AMIN'NY FOTOAM-PIVAVAHANA -->
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
<!-- MODAL FANAMPIANA HIRA ATAO AMIN'NY RAKITRA -->
    <div class="modal fade" id="hira-rakitra" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
    </div>
<!-- MODAL FANAMPIANA HIRA ATAO MANDRITRA NY FIZARANA NY KAPOAKA SY MOFO AMIN'NY FANDRAISANA -->
    <div class="modal fade" id="fizarana" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
    </div>
<!-- MODAL FANAMPIANA HIRA ATAO MANDRITRA NY FANANGONAN NY KAPOAKA SY RAKITRA AORIAN'NY FANDRAISANA -->
    <div class="modal fade" id="fanangonana" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
    </div>

</body>
</html>

<script src="js/bootstrap.bundle.min.js"></script>
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script>

    $('#fandraisana').on('click', function(event){
        var valueRadioFandraisana = $('#fandraisana_boolean').val();
        if(valueRadioFandraisana == "true"){
            addComponentManampyHiraFizarana();  
        }else if(valueRadioFandraisana == "false"){
            removeComponentManampyHiraFizarana;
        }
    });

    $('#validate_hira').on('click', function(event){
        addHira();  
    });
    $('#validate_hira_fizarana').on('click', function(event){
        addHiraFizarana();  
    });
    $('#validate_hira_fanangonana').on('click', function(event){
        addHiraFanangonana();  
    });
    $('#validate_hira_rakitra').on('click', function(event){
        addHiraRakitra();  
    });

    var vakitenyVoasafidy = new Array();
    var hiraVoasafidy = new Set();
    var hiraFizaranaVoasafidy = new Set();
    var hiraFanangonanaVoasafidy = new Set();
    var hiraRakitraVoasafidy = new Set();

    function addComponentManampyHiraFizarana(){
        document.getElementById("hira-fandraisana").style.visibility = "visible";
    }
    function removeComponentManampyHiraFizarana(){
        document.getElementById("hira-fandraisana").style.visibility = "hidden";
    }

    function sexifyToUpperCase(str){
        var res = str.replace("_", " ");
        return res.toUpperCase();
    }

    function addHiraRakitra(){
        var item = $("#hira-rakitra-nosafidiana").val();
        hiraRakitraVoasafidy.add(item);
        let hiraRakitraVoasafidy_html = "<ul class='list-group'>";
        hiraRakitraVoasafidy.forEach(element => {
            hiraRakitraVoasafidy_html += "<input type='checkbox' name='hiraRakitra' value='" + element + "' class='btn-check' id='rakitra' checked autocomplete='off'>";
            hiraRakitraVoasafidy_html += "<li class='list-group-item' for='rakitra'>" + sexifyToUpperCase(element) + "</li>";
        });
        hiraRakitraVoasafidy_html += "</ul>";
        $("#hira-rakitra-voasafidy").html(hiraRakitraVoasafidy_html);
    }

    function addHiraFizarana(){
        var item = $("#hira-fizarana-nosafidiana").val();
        hiraFizaranaVoasafidy.add(item);
        let hiraFizaranaVoasafidy_html = "<ul class='list-group'>";
        hiraFizaranaVoasafidy.forEach(element => {
            hiraFizaranaVoasafidy_html += "<input type='checkbox' name='hiraFizarana' value='" + element + "' class='btn-check' id='fizarana' checked autocomplete='off'>";
            hiraFizaranaVoasafidy_html += "<li class='list-group-item' for='fizarana'>" + sexifyToUpperCase(element) + "</li>";
        });
        hiraFizaranaVoasafidy_html += "</ul>";
        $("#hira-fizarana-voasafidy").html(hiraFizaranaVoasafidy_html);
    }
    function addHiraFanangonana(){
        var item = $("#hira-fanangonana-nosafidiana").val();
        hiraFanangonanaVoasafidy.add(item);
        let hiraFanangonanaVoasafidy_html = "<ul class='list-group'>";
        hiraFanangonanaVoasafidy.forEach(element => {
            hiraFanangonanaVoasafidy_html += "<input type='checkbox' name='hiraFanangonana' value='" + element + "' class='btn-check' id='fanangonana' checked autocomplete='off'>";
            hiraFanangonanaVoasafidy_html += "<li class='list-group-item' for='fanangonana'>" + sexifyToUpperCase(element) + "</li>";
        });
        hiraFanangonanaVoasafidy_html += "</ul>";
        $("#hira-fanangonana-voasafidy").html(hiraFanangonanaVoasafidy_html);
    }

    function addHira(){
        var item = $("#hira-nosafidiana").val();
        hiraVoasafidy.add(item);
        let hiraVoasafidy_html = "<ul class='list-group'>";
        hiraVoasafidy.forEach(element => {
            hiraVoasafidy_html += "<input type='checkbox' name='hira' value='" + element + "' class='btn-check' id='hira' checked autocomplete='off'>";
            hiraVoasafidy_html += "<li class='list-group-item' for='hira'>" + sexifyToUpperCase(element) + "</li>";
        });
        hiraVoasafidy_html += "</ul>";
        $("#hira-voasafidy").html(hiraVoasafidy_html);
    }
</script>