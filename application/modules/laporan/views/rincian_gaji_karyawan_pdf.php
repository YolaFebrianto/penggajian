<style>
table{
	width:100%; 
	font-size:9px;
	border: 1px solid black;
	border-collapse: collapse;
}
table.total-gaji{border-top: 1px solid #000000;}
table.list-gaji th{
	color: #000000;
   	text-transform:capitalize;
   	text-align: center;
	padding: 5px;
   	border-top: 1px solid #000000;
	border-bottom: 1px solid #000000;
}
table.list-gaji tr td.number_format,
table.total-gaji tr td.number_format{
	text-align:right;
	width: 20%;
}
table td{
	padding: 5px;
   	vertical-align:middle;
   	/*border: none;*/
}
tr, td{
	border: 1px solid black;
}
.text_right{
	text-align: right;
	width: 10%;
}
.td_awal{
	width: 70%;
}
table.lap td, table.header td{
	border: none;
}
table.lap tr, table.header tr{
	border: none;
}
</style>

<table class="header">
	<tr>
		<td>
			<h2>Slip Gaji Karyawan</h2>
			<p>PERIODE : <?php echo date('d M Y',strtotime($karyawan->periode_dari)); ?> s/d <?php echo date('d M Y',strtotime($karyawan->periode_sampai)); ?></p>
		</td>
	</tr>
</table>
<table class="lap">
	<tr>
		<td width="20%">No. Slip Gaji</td>
		<td width="80%" style="text-align: center;"><?php echo $karyawan->id; ?></td>
	</tr>
	<tr>
		<td>Nama</td>
		<td style="text-align: center;"><?php echo $karyawan->nama; ?></td>
	</tr>
</table>
<table class="list-gaji">
	<?php
		$id_karyawan = $karyawan->id_karyawan;
		$query = "
			SELECT ug.gajipokok,ug.tunj_jabatan,ug.gajiharian FROM karyawan AS k 
			LEFT JOIN usulan_gaji AS ug 
				ON ug.id_jabatan=k.id_jabatan
			WHERE k.id='$id_karyawan'
		";
		//AND ug.id_karyawan=k.id
		$query = $this->db->query($query)->row();
		$gajibulanan = $query->gajipokok;
	?>
	<?php if ($karyawan->jenis > 0) { ?>
	<tr>
		<td class="td_awal">Total Jam Kerja</td>
		<td class="text_right"><?php echo $karyawan->jam_kerja; ?> x Rp. </td>
		<td class="number_format">12.250</td>
	</tr>
	<?php } else { ?>
	<tr>
		<td class="td_awal">Total Hari Kerja</td>
		<td class="text_right"><?php echo $karyawan->hk_2minggu; ?> x Rp. </td>
		<td class="number_format"><?php echo my_number_format($gajibulanan); ?> / <?php echo $karyawan->hk_sebulan; ?></td>
	</tr>
	<?php } ?>
	<?php foreach($list_gaji as $row) : ?>
	<tr>
		<td class="td_awal"><?php echo $row->nama; ?></td>
		<td class="text_right">
			<?=($row->nama == 'Gaji Pokok')?' = &nbsp;&nbsp;&nbsp;&nbsp; ':''; ?>
			Rp. 
		</td>
		<td class="number_format"><?php echo my_number_format($row->jumlah); ?></td>
	</tr>
	<?php endforeach; ?>
	<tr>
		<td>Pendapatan</td>
		<td>Rp. </td>
		<td class="number_format"><?php echo my_number_format($karyawan->pendapatan); ?></td>
	</tr>
	<tr>
		<td>Potongan</td>
		<td>Rp. </td>
		<td class="number_format"><?php echo my_number_format($karyawan->potongan); ?></td>
	</tr>
	<tr>
		<td>Gaji Bersih</td>
		<td><b>Rp. </b></td>
		<td class="number_format"><b><?php echo my_number_format($karyawan->gaji_bersih); ?></b></td>
	</tr>
</table>
<table class="total-gaji">
</table>