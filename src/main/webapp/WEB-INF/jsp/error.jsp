<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="icon" href="images/ppt.png" type="image/x-icon">
    <title>Error Page</title>
</head>

<body>

    <div class="content-wrapper">
        <!-- Main content -->
        <section class="content">
            <div class="error-page">
                <div class="card card-primary">
                    <div class="card-header">
                        <h2 class="headline text-danger">Erreur</h2>
                    </div>
                    <div class="card-body">
                        <div class="error-content">
                            <h3><i class="fas fa-exclamation-triangle text-danger"></i>${message}</h3>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</body>

</html>