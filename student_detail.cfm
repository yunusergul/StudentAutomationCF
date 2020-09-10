<cfquery name="databil" datasource="students">
    select og.OGRENCI_ID, og.OGRENCI_ADI, og.OGRENCI_SOYADI, og.TEL_KOD, og.DOGUM_TARIHI, og.MAIL_ADRESI, og.EV_ADRESI,
og.FOTOGRAF, k.KAN_GURUBU, c.DOGUM_YERI, og.ACIL_DURUM_KISI, og.ACIL_DURUM_KISI_TEL_KOD, og.ACIL_DURUM_KISI_TEL, og.ACIL_DURUM_KISI_MAIL 
from Ogrenciler og join kan k on k.KAN_GURUB_ID = og.KAN_GURUBU_ID join Dogum_Yeri c on c.DOGUM_YERI_ID =og.DOGUM_YERI_ID where OGRENCI_ID=#URL.ID#
</cfquery>
<cfinclude template="cfheader.cfm"/>
        
        <cfoutput query="databil">
            <div class="w3-card-4" style="width:10%">
                <img src="images/#FOTOGRAF#.jpg" alt="Person" style="width:100%">
                
              </div>
                <table class="w3-table-all w3-hoverable">
                    <tr>
                      <td><b>İsim Ve Soyismi</b></td>
                      <td>#OGRENCI_ADI#  #OGRENCI_SOYADI#</td>
                    </tr>
                    <tr>
                      <td><b>E-mail</b></td>
                      <td>#MAIL_ADRESI#</td>
                    </tr>
                    <tr>
                      <td><b>Telefon No</b></td>
                      <td>#TEL_KOD#</td>
                    </tr>
                    <tr>
                        <td><b>Doğum Tarihi ve Yeri</b></td>
                        <td>#DOGUM_TARIHI# //  #DOGUM_YERI#</td>
                    </tr>
                    <tr>
                        <td><b>Adress</b></td>
                        <td>#EV_ADRESI#</td>
                    </tr>
                    <tr>
                        <td><b>Kan Grubu</b></td>
                        <td>#KAN_GURUBU#</td>
                    </tr>
                    <tr>
                        <td><b>Acil Durum Kişi Adı</b></td>
                        <td>#ACIL_DURUM_KISI#</td>
                    </tr>
                    <tr>
                        <td><b>Acil Durum Kişi Telefon No</b></td>
                        <td>#ACIL_DURUM_KISI_TEL_KOD# #ACIL_DURUM_KISI_TEL#</td>
                    </tr>
                    <tr>
                        <td><b>Acil Durum Kişi Mail</b></td>
                        <td>#ACIL_DURUM_KISI_MAIL#</td>
                    </tr>
                  </table>
            </cfoutput>

