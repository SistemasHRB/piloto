<?php
namespace MVC;
class Router{
    public $rutasGET=[];
    public $rutasPOST=[];
    public function get($url,$fn){
        $this->rutasGET[$url]=$fn;
    }
    public function post($url,$fn){
        $this->rutasPOST[$url]=$fn;
    }
    public function comprobarRutas(){

        session_start();
        $auth=$_SESSION['login'] ?? null;
        $auth_recepcion=$_SESSION['login_recepcion'] ?? null;
        $auth_comercializacion=$_SESSION['login_comercializacion'] ?? null;
        $auth_redes=$_SESSION['login_redes'] ?? null;

        // ARREGLO DE RUTAS PROTEGIDAS
        $rutas_protegidas=['/admin','/habitaciones/crear', '/habitaciones/actualizar', '/habitaciones/eliminar',  '/eventos/crear', '/eventos/actualizar', '/eventos/eliminar',  '/salones/crear', '/salones/actualizar', '/salones/eliminar',  '/empleados/crear', '/empleados/actualizar', '/empleados/eliminar',  '/centrosconsumo/crear', '/centrosconsumo/actualizar', '/centrosconsumo/eliminar','/habitaciones/mostrar', '/chef/mostrar', '/eventos/mostrar', '/salones/mostrar', '/empleados/mostrar', '/centrosconsumo/mostrar', '/chats/mostrar2','/chats/responder', '/chat2','/actualizarChatServidor','/reserva/recibida','/reservas/mostrar', '/reservas/datosReserva','/reservas/crear','/reservas/confirmar','/reservas/eliminar','/reservas/buscar', '/responder', '/noches','/buscar-usuario','/eliminar-registro','/mostrar_usuario','/actualizar-premio','/beneficios/mostrar', '/beneficios/actualizar', '/beneficios/eliminar', '/auth/mostrar', '/auth/mostrarusuarios', '/auth/eliminarUsuario', '/auth/actualizarUsuario', '/noches','/auth/actualizarAdmin','/auth/eliminar','/beneficios/crear', '/beneficios/actualizar', '/beneficios/mostrar', '/beneficios/eliminar','/premios/mostrar', '/premios/crear', '/premios/actualizar','/premios/eliminar','/chef/crear','/chef/actualizar', '/chef/mostrar', '/chef/eliminar','/usuario/eliminar', '/eliminar-registro','/datosReserva2','/chatbot/crear', '/chatbot/actualizar','/chatbot/mostrar','/chatbot/eliminar'];
        $rutas_protegidas_recepcion=['/admin', '/chats/mostrar2','/chats/responder', '/chat2','/actualizarChatServidor','/reserva/recibida','/reservas/mostrar', '/reservas/datosReserva','/reservas/crear','/reservas/confirmar','/reservas/eliminar','/reservas/buscar', '/responder', '/noches','/buscar-usuario','/eliminar-registro','/premios','/mostrar_usuario','/actualizar-premio', '/noches', '/premios/mostrar', '/premios/crear', '/premios/actualizar','/premios/eliminar','/usuario/eliminar','/eliminar-registro','datosReserva2'];
        $rutas_protegidas_comercializacion=['/admin', '/habitaciones/crear', '/habitaciones/actualizar', '/habitaciones/eliminar',  '/eventos/crear', '/eventos/actualizar', '/eventos/eliminar',  '/salones/crear', '/salones/actualizar', '/salones/eliminar','/centrosconsumo/crear', '/centrosconsumo/actualizar', '/centrosconsumo/eliminar','/habitaciones/mostrar', '/eventos/mostrar', '/salones/mostrar', '/centrosconsumo/mostrar','/chef/mostrar','/chef/crear','/chef/actualizar', '/chef/eliminar' ];
        $rutas_protegidas_redes=['/admin', '/eventos/crear', '/eventos/actualizar', '/eventos/eliminar', '/eventos/mostrar'];

        // basada en la url que estoy visitando gracias al router, me busca la funcion asociada a ese url
        $urlActual=strtok($_SERVER['REQUEST_URI'],'?') ?? '/';
        // $urlActual=$_SERVER['PATH_INFO'] ?? '/';
        $metodo =$_SERVER['REQUEST_METHOD'];
        //    para validar la ruta
        if($metodo==='GET'){
           $fn=$this->rutasGET[$urlActual] ?? null;
           
        }else {
            $fn=$this->rutasPOST[$urlActual] ?? null;
        }

        // PROTEGER LAS RUTAS
   
        if($auth){
        //    ACCESO TOTAAAL
        }else if($auth_comercializacion){
           if(in_array($urlActual, $rutas_protegidas) && !in_array($urlActual, $rutas_protegidas_comercializacion)){
                header('location: /');
            }
        }else if($auth_recepcion){
            if(in_array($urlActual, $rutas_protegidas) && !in_array($urlActual, $rutas_protegidas_recepcion)){
                header('location: /');
            }
        }else if($auth_redes){
            if(in_array($urlActual, $rutas_protegidas) && !in_array($urlActual, $rutas_protegidas_redes)){
                header('location: /');
            }
        }else{
            if(in_array($urlActual, $rutas_protegidas)){
                header('location: /');
            }
        }

        if($fn){
            // la url existe y hay una funcion asociada
            // cuando no sabemos el nombre de la funcion, esta la busca
            // debuguear($fn);
            call_user_func($fn,$this);

        }else{
            // echo 'Error 404: Pagina No encontrada';
            header('Location: /error');
        }
    }


    // muestra una vista
    public function render($view, $datos=[]){

       foreach($datos as $key => $value){
        $$key =$value;
        
       }
     
        ob_start();//empieza almacenar datos en memoria
        include __DIR__ . "/views/$view.php";
        
        $contenido=ob_get_clean();//limpia el buffer
        if($view==='paginas/prueba2' || $view==='paginas/crearPdf'){
            include __DIR__ . "/views/prueba.php";
        }else{
          
            include __DIR__ . "/views/layout.php";
        }

        
    }
}