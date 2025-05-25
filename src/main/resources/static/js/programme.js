$('#fandraisana').on('click', function (event) {
    var valueRadioFandraisana = $('#fandraisana_boolean').val();
    if (valueRadioFandraisana === "true") {
        addComponentManampyHiraFizarana();
    } else {
        removeComponentManampyHiraFizarana();
    }
});

// $('#validate_hira').on('click', function (event) {
//     addHira();
// });
// $('#validate_hira_fizarana').on('click', function (event) {
//     addHiraFizarana();
// });
// $('#validate_hira_fanangonana').on('click', function (event) {
//     addHiraFanangonana();
// });
// $('#validate_hira_rakitra').on('click', function (event) {
//     addHiraRakitra();
// });

function addComponentManampyHiraFizarana() {
    document.getElementById("hira-fandraisana").style.visibility = "visible";
}
function removeComponentManampyHiraFizarana() {
    document.getElementById("hira-fandraisana").style.visibility = "hidden";
}


var vakitenyVoasafidy = new Array();
var hiraVoasafidy = new Set();
var hiraFizaranaVoasafidy = new Set();
var hiraFanangonanaVoasafidy = new Set();
var hiraRakitraVoasafidy = new Set();

function sexifyToUpperCase(str) {
    var res = str.replace("_", " ");
    return res.toUpperCase();
}

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

// function addHiraRakitra() {
//     var item = $("#hira-rakitra-nosafidiana").val();
//     hiraRakitraVoasafidy.add(item);
//     let hiraRakitraVoasafidy_html = "<ul class='list-group'>";
//     hiraRakitraVoasafidy.forEach(element => {
//         hiraRakitraVoasafidy_html += "<input type='checkbox' name='hiraRakitra' value='" + element + "' class='btn-check' id='rakitra' checked autocomplete='off'>";
//         hiraRakitraVoasafidy_html += "<li class='list-group-item' for='rakitra'>" + sexifyToUpperCase(element) + "</li>";
//     });
//     hiraRakitraVoasafidy_html += "</ul>";
//     $("#hira-rakitra-voasafidy").html(hiraRakitraVoasafidy_html);
// }

// function addHiraFizarana() {
//     var item = $("#hira-fizarana-nosafidiana").val();
//     hiraFizaranaVoasafidy.add(item);
//     let hiraFizaranaVoasafidy_html = "<ul class='list-group'>";
//     hiraFizaranaVoasafidy.forEach(element => {
//         hiraFizaranaVoasafidy_html += "<input type='checkbox' name='hiraFizarana' value='" + element + "' class='btn-check' id='fizarana' checked autocomplete='off'>";
//         hiraFizaranaVoasafidy_html += "<li class='list-group-item' for='fizarana'>" + sexifyToUpperCase(element) + "</li>";
//     });
//     hiraFizaranaVoasafidy_html += "</ul>";
//     $("#hira-fizarana-voasafidy").html(hiraFizaranaVoasafidy_html);
// }
// function addHiraFanangonana() {
//     var item = $("#hira-fanangonana-nosafidiana").val();
//     hiraFanangonanaVoasafidy.add(item);
//     let hiraFanangonanaVoasafidy_html = "<ul class='list-group'>";
//     hiraFanangonanaVoasafidy.forEach(element => {
//         hiraFanangonanaVoasafidy_html += "<input type='checkbox' name='hiraFanangonana' value='" + element + "' class='btn-check' id='fanangonana' checked autocomplete='off'>";
//         hiraFanangonanaVoasafidy_html += "<li class='list-group-item' for='fanangonana'>" + sexifyToUpperCase(element) + "</li>";
//     });
//     hiraFanangonanaVoasafidy_html += "</ul>";
//     $("#hira-fanangonana-voasafidy").html(hiraFanangonanaVoasafidy_html);
// }

// function addHira() {
//     var item = $("#hira-nosafidiana").val();
//     hiraVoasafidy.add(item);
//     let hiraVoasafidy_html = "<ul class='list-group'>";
//     hiraVoasafidy.forEach(element => {
//         hiraVoasafidy_html += "<input type='checkbox' name='hira' value='" + element + "' class='btn-check' id='hira' checked autocomplete='off'>";
//         hiraVoasafidy_html += "<li class='list-group-item' for='hira'>" + sexifyToUpperCase(element) + "</li>";
//     });
//     hiraVoasafidy_html += "</ul>";
//     $("#hira-voasafidy").html(hiraVoasafidy_html);
// }