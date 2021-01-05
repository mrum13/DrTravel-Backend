<?php
    class DbOperations{
        private $con;

        function __construct(){
            require_once dirname(__FILE__).'/DbConnect.php';
            $db=new DbConnect;
            $this->con=$db->connect();
        }

        public function createUser($email,$password,$name){
            if(!$this->isEmailExist($email)){
                $stmt=$this->con->prepare("INSERT INTO user_account (email,password,name) VALUES(?,?,?)");
                $stmt->bind_param("sss",$email,$password,$name);
                if ($stmt->execute()){
                    return USER_CREATED;
                } else{
                    return USER_FAILURE;
                }
           }
           return USER_EXIST;
        }

        public function forgetPass($email){
            if(!$this->isEmailExistForget($email)){
                $stmt=$this->con->prepare("INSERT INTO lupasandi_master (email_akun) VALUES(?)");
                $stmt->bind_param("s",$email);
                if ($stmt->execute()){
                    return EMAIL_SENDED;
                } else{
                    return EMAIL_NOT_FOUND;
                }
           }
           return USER_EXIST;
        }

        public function userLogin($email,$password){
            if($this->isEmailExist($email)){
                $hashed_password=$this->getUsersPasswordByEmail($email);
                if(password_verify($password,$hashed_password)){
                    return USER_AUTHENTICATED;
                } else{
                    return USER_PASSWORD_DO_NOT_MATCH;
                }
            } else{
                return USER_NOT_FOUND; 
            }
        }


        private function getUsersPasswordByEmail($email){
            $stmt = $this->con->prepare("SELECT password FROM user_account WHERE email=?");
            $stmt->bind_param("s",$email);
            $stmt->execute();
            $stmt->bind_result($password);
            $stmt->fetch();
            return $password;
        }

        public function wisataSearch($nama_tempat){
            $stmt = $this->con->prepare("SELECT status,nama_tempat,lokasi_tempat,deskripsi,gambar FROM wisata_master WHERE nama_tempat LIKE '%".$nama_tempat."%'");
            $stmt->execute();
            $stmt->bind_result($status,$nama_tempat,$lokasi_tempat,$deskripsi,$gambar);
            $wisata_master=array();
            while($stmt->fetch()){
                $wisata=array();
                $wisata['status']=$status;
                $wisata['nama_tempat']=$nama_tempat;
                $wisata['lokasi_tempat']=$lokasi_tempat;
                $wisata['deskripsi']=$deskripsi;
                $wisata['gambar']=$gambar;
                array_push($wisata_master,$wisata);
            }
            return $wisata_master;
        }

        //semua data wisata
        public function getAllWisata(){
            $stmt = $this->con->prepare("SELECT status,nama_tempat,lokasi_tempat,deskripsi,gambar FROM wisata_master;");
            $stmt->execute();
            $stmt->bind_result($status,$nama_tempat,$lokasi_tempat,$deskripsi,$gambar);
            $wisata_master=array();
            while($stmt->fetch()){
                $wisata=array();
                $wisata['status']=$status;
                $wisata['nama_tempat']=$nama_tempat;
                $wisata['lokasi_tempat']=$lokasi_tempat;
                $wisata['deskripsi']=$deskripsi;
                $wisata['gambar']=$gambar;
                array_push($wisata_master,$wisata);
            }
            return $wisata_master;
        }

        public function getPopulerWisata(){
            $stmt = $this->con->prepare("SELECT status,nama_tempat,lokasi_tempat,deskripsi,gambar FROM wisata_master Where status = 1;");
            $stmt->execute();
            $stmt->bind_result($status,$nama_tempat,$lokasi_tempat,$deskripsi,$gambar);
            $wisata_master=array();
            while($stmt->fetch()){
                $wisata=array();
                $wisata['status']=$status;
                $wisata['nama_tempat']=$nama_tempat;
                $wisata['lokasi_tempat']=$lokasi_tempat;
                $wisata['deskripsi']=$deskripsi;
                $wisata['gambar']=$gambar;
                array_push($wisata_master,$wisata);
            }
            return $wisata_master;
        }

        //Detail Wisata
        public function getDetailWisata($nama_tempat){
            $stmt = $this->con->prepare("SELECT nama_tempat,lokasi_tempat,deskripsi,gambar FROM wisata_master WHERE nama_tempat LIKE '%".$nama_tempat."%'");
            $stmt->execute();
            $stmt->bind_result($nama_tempat,$lokasi_tempat,$deskripsi,$gambar);
            $wisata_master=array();
            while($stmt->fetch()){
                $wisata=array();
                $wisata['nama_tempat']=$nama_tempat;
                $wisata['lokasi_tempat']=$lokasi_tempat;
                $wisata['deskripsi']=$deskripsi;
                $wisata['gambar']=$gambar;
                array_push($wisata_master,$wisata);
            }
            return $wisata_master;
        }

        //semua data kuliner
        public function getAllKuliner(){
            $stmt = $this->con->prepare("SELECT nama_kuliner,asal_kuliner,deskripsi_kuliner,gambar_kuliner FROM kuliner_master;");
            $stmt->execute();
            $stmt->bind_result($nama_kuliner,$asal_kuliner,$deskripsi_kuliner,$gambar_kuliner);
            $kuliner_master=array();
            while($stmt->fetch()){
                $kuliner=array();
                $kuliner['nama_kuliner']=$nama_kuliner;
                $kuliner['asal_kuliner']=$asal_kuliner;
                $kuliner['deskripsi_kuliner']=$deskripsi_kuliner;
                $kuliner['gambar_kuliner']=$gambar_kuliner;
                array_push($kuliner_master,$kuliner);
            }
            return $kuliner_master;
        }

        //Populer Kuliner
        public function getPopulerKuliner(){
            $stmt = $this->con->prepare("SELECT nama_kuliner,asal_kuliner,deskripsi_kuliner,gambar_kuliner FROM kuliner_master Where status = 1;");
            $stmt->execute();
            $stmt->bind_result($nama_kuliner,$asal_kuliner,$deskripsi_kuliner,$gambar_kuliner);
            $kuliner_master=array();
            while($stmt->fetch()){
                $kuliner=array();
                $kuliner['nama_kuliner']=$nama_kuliner;
                $kuliner['asal_kuliner']=$asal_kuliner;
                $kuliner['deskripsi_kuliner']=$deskripsi_kuliner;
                $kuliner['gambar_kuliner']=$gambar_kuliner;
                array_push($kuliner_master,$kuliner);
            }
            return $kuliner_master;
        }

        //Detail kuliner
        public function getDetailKuliner($nama_kuliner){
            $stmt = $this->con->prepare("SELECT nama_kuliner,asal_kuliner,deskripsi_kuliner,gambar_kuliner FROM kuliner_master WHERE nama_kuliner LIKE '%".$nama_kuliner."%'");
            $stmt->execute();
            $stmt->bind_result($nama_kuliner,$asal_kuliner,$deskripsi_kuliner,$gambar_kuliner);
            $kuliner_master=array();
            while($stmt->fetch()){
                $kuliner=array();
                $kuliner['nama_kuliner']=$nama_kuliner;
                $kuliner['asal_kuliner']=$asal_kuliner;
                $kuliner['deskripsi_kuliner']=$deskripsi_kuliner;
                $kuliner['gambar_kuliner']=$gambar_kuliner;
                array_push($kuliner_master,$kuliner);
            }
            return $kuliner_master;
        }

        public function getUserByEmail($email){
            $stmt = $this->con->prepare("SELECT id,email,name FROM user_account WHERE email=?");
            $stmt->bind_param("s",$email);
            $stmt->execute();
            $stmt->bind_result($id,$email,$name);
            $stmt->fetch();
            $user=array();
            $user['id']=$id;
            $user['email']=$email;
            $user['name']=$name;
            return $user;
        }

        public function updateUser($email,$name,$id){
            $stmt=$this->con->prepare("UPDATE user_account SET email=?,name=? WHERE id=?");
            $stmt->bind_param("ssi",$email,$name,$id);
            if($stmt->execute())
                return true;
            return false;
        }

        public function updatePassword($currentpassword,$newpassword,$email){
            $hashed_password = $this->getUsersPasswordByEmail($email);
           
            if(password_verify($currentpassword,$hashed_password)){
               $hashed_password=password_hash($newpassword, PASSWORD_DEFAULT);
               $stmt = $this->con->prepare("UPDATE user_account SET password=? WHERE email=?");
               $stmt->bind_param($hashed_password,$email);

                if($stmt->execute())
                    return PASSWORD_CHANGED;
                return PASSWORD_NOT_CHANGED;
            }else{
                return PASSWORD_DO_NOT_MATCH;
            }
        }

        // public function deleteUser($id){
        //     $stmt=$this->con->prepare("DELETE FROM user_account WHERE id = ?");
        //     $stmt->bind_param("i",$id);
        //     if($stmt->execute())
        //         return true;
        //     return false;
        // }

        private function isEmailExist($email){
            $stmt=$this->con->prepare("SELECT id FROM user_account WHERE email=?");
            $stmt->bind_param("s",$email);
            $stmt->execute();
            $stmt->store_result();
            return $stmt->num_rows>0;
        }

        private function isEmailExistForget($email){
            $stmt=$this->con->prepare("SELECT email_akun FROM lupasandi_master WHERE email_akun=?");
            $stmt->bind_param("s",$email);
            $stmt->execute();
            $stmt->store_result();
            return $stmt->num_rows>0;
        }
    }
?>