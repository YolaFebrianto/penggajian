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
			ORDER BY p.tanggal,k.nama ASC
		";
		return $this->db->query($query)->result();
	}
	
	public function by_id_presensi($id){
		$datasrc = $this->db->get_where('presensi', array('id' => $id));
		return $datasrc->num_rows() > 0 ? $datasrc->row() : $this;
	}
	
}
/* End of file Model_jabatan.php */
/* Location: ./application/modules/master_data/models/Model_jabatan.php */