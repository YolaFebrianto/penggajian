<h3 class="page-header">Data Presensi</h3>
<div class="actions">
	<a href="<?php echo $add; ?>"><span class="glyphicon glyphicon-plus"></span>&nbsp;&nbsp;Add Data</a>
	<a href="<?php echo $formImportExcel; ?>"><span class="glyphicon glyphicon-upload"></span>&nbsp;&nbsp;Import Excel</a>
</div>
<?php if($this->session->flashdata('info')){ ?>
<div class="alert alert-info"><?= $this->session->flashdata('info'); ?></div>
<?php } ?>	
<div class="block-table table-sorting clearfix"><!-- block-fluid table-sorting clearfix -->
	<table cellpadding="0" cellspacing="0" class="tabel" id="datatables">
		<thead>
			<tr>
				<th width="10%">no</th>
				<th width="20%">karyawan</th>
				<th width="15%">tanggal</th>
				<th width="15%">jam_masuk</th>
				<th width="15%">jam_keluar</th>
				<th width="15%">jam_kerja</th>
				<th width="10%">aksi</th>
			</tr>
		</thead>
		<tbody>
			<?php 
				$no = 1;
				foreach($grid as $record) :
			?>
					<tr>
						<td align="center"><?php echo $no; ?></td>
						<td><?php echo $record->nama; ?></td>
						<td align="center"><?php echo $record->tanggal; ?></td>
						<td align="center"><?php echo $record->jam_masuk; ?></td>
						<td align="center"><?php echo $record->jam_keluar; ?></td>
						<td align="center"><?php echo $record->jam_kerja; ?></td>
						<td align="center">
							<a href="<?php echo site_url('/master_data/presensi/edit/'.$record->id); ?>" title="Edit Data"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></a> |
							<a href="<?php echo site_url('/master_data/presensi/delete/'.$record->id); ?>" onclick="return confirm('Apakah Anda yakin akan menghapus data <?php echo $record->nama.' ('.$record->tanggal.')'; ?> ?')" title="Delete Data"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>
						</td>
					</tr>
			<?php 
					$no++;
				endforeach;
			?>
		</tbody>
	</table>
</div>