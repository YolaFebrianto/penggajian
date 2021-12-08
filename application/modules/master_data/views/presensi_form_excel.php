<?php echo jquery_select2(); ?>
<?php echo bootstrap_datepicker3(); ?>

<script type="text/javascript">
$().ready(function() {
	
	$(".input-group.date").datepicker({ 
		autoclose: true, 
		todayHighlight: true 
	});
	
	$('[name=id_karyawan]').select2({width: '100%'}); 

});	
</script>
<h3 class="page-header">Form Import Excel <small>(Excel 2003 / format .xls)</small></h3>
<div class="actions">
	<a href="<?php echo $back; ?>"><span class="glyphicon glyphicon-arrow-left" aria-hidden="true"></span> Back</a>
</div>

<?php echo form_open_multipart($action, array('class' => 'form-horizontal row-form','onSubmit' => 'return validateForm()')); ?>
    <div class="form-group">
        <label class="col-sm-2 control-label input-sm">Import Excel</label>
		<div class="col-sm-3">
		  <input class="form-control input-sm" type="file" name="import_excel" id="import_excel" />
		</div>
	</div>
	<div class="form-group">
		<div class="col-sm-offset-2 col-sm-6">
			<button type="submit" class="btn btn btn-primary btn-sm button-blue" > Upload </button>
		</div>
	</div>
<?php echo form_close(); ?>
<script type="text/javascript">
//    validasi form (hanya file .xls yang diijinkan)
    function validateForm()
    {
        function hasExtension(inputID, exts) {
            var fileName = document.getElementById(inputID).value;
            return (new RegExp('(' + exts.join('|').replace(/\./g, '\\.') + ')$')).test(fileName);
        }

        if (!hasExtension('import_excel', ['.xls'])){
            alert("Hanya file XLS (Excel 2003) yang diijinkan.");
            return false;
        } else {
        	window.location.href="<?=$action;?>";
        }
    }
</script>