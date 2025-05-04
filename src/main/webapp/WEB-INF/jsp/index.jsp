<% String[] lst=(String[])request.getAttribute("list"); %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
        <link rel="stylesheet" href="css/adminlte.min.css">
        <link rel="stylesheet" href="css/jquery-ui.min.css">
        <link rel="stylesheet" href="css/ionicons.min.css">
        <link rel="stylesheet" href="css/style.css">
        <link rel="icon" href="images/ppt.png" type="image/x-icon">
        <title>Index</title>
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
            </section>
        </div>

    </body>

    </html>
    <script src="js/bootstrap.bundle.min.js"></script>
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/adminlte.min.js"></script>
    <script src="js/jquery-ui.min.js"></script>
