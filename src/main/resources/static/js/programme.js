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