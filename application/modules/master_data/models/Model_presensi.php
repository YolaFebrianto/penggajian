<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

class Model_presensi extends CI_Model {

	public	$nama   = '';
	public	$aktif  = '';
	
	public function get_presensi(){
		$query = "
			SELECT p.*, k.nama
			FROM presensi p
			INNER JOIN karyawan k 
			ON p.id_karyawan = k.id
			ORDER BY p.tanggal DESC,k.nama ASC
		";
		return $this->db->query($query)->result();
	}
	
	public function by_id_presensi($id){
		$datasrc = $this->db->get_where('presensi', array('id' => $id));
		return $datasrc->num_rows() > 0 ? $datasrc->row() : $this;
	}

	public function get_hari_kerja($id,$tgl_awal,$tgl_akhir){
		$tgl_awal 	= date('Y-m-d',strtotime($tgl_awal));
		$tgl_akhir 	= date('Y-m-d',strtotime($tgl_akhir));
		$query = "
			SELECT COUNT(tanggal) as harikerja
			FROM presensi
			WHERE id_karyawan='$id'
			AND tanggal
			BETWEEN '$tgl_awal' AND '$tgl_akhir'
		";
		return $this->db->query($query)->row()->harikerja;
	}

	public function get_jam_kerja($id,$tgl_awal,$tgl_akhir){
		$tgl_awal 	= date('Y-m-d',strtotime($tgl_awal));
		$tgl_akhir 	= date('Y-m-d',strtotime($tgl_akhir));
		$query = "
			SELECT SUM( TIME_TO_SEC(jam_kerja) ) AS jamkerja
			FROM presensi
			WHERE id_karyawan='$id'
			AND tanggal
			BETWEEN '$tgl_awal' AND '$tgl_akhir'
		";
		return $this->db->query($query)->row()->jamkerja;
	}
}
/* End of file Model_jabatan.php */
/* Location: ./application/modules/master_data/models/Model_jabatan.php */