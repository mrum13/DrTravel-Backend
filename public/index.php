<?php
    use Psr\Http\Message\ResponseInterface as Response;
    use Psr\Http\Message\ServerRequestInterface as Request;
    use Slim\Factory\AppFactory;

    require '../vendor/autoload.php';
    // require '../includes/DbConnect.php';
    require '../includes/DbOperations.php';

    $app = AppFactory::create();

    $app->addBodyParsingMiddleware();

    $app->add(new Tuupola\Middleware\HttpBasicAuthentication([
        "secure"=>false,
        "users" => [
            "drtravel" => "123456",
        ]
    ]));

    //Pembuatan Akun (Register)
    $app->post('/DrTravelApi/public/createUser',function(Request $request, Response $response){
        if(!haveEmptyParameters(array('email','password','name'),$request,$response)){
            $request_data=$request->getParsedBody();

            $email=$request_data['email'];
            $password=$request_data['password'];
            $name=$request_data['name'];

            $hash_password = password_hash($password,PASSWORD_DEFAULT);

            $db=new DbOperations;

            $result = $db->createUser($email,$hash_password,$name);

            if($result==USER_CREATED){
                $message=array();
                $message['error']=false;
                $message['message']='user created successfully';

                $response->getBody()->write(json_encode($message));
                return $response
                            ->withHeader('Content-type','application/json')
                            ->withStatus(201);
            }else if($result==USER_FAILURE){
                $message=array();
                $message['error']=true;
                $message['message']='some error occurred';

                $response->getBody()->write(json_encode($message));
                return $response
                            ->withHeader('Content-type','application/json')
                            ->withStatus(422);
            }else if($result==USER_EXIST){
                $message=array();
                $message['error']=true;
                $message['message']='user already exists';

                $response->getBody()->write(json_encode($message));
                return $response
                            ->withHeader('Content-type','application/json')
                            ->withStatus(422);
            }
        }

        return $response
            ->withHeader('Content-type','application/json')
            ->withStatus(422);
    });

    //Lupa Password 
    $app->post('/DrTravelApi/public/forgetPass',function(Request $request, Response $response){
        if(!haveEmptyParameters(array('email'),$request,$response)){
            $request_data=$request->getParsedBody();

            $email=$request_data['email'];
            $db=new DbOperations;
            $result = $db->forgetPass($email);

            if($result==EMAIL_SENDED){
                $message=array();
                $message['error']=false;
                $message['message']='email has been sended';

                $response->getBody()->write(json_encode($message));
                return $response
                            ->withHeader('Content-type','application/json')
                            ->withStatus(201);

            }else if($result==EMAIL_NOT_FOUND){
                $message=array();
                $message['error']=true;
                $message['message']='some error occurred';

                $response->getBody()->write(json_encode($message));
                return $response
                            ->withHeader('Content-type','application/json')
                            ->withStatus(422);
                            
            } else if($result==USER_EXIST){
                $message=array();
                $message['error']=true;
                $message['message']='Email sudah dikirim';

                $response->getBody()->write(json_encode($message));
                return $response
                            ->withHeader('Content-type','application/json')
                            ->withStatus(422);
        }
    }
        return $response
            ->withHeader('Content-type','application/json')
            ->withStatus(422);
    });

    //Login Akun
    $app->post('/DrTravelApi/public/userLogin', function(Request $request,Response $response){
        if(!haveEmptyParameters(array('email','password'),$request,$response)){
            $request_data=$request->getParsedBody();

            $email=$request_data['email'];
            $password=$request_data['password'];

            $db=new DbOperations;
            $result=$db->userLogin($email,$password);

            if($result==USER_AUTHENTICATED){
                $user=$db->getUserByEmail($email);
                $response_data=array();
                $response_data['error']=false;
                $response_data['message']='Login Successful';
                $response_data['user']=$user;

                $response->getBody()->write(json_encode($response_data));

                return $response
                    ->withHeader('Content-type','application/json')
                    ->withStatus(200);
            } else if($result==USER_NOT_FOUND){
                $response_data=array();
                $response_data['error']=true;
                $response_data['message']='User not exist';
                

                $response->getBody()->write(json_encode($response_data));

                return $response
                    ->withHeader('Content-type','application/json')
                    ->withStatus(200);
            } else if($result==USER_PASSWORD_DO_NOT_MATCH){
                $response_data=array();
                $response_data['error']=true;
                $response_data['message']='Email atau password salah !';

                $response->getBody()->write(json_encode($response_data));

                return $response
                    ->withHeader('Content-type','application/json')
                    ->withStatus(200);
            }
        }
        return $response
            ->withHeader('Content-type','application/json')
            ->withStatus(422);
    });

    //Cari Tempat
    $app->post('/DrTravelApi/public/searchWisata', function(Request $request,Response $response){
        if(!haveEmptyParameters(array('nama_tempat'),$request,$response)){
            $request_data=$request->getParsedBody();

            $nama_tempat=$request_data['nama_tempat'];

            $db=new DbOperations;

            $wisata_master=$db->wisataSearch($nama_tempat);
            $response_data=array();
            $response_data['error']=false;
            $response_data['wisata']=$wisata_master;

            $response->getBody()->write(json_encode($response_data));

            return $response
                ->withHeader('Content-type','application/json')
                ->withStatus(200);
        }
        return $response
            ->withHeader('Content-type','application/json')
            ->withStatus(422);
    });
        

    //data wisata master
    $app->get('/DrTravelApi/public/allWisata',function(Request $request,Response $response){
        $db=new DbOperations;

        $wisata_master=$db->getAllWisata();
        $response_data=array();
        $response_data['error']=false;
        $response_data['wisata']=$wisata_master;

        $response->getBody()->write(json_encode($response_data));

        return $response
            ->withHeader('Content-type','application/json')
            ->withStatus(200);
    });

    //data wisata populer
    $app->get('/DrTravelApi/public/wisataPopuler',function(Request $request,Response $response){
        $db=new DbOperations;

        $wisata_master=$db->getPopulerWisata();
        $response_data=array();
        $response_data['error']=false;
        $response_data['wisata']=$wisata_master;

        $response->getBody()->write(json_encode($response_data));

        return $response
            ->withHeader('Content-type','application/json')
            ->withStatus(200);
    });

    //data detail wisata
    $app->post('/DrTravelApi/public/detailWisata', function(Request $request,Response $response){
        if(!haveEmptyParameters(array('nama_tempat'),$request,$response)){
            $request_data=$request->getParsedBody();

            $nama_tempat=$request_data['nama_tempat'];

            $db=new DbOperations;

            $wisata_master=$db->getDetailWisata($nama_tempat);
            $response_data=array();
            $response_data['error']=false;
            $response_data['wisata']=$wisata_master;

            $response->getBody()->write(json_encode($response_data));

            return $response
                ->withHeader('Content-type','application/json')
                ->withStatus(200);
        }
        return $response
            ->withHeader('Content-type','application/json')
            ->withStatus(422);
    });

    //data kuliner master
    $app->get('/DrTravelApi/public/allKuliner',function(Request $request,Response $response){
        $db=new DbOperations;
        $kuliner_master=$db->getAllKuliner();
        $response_data=array();
        $response_data['error']=false;
        $response_data['kuliner']=$kuliner_master;

        $response->getBody()->write(json_encode($response_data));

        return $response
            ->withHeader('Content-type','application/json')
            ->withStatus(200);
    });

    //data Kuliner populer
    $app->get('/DrTravelApi/public/kulinerPopuler',function(Request $request,Response $response){
        $db=new DbOperations;
        $kuliner_master=$db->getPopulerKuliner();
        $response_data=array();
        $response_data['error']=false;
        $response_data['kuliner']=$kuliner_master;

        $response->getBody()->write(json_encode($response_data));

        return $response
            ->withHeader('Content-type','application/json')
            ->withStatus(200);
    });

    //data detail kuliner
    $app->post('/DrTravelApi/public/detailKuliner', function(Request $request,Response $response){
        if(!haveEmptyParameters(array('nama_kuliner'),$request,$response)){
            $request_data=$request->getParsedBody();
            $nama_kuliner=$request_data['nama_kuliner'];
            $db=new DbOperations;
            $kuliner_master=$db->getDetailKuliner($nama_kuliner);
            $response_data=array();
            $response_data['error']=false;
            $response_data['kuliner']=$kuliner_master;

            $response->getBody()->write(json_encode($response_data));

            return $response
                ->withHeader('Content-type','application/json')
                ->withStatus(200);
        }
        return $response
            ->withHeader('Content-type','application/json')
            ->withStatus(422);
    });

    //data penginapan master
    $app->get('/DrTravelApi/public/allPenginapan',function(Request $request,Response $response){
        $db=new DbOperations;
        $penginapan_master=$db->getAllPenginapan();
        $response_data=array();
        $response_data['error']=false;
        $response_data['penginapan']=$penginapan_master;

        $response->getBody()->write(json_encode($response_data));

        return $response
            ->withHeader('Content-type','application/json')
            ->withStatus(200);
    });

    //data penginapan populer
    $app->get('/DrTravelApi/public/penginapanPopuler',function(Request $request,Response $response){
        $db=new DbOperations;
        $penginapan_master=$db->getPopulerPenginapan();
        $response_data=array();
        $response_data['error']=false;
        $response_data['penginapan']=$penginapan_master;

        $response->getBody()->write(json_encode($response_data));

        return $response
            ->withHeader('Content-type','application/json')
            ->withStatus(200);
    });

    //data detail penginapan
    $app->post('/DrTravelApi/public/detailPenginapan', function(Request $request,Response $response){
        if(!haveEmptyParameters(array('nama_penginapan'),$request,$response)){
            $request_data=$request->getParsedBody();
            $nama_penginapan=$request_data['nama_penginapan'];
            $db=new DbOperations;
            $penginapan_master=$db->getDetailPenginapan($nama_penginapan);
            $response_data=array();
            $response_data['error']=false;
            $response_data['penginapan']=$penginapan_master;

            $response->getBody()->write(json_encode($response_data));

            return $response
                ->withHeader('Content-type','application/json')
                ->withStatus(200);
        }
        return $response
            ->withHeader('Content-type','application/json')
            ->withStatus(422);
    });

    //data masjid master
    $app->get('/DrTravelApi/public/allMasjid',function(Request $request,Response $response){
        $db=new DbOperations;
        $masjid_master=$db->getAllMasjid();
        $response_data=array();
        $response_data['error']=false;
        $response_data['masjid']=$masjid_master;

        $response->getBody()->write(json_encode($response_data));

        return $response
            ->withHeader('Content-type','application/json')
            ->withStatus(200);
    });

    //data masjid populer
    $app->get('/DrTravelApi/public/masjidPopuler',function(Request $request,Response $response){
        $db=new DbOperations;
        $masjid_master=$db->getPopulerMasjid();
        $response_data=array();
        $response_data['error']=false;
        $response_data['masjid']=$masjid_master;

        $response->getBody()->write(json_encode($response_data));

        return $response
            ->withHeader('Content-type','application/json')
            ->withStatus(200);
    });

    //data detail masjid
    $app->post('/DrTravelApi/public/detailMasjid', function(Request $request,Response $response){
        if(!haveEmptyParameters(array('nama_masjid'),$request,$response)){
            $request_data=$request->getParsedBody();
            $nama_penginapan=$request_data['nama_penginapan'];
            $db=new DbOperations;
            $penginapan_master=$db->getDetailPenginapan($nama_penginapan);
            $response_data=array();
            $response_data['error']=false;
            $response_data['penginapan']=$penginapan_master;

            $response->getBody()->write(json_encode($response_data));

            return $response
                ->withHeader('Content-type','application/json')
                ->withStatus(200);
        }
        return $response
            ->withHeader('Content-type','application/json')
            ->withStatus(422);
    });

    //update user
    $app->put('/DrTravelApi/public/updateUser/{id}',function(Request $request,Response $response,array $args){
        $id=$args['id'];

        if(!haveEmptyParameters(array('email','name'),$request,$response)){
            $request_data=$request->getParsedBody();
            $email=$request_data['email'];
            $name=$request_data['name'];

            $db=new DbOperations;
            if($db->updateUser($email,$name,$id)){
                $response_data=array();
                $response_data['error']=false;
                $response_data['message']='User Update Successfully';
                $user=$db->getUserByEmail($email);
                $response_data['user']=$user;

                $response->getBody()->write(json_encode($response_data));

                return $response
                    ->withHeader('Content-type', 'application/json')
                    ->withStatus(200);
            }else{
                $response_data=array();
                $response_data['error']=true;
                $response_data['message']='Please Try Again Later';
                $user=$db->getUserByEmail($email);
                $response_data['user']=$user;

                $response->getBody()->write(json_encode($response_data));

                return $response
                    ->withHeader('Content-type', 'application/json')
                    ->withStatus(200);
            }
        }
        return $response
            ->withHeader('Content-type','application/json')
            ->withStatus(200);
    });


    //hapus user
    $app->delete('/DrTravelApi/public/deleteUser/{id}',function(Request $request, Response $response, array $args){
        $id=$args['id'];

        $db=new DbOperations;

        $response_data=array();
        if($db->deleteUser($id)){
            $response_data['error']=false;
            $response_data['message']='User has been deleted';
        } else{
            $response_data['error']=true;
            $response_data['message']='Please try again later';
        }

        $response->getBody()->write(json_encode($response_data));
        return $response
            ->withHeader('Content-type','application/json')
            ->withStatus(200);
    });

    //update password
    $app->put('/DrTravelApi/public/updatePassword/{id}',function(Request $request,Response $response,array $args){
        $id=$args['id'];

        if(!haveEmptyParameters(array('currentpassword','newpassword','email'),$request,$response)){
            $request_data=$request->getParsedBody();
            $currentpassword=$request_data['currentpassword'];
            $newpassword=$request_data['newpassword'];
            $email=$request_data['email'];

            $db=new DbOperations;

            $result=$db->updatePassword($currentpassword,$newpassword,$email);

            if($result==PASSWORD_CHANGED){
                $response_data=array();
                $response_data['error']=false;
                $response_data['message']='Password Changed';
                $response->getBody()->write(json_encode($response_data));
                return $response->withHeader('Content-type','application/json')
                                ->withStatus(200);
            }else if($result == PASSWORD_DO_NOT_MATCH){
                $response_data=array();
                $response_data['error']=true;
                $response_data['message']='You have given wrong password';
                $response->getBody()->write(json_encode($response_data));
                return $response->withHeader('Content-type','application/json')
                                ->withStatus(200);
            }else if($result == PASSWORD_NOT_CHANGED){
                $response_data=array();
                $response_data['error']=true;
                $response_data['message']='Some error occurred';
                $response->getBody()->write(json_encode($response_data));
                return $response->withHeader('Content-type','application/json')
                                ->withStatus(200);
            }
        }

        return $response
            ->withHeader('Content-type','application/json')
            ->withStatus(422);
    });

    function haveEmptyParameters($required_params,$request,$response){
        $error=false;
        $error_params="";
        $request_params=$request->getParsedBody();

        foreach($required_params as $param){
            if(!isset($request_params[$param])||strlen($request_params[$param])<=0){
                $error=true;
                $error_params.=$param.', ';
            }
        }

        if($error){
            $error_detail=array();
            $error_detail['error']=true;
            $error_detail['message']='Required parameters'.substr($error_params,0,-2).'are missing or empty';
            $response->getBody()->write(json_encode($error_detail));
        }
        return $error;
    }

    $app->run();
?>