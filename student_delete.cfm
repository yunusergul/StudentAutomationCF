<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<cfquery name="delete" datasource="students">
DELETE FROM Ogrenciler WHERE OGRENCI_ID=#URL.ID#</cfquery>
<script type="text/javascript">
		alert("Kayit Silindi.");
		window.location.href='<cfoutput>list_student.cfm</cfoutput>';
</script>