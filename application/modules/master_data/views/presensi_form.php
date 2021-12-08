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
<h3 class="page-header">Form Presensi</h3>
<div class="actions">
	<a href="<?php echo $back; ?>"><span class="glyphicon glyphicon-arrow-left" aria-hidden="true"></span> Back</a>
</div>

<?php echo form_open($action, array('class' => 'form-horizontal row-form')); ?>
    <div class="form-group">
        <label class="col-sm-2 control-label input-sm">Nama Karyawan</label>
		<div class="col-sm-3">
			<select name="id_karyawan">
				<option value="">--- Pilih Karyawan ---</option>
				<?php
				//echo modules::run('master_data/karyawan/options_karyawan');
					$karyawan = $this->db->order_by('nama')->get('karyawan');
					echo options($karyawan, 'id', @$presensi->id_karyawan, 'nama');
				?>
			</select>
		</div>
	</div>
    <div class="form-group">
        <label class="col-sm-2 control-label input-sm">Tanggal</label>
		<div class="col-sm-3">
           	<div class="input-group date" data-date="" data-date-format="yyyy-mm-dd">
				<input class="form-control input-sm" type="text" name="tanggal" placeholder="Tanggal" value="<?php echo @$presensi->tanggal; ?>" required readonly />
				<span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
            </div>
		</div>
	</div>
    <div class="form-group">
        <label class="col-sm-2 control-label input-sm">Jam Masuk</label>
		<div class="col-sm-3">
		  <input class="form-control input-sm" type="time" name="jam_masuk" placeholder="Jam Masuk" value="<?php echo @$presensi->jam_masuk; ?>" required />
		</div>
	</div>
    <div class="form-group">
        <label class="col-sm-2 control-label input-sm">Jam Keluar</label>
		<div class="col-sm-3">
		  <input class="form-control input-sm" type="time" name="jam_keluar" placeholder="Jam Keluar" value="<?php echo @$presensi->jam_keluar; ?>" required />
		</div>
	</div>
    <div class="form-group">
        <label class="col-sm-2 control-label input-sm">Total Jam Kerja</label>
		<div class="col-sm-3">
		  <input class="form-control input-sm" type="time" name="jam_kerja" placeholder="Total Jam Kerja" value="<?php echo @$presensi->jam_kerja; ?>" required />
		</div>
	</div>
	<div class="form-group">
		<div class="col-sm-offset-2 col-sm-6">
			<button type="submit" class="btn btn btn-primary btn-sm button-blue" > Simpan </button>
			<button type="reset" class="btn btn btn-primary btn-sm button-red" > Reset </button>
		</div>
	</div>
<?php echo form_close(); ?>