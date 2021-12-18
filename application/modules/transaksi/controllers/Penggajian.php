<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

class Penggajian extends MX_Controller {
	
	
	function __construct() {
		parent::__construct();
		
		$this->page->use_directory();
		//$this->load->model('model_penggajian');
	}
	
	public function index(){			
		$this->page->view('penggajian_form', array(
			'action'	 	=> $this->page->base_url("/insert_transaksi_gaji"),
			'perkiraan'		=> $this->db->get_where('perkiraan', array('aktif' => 'Y'))->result(),
		));
	}

	public function jam_kerja(){			
		$this->page->view('penggajian_jam_form', array(
			'action'	 	=> $this->page->base_url("/insert_transaksi_gaji"),
			'perkiraan'		=> $this->db->get_where('perkiraan', array('aktif' => 'Y'))->result(),
		));
	}
	
	public function insert_transaksi_gaji(){		
		$no_slip = $this->input->post('no_slip');
		$id_karyawan = $this->input->post('id_karyawan');
		$tgl_gaji = $this->input->post('tgl_gaji');
		$jenis = $this->input->post('jenis');
		$hk_sebulan = $this->input->post('hari_kerja_sebulan');
		$hk_2minggu = $this->input->post('hari_kerja_2minggu');
		$jam_kerja = $this->input->post('jam_kerja_2minggu');
		$periode_dari = $this->input->post('periode_dari');
		$periode_sampai = $this->input->post('periode_sampai');
		
		if ($no_slip == '' || $id_karyawan == '' || $tgl_gaji == ''){
			$this->session->set_flashdata('cek_field', 'failed');		
			redirect($this->page->base_url());
		}
		else{
			$this->session->set_flashdata('cek_field', 'sukses');
			
			$pendapatan = strip_titik($this->input->post('pendapatan'));
			$potongan = strip_titik($this->input->post('potongan'));
			$gaji_bersih = strip_titik($this->input->post('gaji_bersih'));
			
			$data = array (
				'id'	 	  => $no_slip,
				'id_karyawan' => $id_karyawan,
				'tgl_gaji'	  => $tgl_gaji,
				'pendapatan'  => $pendapatan,
				'potongan'    => $potongan,
				'gaji_bersih' => $gaji_bersih,
				'id_pengguna_input' => $this->session->userdata('pengguna')->id,
				'jenis'		  => $jenis, 
				'hk_sebulan'  => $hk_sebulan,
				'hk_2minggu'  => $hk_2minggu,
				'jam_kerja'	  => $jam_kerja,
				'periode_dari'=> $periode_dari,
				'periode_sampai'=>$periode_sampai
			);
			$this->db->insert('transaksi_gaji', $data);
			
			$id_transaksi_gaji = $this->db->insert_id();
			
			$perkiraan_arr  = $this->input->post('id_perkiraan');
			$pendapatan_arr = $this->input->post('pendapatan_arr');
			$potongan_arr   = $this->input->post('potongan_arr');
			
			$detail = array();
			foreach ($perkiraan_arr as $id_perkiraan => $val) {
				if ($val != 0) {
					$jml_arr = $pendapatan_arr[$id_perkiraan] != 0 ? $pendapatan_arr[$id_perkiraan] : $potongan_arr[$id_perkiraan];
					$detail[] = array (
						'id_transaksi_gaji' => $no_slip,
						'id_perkiraan'	   => $val,
						'jumlah' => $jml_arr,
					);
				}			
			}
			
			if(count($detail) != 0){
				$this->db->insert_batch('rincian_transaksi_gaji', $detail);
			}
			
			redirect($this->page->base_url());
		}
	}

}

/* End of file Penggajian.php */
/* Location: ./application/modules/transaksi/controllers/Penggajian.php */