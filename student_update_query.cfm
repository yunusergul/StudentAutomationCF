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
        ACIL_DURUM_KISI_TEL = '#ACIL_DURUM_KISI_TEL#',
        ACIL_DURUM_KISI_MAIL = '#ACIL_DURUM_KISI_MAIL#'
    WHERE
        OGRENCI_ID = #URL.ID#
 </cfquery>

<script type="text/javascript">
    alert("Kayıt Güncellendi!");
    window.location.href='<cfoutput>list_student.cfm</cfoutput>';
</script>