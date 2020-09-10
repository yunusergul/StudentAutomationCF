<cfquery name="update" datasource="students">
    SELECT * FROM Ogrenciler WHERE OGRENCI_ID = #URL.ID#
</cfquery>

<cfquery name="getKanGrubu" datasource="students">
    SELECT KAN_GURUB_ID,KAN_GURUBU
    FROM Kan
</cfquery>

<cfquery name="getDogumYeri" datasource="students">
    SELECT DOGUM_YERI_ID,DOGUM_YERI
    FROM Dogum_Yeri
</cfquery>

<cfquery name="image" datasource="students">
    select FOTOGRAF as deneme from Ogrenciler where OGRENCI_ID= #URL.ID#
</cfquery>

<cfset FOTOGRAF="#image.deneme#">

<cfif IsDefined ("form.posted")> 
    <cfif Form.angrs == 1>
    <cffile action="UPLOAD" filefield="file_path" destination="#expandPath('images/')#" nameconflict="MAKEUNIQUE">
        <cfoutput>
        File Uploaded! #cffile.ClientFile#
        </cfoutput> 
        <cfset FOTOGRAF = createUUID() & "." & cffile.serverFileExt>
       
        <cffile 
        action="rename" 
        source="#expandPath('./images/#cffile.serverFileName#.#cffile.serverFileExt#')#" 
        destination="#expandPath('./images/#FOTOGRAF#.#cffile.serverFileExt#')#"
        />
    </cfif>
    <cfquery datasource="students" name="updateStudent">
        UPDATE
            Ogrenciler 
        SET 
            OGRENCI_ADI ='#form.OGRENCI_ADI#',
            OGRENCI_SOYADI = '#form.OGRENCI_SOYADI#',
            TEL_KOD = '#form.TEL_KOD#',
            DOGUM_TARIHI = '#form.DOGUM_TARIHI#',
            DOGUM_YERI_ID = '#form.DOGUM_YERI_ID#',
            MAIL_ADRESI = '#form.MAIL_ADRESI#',
            EV_ADRESI = '#form.EV_ADRESI#',
            FOTOGRAF = '#FOTOGRAF#',
            KAN_GURUBU_ID = #form.KAN_GURUBU_ID#,
            ACIL_DURUM_KISI = '#form.ACIL_DURUM_KISI#',
            ACIL_DURUM_KISI_TEL = '#form.ACIL_DURUM_KISI_TEL#',
            ACIL_DURUM_KISI_MAIL = '#form.ACIL_DURUM_KISI_MAIL#'
        WHERE
            OGRENCI_ID = #URL.ID#
     </cfquery>
     <h3><i>Your record was update to the database.</i></h3>
</cfif> 

<cfinclude template="cfheader.cfm"/>

<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags-->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Colorlib Templates">
    <meta name="author" content="Colorlib">
    <meta name="keywords" content="Colorlib Templates">

    <!-- Title Page-->
    <title>Öğrenci Kayıt</title>

    <!-- Icons font CSS-->
    <link href="vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">
    <link href="vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
    <!-- Font special for pages-->
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Vendor CSS-->
    <link href="vendor/select2/select2.min.css" rel="stylesheet" media="all">
    <link href="vendor/datepicker/daterangepicker.css" rel="stylesheet" media="all">

    <!-- Main CSS-->
    <link href="css/main.css" rel="stylesheet" media="all">
</head>

<body>
    <div class="page-wrapper bg-gra-02 p-t-130 p-b-100 font-poppins">
        <div class="wrapper wrapper--w680">
            <div class="card card-4">
                <div class="card-body">
                    <h2 class="title">Öğrenci Güncelleme Form</h2>
                    <cfoutput>
                    <form action = "student_update.cfm?ID=#URL.ID#"  method = "post" enctype="multipart/form-data">                                            
                    </cfoutput>
                        <cfoutput query="update">  
                        <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Öğrenci adı</label>
                                    <input class="input--style-4" type="text" name="OGRENCI_ADI" value="#OGRENCI_ADI#">
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Öğrenci soyadı</label>
                                    <input class="input--style-4" type="text" name="OGRENCI_SOYADI" value="#OGRENCI_SOYADI#">
                                </div>
                            </div>
                        </div>
                        <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Telefon</label>
                                    <input class="input--style-4" type="text" name="TEL_KOD" value="#TEL_KOD#">
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Doğum Tarihi</label>
                                    <div class="input-group-icon">
                                        <input class="input--style-4 js-datepicker" type="text" name="DOGUM_TARIHI" value="#DOGUM_TARIHI#">
                                        <i class="zmdi zmdi-calendar-note input-icon js-btn-calendar"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="input-group">
                            <label class="label">Doğum Yeri</label>
                            <div class="rs-select2 js-select-simple select--no-search">
                                <select name="DOGUM_YERI_ID">
                                    <option disabled="disabled" selected="selected">Choose option</option>
                                    <cfloop query="getDogumYeri">
                                        <option value="#DOGUM_YERI_ID#">#DOGUM_YERI#</option>
                                        <option value="#getDogumYeri.DOGUM_YERI_ID#" <cfif update.DOGUM_YERI_ID eq getDogumYeri.DOGUM_YERI_ID> selected</cfif>>#DOGUM_YERI#</option>
                                    </cfloop>
                                </select>
                                <div class="select-dropdown"></div>
                            </div>
                        </div>
                        <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Email</label>
                                    <input class="input--style-4" type="email" name="MAIL_ADRESI" value="#MAIL_ADRESI#">
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Adres</label>
                                    <input class="input--style-4" type="text" name="EV_ADRESI" value="#EV_ADRESI#">
                                </div>
                            </div>
                        </div>
                        <div class="input-group">
                            <label class="label">Kan Grubu</label>
                            <div class="rs-select2 js-select-simple select--no-search">
                                <select name="KAN_GURUBU_ID">
                                    <option disabled="disabled" selected="selected">Choose option</option>
                                    <cfloop query="getKanGrubu">
                                        <option value="#KAN_GURUB_ID#" <cfif update.KAN_GURUBU_ID eq getKanGrubu.KAN_GURUB_ID> selected</cfif>>#KAN_GURUBU#</option>
                                    </cfloop>
                                </select>
                                <div class="select-dropdown"></div>
                            </div>
                        </div>
                        <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Acil Durum Kişisi</label>
                                    <input class="input--style-4" type="text" name="ACIL_DURUM_KISI" value="#ACIL_DURUM_KISI#">
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Acil Durum Kişisi Telefon</label>
                                    <input class="input--style-4" type="text" name="ACIL_DURUM_KISI_TEL" value="#ACIL_DURUM_KISI_TEL#">
                                </div>
                            </div>
                        </div>
                        <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Acil Durum Kişisi Mail</label>
                                    <input class="input--style-4" type="text" name="ACIL_DURUM_KISI_MAIL" value="#ACIL_DURUM_KISI_MAIL#">
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Öğrenci Fotograf</label>
                                    <input id="customFile" class="input--style-4" type="file" name="file_path" value="#FOTOGRAF#"> 
                                    <input name="angrs" id="kkln" value="" type="hidden">
                                    <cfimage style="width:300px; height:300px;" action="writetobrowser" source="images/#FOTOGRAF#.jpg" name="myImage">                                    
                                </div>
                            </div>
                        </div>
                        <div class="p-t-15">
                            <input type = "hidden" name = "posted" value = "<cfoutput>#Now()#</cfoutput>">
                            <input onclick="return Valid()" class="btn btn--radius-2 btn--blue" type = "Submit" name = "" value = "Güncelle"> 
                        </div>
                    </cfoutput>
                    </form>
                </div>
            </div>
        </div>
    </div>

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
    function Valid() {
        debugger;
       var gorsel = $('#customFile');
       if (gorsel[0].files.length == 0) {

           document.getElementById("kkln").value = "0";

       }else{
        document.getElementById("kkln").value = "1";

       }
       }
</script>
