<%@ page import="java.util.ArrayList" %>
<%@ page import="fjkm.agf.slidegenerator.utils.ObjectUtility" %>

<% ArrayList<String> lst = (ArrayList<String>)request.getAttribute("list");%>

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
                            <h2>Famokarana Hira</h2>
                        </div>
                        <div class="card-body">
                            <form action="treatment-hira-maro" method="post"
                                enctype="multipart/form-data">
                                <div class="mb-3">
                                    <label class="form-label">Toerana ametrahana ny hira ho
                                        vokarina</label>
                                    <input type="text" class="form-control" name="path">
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Tarehan-tsoratra ampiasaina</label>
                                    <input type="text" class="form-control" name="fontFamily"
                                        value="Calibri">
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Haben'ny tarehan-tsoratra</label>
                                    <input type="number" class="form-control" name="fontSize"
                                        value="220">
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Hira ho vokarina</label>
                                    <div class="input-group">
                                        <select name="hira-select" id="select-hira" class="form-control">
                                            <% for (String item : lst) { %>
                                                <option value="<%=item%>">
                                                    <%=ObjectUtility.sexifyToUpperCase(item)%>
                                                </option>
                                            <% } %>
                                        </select>
                                        <div class="input-group-append">
                                            <button id="add-hira" type="button" class="btn btn-primary">
                                                Manampy
                                            </button>
                                        </div>
                                    </div>
                                    <div class="container">
                                        <div class="row">
                                            <ul id="sortable-list-hira"></ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="mb-3">
                                    <button id="validate_vakiteny" class="btn btn-primary"
                                        type="submit">Hamarino</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </section>
        </div>
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
    var hiraVoasafidy = new Set();

    $('#add-hira').on('click', function (e) {
        e.preventDefault();
        const value = $('#select-hira').val().trim();
        if (value !== '') {
            let oldLength = hiraVoasafidy.size;
            hiraVoasafidy.add(value);
            let newLength = hiraVoasafidy.size;
            if (oldLength === newLength) {
                return;
            }
            console.log('Hira voasafidy :', hiraVoasafidy);

            const $li = $('<li>').addClass('d-flex justify-content-between align-items-center mb-1').css({
                background: '#f4f6f9',
                padding: '8px 12px',
                borderRadius: '4px'
            });

            const $checkbox = $('<input>', {
                type: 'checkbox',
                name: 'hira',
                value: value,
                class: 'btn-check',
                id: 'hira-' + value, 
                checked: true,
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

            $li.append($text, $checkbox, $removeBtn);
            $('#sortable-list-hira').append($li);
        }
    });

    // Supprimer un élément
    $('#sortable-list-hira').on('click', '.remove-btn', function () {
        const text = $(this).siblings('span').first().text();
        hiraVoasafidy.delete(text);
        $(this).closest('li').remove();
    });

    $(document).ready(function () {
        $('#select-hira option').each(function() {
            $(this).val($(this).val().trim());
            $(this).text($(this).text().trim());
        });
        
        $('#select-hira').editableSelect();
        
        $('#sortable-list-hira').sortable({
            update: function () {
                var hiraVoasafidy = new Set();
                $('#item-list li span:first-child').each(function () {
                    hiraVoasafidy.push($(this).text());
                });
            }
        });
    });
</script>