<cfquery name="empdata_" datasource="students">
    SELECT OGRENCI_ID,OGRENCI_ADI,OGRENCI_SOYADI,TEL_KOD,MAIL_ADRESI FROM Ogrenciler 
</cfquery>

<cfinclude template="cfheader.cfm"/>

<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags-->
    
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <!-- Icons font CSS-->
    <link href="vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">
    <link href="vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
    <!-- Font special for pages-->
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <link href="https://unpkg.com/material-components-web@latest/dist/material-components-web.min.css" rel="stylesheet">
    <script src="https://unpkg.com/material-components-web@latest/dist/material-components-web.min.js"></script>

    <!-- Vendor CSS-->
    <link href="vendor/select2/select2.min.css" rel="stylesheet" media="all">
    <link href="vendor/datepicker/daterangepicker.css" rel="stylesheet" media="all">

    <!-- Main CSS-->
    <link href="css/main.css" rel="stylesheet" media="all">
</head>

<body>
    <input id="myInput" type="text" placeholder="Search...">
    <br><br>
    <table id="dtBasicExample" class="table table-striped table-bordered table-sm" cellspacing="0" width="100%">
        <thead>
          <tr>
            <th scope="col">Adı</th>
            <th scope="col">Soyadı</th>
            <th scope="col">Telefon No</th>
            <th scope="col">Mail</th>
            <th scope="col">Detay</th>
            <th scope="col">Güncelle</th>
            <th scope="col">Sil</th>
          </tr>
        </thead>
        <tbody id="myTable">
        <cfoutput query="empdata_">
          <tr>
            <td>#OGRENCI_ADI#</td>
            <td>#OGRENCI_SOYADI#</td>
            <td>#TEL_KOD#</td>
            <td>#MAIL_ADRESI#</td>
            <td><a href="student_detail.cfm?ID=#OGRENCI_ID#" class="btn btn-info ">Detay</a></td>
            <td><a href="student_update.cfm?ID=#OGRENCI_ID#" class="btn btn-warning">Güncelle</a></td>
            <td><a href="student_delete.cfm?ID=#OGRENCI_ID#" class="btn btn-danger">Sil</a></td>
          </tr>
          </cfoutput>
        </tbody>
      </table>
      <!---TABLO BİTİŞ---->   

    

    <!-- Jquery JS-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <!-- Vendor JS-->
    <script src="vendor/select2/select2.min.js"></script>
    <script src="vendor/datepicker/moment.min.js"></script>
    <script src="vendor/datepicker/daterangepicker.js"></script>

    <!-- Main JS-->
    <script src="js/global.js"></script>

</body>
<!-- This templates was made by Colorlib (https://colorlib.com) -->

</html>
<!-- end document-->

<script>
    $(document).ready(function () {
    $("#myInput").on("keyup", function () {
        var value = $(this).val().toLowerCase();
        $("#myTable tr").filter(function () {
            $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
        });
    });

    // var str = 'osmancansizosmancansiz/osmanosman';
    // document.body.innerHTML = str.slice(6);
});

 </script>