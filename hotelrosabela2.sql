/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE TABLE `beneficio` (
  `id` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) DEFAULT NULL,
  `monto` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `centros_consumo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(145) DEFAULT NULL,
  `descripcion` longtext,
  `horario` longtext,
  `imagen` varchar(250) DEFAULT NULL,
  `plato_especial` varchar(145) DEFAULT NULL,
  `link` longtext,
  `imagen2` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `chat` (
  `id` int NOT NULL AUTO_INCREMENT,
  `mensaje` longtext NOT NULL,
  `usuarios_id` int NOT NULL,
  `usuario_admi_id` int DEFAULT NULL,
  `codigo` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_comentarios_usuarios1_idx` (`usuarios_id`),
  KEY `usuario_admi_id` (`usuario_admi_id`),
  CONSTRAINT `chat_ibfk_1` FOREIGN KEY (`usuario_admi_id`) REFERENCES `usuario_admi` (`id`),
  CONSTRAINT `fk_comentarios_usuarios1` FOREIGN KEY (`usuarios_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `chatbot` (
  `id` int NOT NULL AUTO_INCREMENT,
  `queries` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `replies` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `queries` (`queries`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `chef` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `apellido` varchar(100) DEFAULT NULL,
  `centros_consumo_id` int NOT NULL,
  `imagen` varchar(200) DEFAULT NULL,
  `descripcion` longtext,
  PRIMARY KEY (`id`),
  KEY `fk_chef_centros_consumo1_idx` (`centros_consumo_id`),
  CONSTRAINT `fk_chef_centros_consumo1` FOREIGN KEY (`centros_consumo_id`) REFERENCES `centros_consumo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `empleados` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `apellido` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `cargo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `imagen` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `eventos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `descripcion` longtext,
  `imagen` varchar(255) DEFAULT NULL,
  `fecha` varchar(100) DEFAULT NULL,
  `horario` varchar(145) DEFAULT NULL,
  `tipo_lugar` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `eventos_centros_consumo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_eventos` int NOT NULL,
  `id_centros_consumo` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_eventos_centros` (`id_eventos`) USING BTREE,
  KEY `id_centros_eventos` (`id_centros_consumo`) USING BTREE,
  CONSTRAINT `eventos_centros_consumo_ibfk_1` FOREIGN KEY (`id_eventos`) REFERENCES `eventos` (`id`),
  CONSTRAINT `eventos_centros_consumo_ibfk_2` FOREIGN KEY (`id_centros_consumo`) REFERENCES `centros_consumo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `eventos_salon` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_eventos` int NOT NULL,
  `id_salon` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_eventos_salon` (`id_eventos`) USING BTREE,
  KEY `id_salon_eventos` (`id_salon`) USING BTREE,
  CONSTRAINT `eventos_salon_ibfk_1` FOREIGN KEY (`id_eventos`) REFERENCES `eventos` (`id`),
  CONSTRAINT `eventos_salon_ibfk_2` FOREIGN KEY (`id_salon`) REFERENCES `salones` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `habitaciones` (
  `id` int NOT NULL AUTO_INCREMENT,
  `imagen` varchar(255) DEFAULT NULL,
  `nombre` varchar(200) DEFAULT NULL,
  `descripcion` longtext,
  `servicios` int DEFAULT NULL,
  `preciocd` double DEFAULT NULL,
  `preciosd` double DEFAULT NULL,
  `adultos` int DEFAULT NULL,
  `ninos` int DEFAULT NULL,
  `tipo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `premio` (
  `id` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(300) DEFAULT NULL,
  `mensaje` longtext,
  `cant_monto` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `premios_usuario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `premio_id` int DEFAULT NULL,
  `usuarios_id` int DEFAULT NULL,
  `status` int DEFAULT NULL,
  `usado` int DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `fecha_usado` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `premio_id` (`premio_id`),
  KEY `fk_premios__usuarios_idx` (`usuarios_id`) USING BTREE,
  CONSTRAINT `premios_usuario_ibfk_1` FOREIGN KEY (`usuarios_id`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `premios_usuario_ibfk_2` FOREIGN KEY (`premio_id`) REFERENCES `premio` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `re_habitaciones` (
  `id` int NOT NULL AUTO_INCREMENT,
  `reserva_id` int NOT NULL,
  `habitaciones_id` int NOT NULL,
  `cantidad_s` int DEFAULT NULL,
  `cantidad_d` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_re_habitaciones_reserva_idx` (`reserva_id`),
  KEY `fk_re_habitaciones_habitaciones1_idx` (`habitaciones_id`),
  CONSTRAINT `fk_re_habitaciones_habitaciones1` FOREIGN KEY (`habitaciones_id`) REFERENCES `habitaciones` (`id`),
  CONSTRAINT `fk_re_habitaciones_reserva` FOREIGN KEY (`reserva_id`) REFERENCES `reserva` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `reserva` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fecha_i` date DEFAULT NULL,
  `fecha_e` date DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  `solicitudes` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `monto` double DEFAULT NULL,
  `ninos` int DEFAULT NULL,
  `adultos` int DEFAULT NULL,
  `hora_ll` varchar(50) DEFAULT NULL,
  `opcion_pago` varchar(100) DEFAULT NULL,
  `codigo` varchar(200) DEFAULT NULL,
  `status` int DEFAULT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  `traslado` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `apellidos` varchar(200) DEFAULT NULL,
  `nombres` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `nro_telefono` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `fecha_pago` date DEFAULT NULL,
  `banco` varchar(100) DEFAULT NULL,
  `referencia` varchar(100) DEFAULT NULL,
  `monto_transferencia` double DEFAULT NULL,
  `numero_i` varchar(100) DEFAULT NULL,
  `nacionalidad` varchar(20) DEFAULT NULL,
  `id_beneficio` int DEFAULT NULL,
  `enviado_encuesta` int DEFAULT NULL,
  `num_tarjeta` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `cvv` int DEFAULT NULL,
  `fecha_tarjeta` varchar(10) DEFAULT NULL,
  `check_terminos` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_id_beneficio` (`id_beneficio`) USING BTREE,
  CONSTRAINT `reserva_ibfk_1` FOREIGN KEY (`id_beneficio`) REFERENCES `beneficio` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `salones` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  `descripcion` longtext,
  `fecha_p` date DEFAULT NULL,
  `capacidad` int DEFAULT NULL,
  `precio` varchar(145) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `usuario_admi` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `tipo` int DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `apellido` varchar(100) DEFAULT NULL,
  `fecha` varchar(55) DEFAULT NULL,
  `sexo` varchar(45) DEFAULT NULL,
  `identificacion` varchar(100) NOT NULL,
  `nro_telefono` varchar(80) DEFAULT NULL,
  `pais` varchar(100) DEFAULT NULL,
  `estado` varchar(100) DEFAULT NULL,
  `ciudad` varchar(100) DEFAULT NULL,
  `direccion` longtext,
  `codigo_postal` int DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `contrasenia` varchar(100) DEFAULT NULL,
  `noches` int DEFAULT NULL,
  `no_leidos` int DEFAULT NULL,
  `token` varchar(15) DEFAULT NULL,
  `confirmado` int DEFAULT NULL,
  `ocupacion` varchar(220) DEFAULT NULL,
  `profesion` varchar(200) DEFAULT NULL,
  `codigo` varchar(100) DEFAULT NULL,
  `monto_total` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `beneficio` (`id`, `descripcion`, `monto`) VALUES
(4, 'Coctel de bienvenida.', 750);
INSERT INTO `beneficio` (`id`, `descripcion`, `monto`) VALUES
(5, 'Late check-out a las 6 p.m', 3600);
INSERT INTO `beneficio` (`id`, `descripcion`, `monto`) VALUES
(6, 'Early check-in', 3600);
INSERT INTO `beneficio` (`id`, `descripcion`, `monto`) VALUES
(7, 'Upgrade de la habitacion (sujeto a disponibilidad)', 3600);

INSERT INTO `centros_consumo` (`id`, `nombre`, `descripcion`, `horario`, `imagen`, `plato_especial`, `link`, `imagen2`) VALUES
(5, 'Restaurante castelo', 'La Sugerencia del Chef es un menú exquisito para el comensal que desea degustar un buen plato a una tarifa especial, sin perder la calidad ¡Todas las semana cambia, por lo que tienes la oportunidad de probar distintos sabores rodeado de un ambiente único y elegante!\r\nLa calidad y frescura del menú, está garantizada ¡Disfruta este y todos los días del buen comer, junto a nosotros!\r\n<br><br>\r\nEn el hotel RosaBela nos esforzamos cada día para seguir ofreciéndote una atención excepcional, así que no dudes en visitarnos', '6:30am - 10:00 am', '8d76ccf4673afc234651f516f6906130.jpg', 'Pasta a la Marinera', 'https://linktr.ee/rest_castelo', '7de498f3cc44f276578417571e806bf2.jpg');
INSERT INTO `centros_consumo` (`id`, `nombre`, `descripcion`, `horario`, `imagen`, `plato_especial`, `link`, `imagen2`) VALUES
(6, 'Itati', 'Un café, un trago, un té, un cóctel, todo en Itati. Con la mejor selección de rones, whisky, vodka y vinos, estamos preparados para recibirte cada semana. Aparte, contamos con las marcas mas destacada de nuestro país. ¡Ven y disfruta de cócteles increibles!', '10:00am - 11:00pm', '75712b4821a77c77eb61323c1b8dcb70.jpg', 'cocteles', 'https://linktr.ee/itatiloungebar', '9ec00bfefc74c0806ed5069f617f1e53.jpg');
INSERT INTO `centros_consumo` (`id`, `nombre`, `descripcion`, `horario`, `imagen`, `plato_especial`, `link`, `imagen2`) VALUES
(7, 'kai Pool Bar', '¡Noche a noche Kai Pool & Bar se viste de gala para hacer de tus veladas, momentos inolvidables! Promociones especiales en cervezas, ricos snacks, cócteles y muchísimo más ¡Es el momento de pasarla Increíble!. ¡Una exquisita pizza a leña siempre es mejor con una cerveza bien fría! ¡Disfruta de nuestro menú y deleita tu paladar!', 'desde las 10:00am', '8a63839b362d71fdad1127c5ade24d0d.jpg', 'Pizzas a la leña', 'https://linktr.ee/KaiPoolBar', '984b5fe3158e6614a3a75dbf361575e0.jpg');

INSERT INTO `chat` (`id`, `mensaje`, `usuarios_id`, `usuario_admi_id`, `codigo`) VALUES
(77, 'hola, quiero canjear mis premios, necesito urgente', 36, 1, 2);
INSERT INTO `chat` (`id`, `mensaje`, `usuarios_id`, `usuario_admi_id`, `codigo`) VALUES
(78, 'sdasdasd', 36, 1, 2);
INSERT INTO `chat` (`id`, `mensaje`, `usuarios_id`, `usuario_admi_id`, `codigo`) VALUES
(79, 'hola', 36, 1, 2);
INSERT INTO `chat` (`id`, `mensaje`, `usuarios_id`, `usuario_admi_id`, `codigo`) VALUES
(80, 'ereffwef', 35, 1, 1),
(81, 'holaa', 34, 1, 1),
(82, '3e3e', 34, 1, 1),
(83, 'epaa', 36, 1, 2);

INSERT INTO `chatbot` (`id`, `queries`, `replies`) VALUES
(3, 'eventos', 'Los  eventos mas proximos los puedes encontrar aqui: <a href=\'/eventos\'  target=\"_blank\" class=\"link_chatbot\">Click para ir a eventos</a> ¡Cualquier otra pregunta, estoy aqui para ayudarte!. T');
INSERT INTO `chatbot` (`id`, `queries`, `replies`) VALUES
(4, 'salones', 'Los salones que ofrecemos son los elegantes de la ciudad, por lo que nos encargaremos de que tu boda y/o fiesta sea inolvidable, por ello, nuestros salones disponibles puedes verlos aqui: <a href=\'/salones\' target=\"_blank\" class=\"link_chatbot\">Click para ir a los salones</a>');
INSERT INTO `chatbot` (`id`, `queries`, `replies`) VALUES
(7, 'quien eres', 'Me encargo de ser tu aliada en el proceso de reservas, informacion acerca de los eventos, salones o cualquier aspecto del hotel. ¡Siempre estare para ti!');
INSERT INTO `chatbot` (`id`, `queries`, `replies`) VALUES
(8, 'muchas gracias', 'Gracias por comunicarte conmigo, fue un placer haber mantenido una conversacion con usted'),
(9, 'Pasos para la reserva, reservar, reservo', 'Las reservas desde la pagina web las puedes hacer de la siguiente forma:  <br> Paso 1. Dirigite a la pagina principal <a href=\'/\' target=\"_blank\" class=\"link_chatbot\">Pagina principal</a> <br> Paso 2: Ingresa las fechas y los otros requerimientos. <br> Paso 3: Dar click en el boton \'RESERVAR AHORA\', seleccionas las habitaciones y llenas el formulario. <br> Paso 4: Indica el metodo de pago y lo realizas. <br> Paso 5: das click en el boton \'enviar reserva\' y descargas el pdf del reporte.'),
(10, 'capacidad de los salones', 'Los salones tienen distintas capacidades, que son: 400 personas el gran salon, 200 personas el salon no se que broma y asi pues, chao'),
(11, 'habitaciones', 'Las habitaciones disponibles las tenemos disponibles en la siguiente pagina: <a href=\'/habitaciones\'  target=\"_blank\" class=\"link_chatbot\">Click para ir a las habitaciones</a> ¡Cualquier otra pregunta, estoy aqui para ayudarte!'),
(12, 'restaurantes, centros.', 'Los centros de consumo disponibles en nustro hotel los puedes apreciar en la siguiente pagina: <a href=\'/centros\'  target=\"_blank\" class=\"link_chatbot\">Click para ir a los centros de consumo</a> ¡Cualquier otra pregunta, estoy aqui para ayudarte!');

INSERT INTO `chef` (`id`, `nombre`, `apellido`, `centros_consumo_id`, `imagen`, `descripcion`) VALUES
(1, 'Claudia ', 'Resplandor', 5, '2637fa2eec4cda542f461ca70552edd9.jpg', 'amante de la cocina, de los buenos hábitos y de seguir expandiendo mis conocimientos con todos los subchef a mis cargos');
INSERT INTO `chef` (`id`, `nombre`, `apellido`, `centros_consumo_id`, `imagen`, `descripcion`) VALUES
(2, 'jose ', 'albarez', 7, 'fdd70d81a10ed202ad2dbb886f1a077e.jpg', NULL);
INSERT INTO `chef` (`id`, `nombre`, `apellido`, `centros_consumo_id`, `imagen`, `descripcion`) VALUES
(3, 'prueba12', 'alvarez', 7, 'defe38be974305528a667de300179f51.jpg', NULL);
INSERT INTO `chef` (`id`, `nombre`, `apellido`, `centros_consumo_id`, `imagen`, `descripcion`) VALUES
(4, 'patricia', 'cañez', 6, 'dfc1cee40acfd29e84ecfa9e22c2cfaa.jpg', NULL);

INSERT INTO `empleados` (`id`, `nombre`, `apellido`, `cargo`, `imagen`) VALUES
(6, 'Ronald', 'Garrido', 'Gerente de contabilidad', 'd5f66356b61d91cbee5b5fd68ac7f174.jpg');
INSERT INTO `empleados` (`id`, `nombre`, `apellido`, `cargo`, `imagen`) VALUES
(7, 'Daniel', 'Suarez', 'Contralor', '77add7cf4223555403af795a75226c48.jpg');
INSERT INTO `empleados` (`id`, `nombre`, `apellido`, `cargo`, `imagen`) VALUES
(8, 'Adrian', 'Tovar', 'Gerente de sistemas', 'f67e084161007d8ff8105469cac5eaf1.jpg');

INSERT INTO `eventos` (`id`, `nombre`, `descripcion`, `imagen`, `fecha`, `horario`, `tipo_lugar`) VALUES
(13, 'Mi Sexta Boda', 'Estamos listos para recibir el 2024 por todo lo alto con el sello cinco estrellas del Rosa Bela Hotel & Convention Center!\r\n<br><br>\r\nNuestro paquete de fin de año incluye:\r\n<br><br>\r\n✨ Cóctel de bienvenida y canapés.\r\n✨ Exquisita cena de gala.\r\n✨ Guardería infantil.\r\n✨ Menú para los más pequeños.\r\n✨ Orquesta bailable de la mano de @ekocaribe.\r\n✨ Show de fuegos artificiales.\r\n✨ Uvas del tiempo.\r\n✨ Pase de piscina para el 01 de enero de 2024 con cóctel de bienvenida.\r\n✨ Consomé del día.\r\n<br><br>\r\n❗ Consulta nuestras tarifas especiales en hospedaje.\r\n<br><br>\r\n¡Reserva a los números de este post o escríbenos al privado, y pasa una velada totalmente diferente junto a nosotros, te encantará!\r\n', '1a15295c288cb01c20f1434ebe369412.jpg', '2024-03-16', '3:00pm - 11:40pm', 'Salon');
INSERT INTO `eventos` (`id`, `nombre`, `descripcion`, `imagen`, `fecha`, `horario`, `tipo_lugar`) VALUES
(14, 'Fiesta de navidad', 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.\r\n\r\nThe standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.', '492b069c69c97c396c93f807fa13c15f.jpg', '2024-03-29', '3:30 -1:40pm', 'Centro de consumo');


INSERT INTO `eventos_centros_consumo` (`id`, `id_eventos`, `id_centros_consumo`) VALUES
(4, 14, 7);


INSERT INTO `eventos_salon` (`id`, `id_eventos`, `id_salon`) VALUES
(3, 13, 4);


INSERT INTO `habitaciones` (`id`, `imagen`, `nombre`, `descripcion`, `servicios`, `preciocd`, `preciosd`, `adultos`, `ninos`, `tipo`) VALUES
(2, '347895107b07a537a604d280c867d17b.jpg', 'Deluxe doble', 'Habitación de lujo con dos camas Matrimoniales y bañera incluida. Es ideal para reservar en familia. Tiene una ocupación máxima de dos adultos y dos niños menores de 12 años, o de tres adultos. ', 2, 122, 96, 2, 2, 'deluxe');
INSERT INTO `habitaciones` (`id`, `imagen`, `nombre`, `descripcion`, `servicios`, `preciocd`, `preciosd`, `adultos`, `ninos`, `tipo`) VALUES
(3, '49b259db8835c832fab9c5df43f1a59c.jpg', 'Deluxe king', 'Habitación de lujo con cama King Size. Ideal para reservar junto a un acompañante. (pax adicional Adulto $20/ Niños $10) y tiene acceso a todos los servicios disponibles del hotel. PROMOCIÓN  $85 VALIDA PARA  UNA PERSONA SIN DESAYUNO', 1, 105, 96, 2, 1, 'deluxe');
INSERT INTO `habitaciones` (`id`, `imagen`, `nombre`, `descripcion`, `servicios`, `preciocd`, `preciosd`, `adultos`, `ninos`, `tipo`) VALUES
(4, 'c63ae85736bcb68ec65de04c65d22d0d.jpg', 'Suite doble', 'Esta suite está amoblada con dos camas Queen size y posee un cuarto de baño con bañera incluida. Tiene una ocupación máxima de tres adultos. Cuenta con todos los servicios del hotel y atención de primera.', 4, 122, 115, 2, 2, 'suite');
INSERT INTO `habitaciones` (`id`, `imagen`, `nombre`, `descripcion`, `servicios`, `preciocd`, `preciosd`, `adultos`, `ninos`, `tipo`) VALUES
(5, '1e44ac363dc199b92975a23bcbd653d5.jpg', 'Deluxe Meeting Suite', 'Suite de amplio confort, amoblada con cama King size, bañera y bar. Esta prestigiosa y distintiva habitación incluye un salón de conferencias privado, ideal para reuniones de trabajo, que cuenta con una capacidad para ocho personas.', 3, 192, 190, 2, 0, 'Deluxe');

INSERT INTO `premio` (`id`, `descripcion`, `mensaje`, `cant_monto`) VALUES
(1, 'Pool Day', '¡Felicidades! Es un placer poder avisarle que se ha ganado1 pool day para dos (2) personas. ¡Lo esperamos!', 750);
INSERT INTO `premio` (`id`, `descripcion`, `mensaje`, `cant_monto`) VALUES
(2, '1 habitacion deluxe ', '¡Felicidades! Es un placer poder avisarle que se ha ganado una (1) noche en nuestra habitacion deluxe king de cortesia para dos (2) personas. ¡Lo esperamos!', 1350);
INSERT INTO `premio` (`id`, `descripcion`, `mensaje`, `cant_monto`) VALUES
(10, 'Pool Day', '¡Felicidades! Es un placer poder avisarle que se ha ganado1 pool day para cuatro (4) personas. ¡Lo esperamos!', 3600);
INSERT INTO `premio` (`id`, `descripcion`, `mensaje`, `cant_monto`) VALUES
(11, '1 habitación wet bar', '¡Felicidades! Es un placer poder avisarle que se ha ganado una (1) noche en nuestra habitación wet bar de cortesía para dos (2) personas. ¡Lo esperamos!', 6300);

INSERT INTO `premios_usuario` (`id`, `premio_id`, `usuarios_id`, `status`, `usado`, `fecha`, `fecha_usado`) VALUES
(144, 1, 35, 0, 0, '2024-03-18', '2024-03-18');
INSERT INTO `premios_usuario` (`id`, `premio_id`, `usuarios_id`, `status`, `usado`, `fecha`, `fecha_usado`) VALUES
(145, 1, 36, 1, 1, '2024-03-18', '2024-03-22');
INSERT INTO `premios_usuario` (`id`, `premio_id`, `usuarios_id`, `status`, `usado`, `fecha`, `fecha_usado`) VALUES
(146, 2, 36, 1, 1, '2024-03-18', '2024-03-22');
INSERT INTO `premios_usuario` (`id`, `premio_id`, `usuarios_id`, `status`, `usado`, `fecha`, `fecha_usado`) VALUES
(147, 1, 37, 0, 0, '2024-03-18', '2024-03-18'),
(148, 1, 39, 1, 0, '2024-04-27', '2024-04-27'),
(149, 2, 39, 1, 0, '2024-04-28', '2024-04-28'),
(150, 10, 39, 1, 0, '2024-04-28', '2024-04-28');

INSERT INTO `re_habitaciones` (`id`, `reserva_id`, `habitaciones_id`, `cantidad_s`, `cantidad_d`) VALUES
(116, 120, 2, 0, 1);
INSERT INTO `re_habitaciones` (`id`, `reserva_id`, `habitaciones_id`, `cantidad_s`, `cantidad_d`) VALUES
(117, 121, 2, 0, 1);
INSERT INTO `re_habitaciones` (`id`, `reserva_id`, `habitaciones_id`, `cantidad_s`, `cantidad_d`) VALUES
(118, 122, 2, 0, 1);
INSERT INTO `re_habitaciones` (`id`, `reserva_id`, `habitaciones_id`, `cantidad_s`, `cantidad_d`) VALUES
(120, 124, 2, 0, 1),
(122, 126, 2, 0, 1),
(123, 127, 2, 0, 1),
(128, 132, 4, 0, 1),
(129, 133, 2, 0, 1),
(130, 134, 2, 0, 1),
(132, 136, 2, 0, 1),
(133, 137, 2, 0, 1),
(134, 138, 2, 0, 1);

INSERT INTO `reserva` (`id`, `fecha_i`, `fecha_e`, `cantidad`, `solicitudes`, `monto`, `ninos`, `adultos`, `hora_ll`, `opcion_pago`, `codigo`, `status`, `imagen`, `traslado`, `apellidos`, `nombres`, `nro_telefono`, `email`, `fecha_pago`, `banco`, `referencia`, `monto_transferencia`, `numero_i`, `nacionalidad`, `id_beneficio`, `enviado_encuesta`, `num_tarjeta`, `cvv`, `fecha_tarjeta`, `check_terminos`) VALUES
(120, '2024-03-21', '2024-03-22', 1, '', 122, 0, 1, '12:02', 'Pagar en el hotel', '4530318254874653', 3, 'ninguna', 'true', 'wwdwd', 'wewdwd', '3123123', 'emilmarpatricia4@gmail.com', '2024-01-01', 'ninguno', '0xxx', 0, '00000', 'ninguna', NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `reserva` (`id`, `fecha_i`, `fecha_e`, `cantidad`, `solicitudes`, `monto`, `ninos`, `adultos`, `hora_ll`, `opcion_pago`, `codigo`, `status`, `imagen`, `traslado`, `apellidos`, `nombres`, `nro_telefono`, `email`, `fecha_pago`, `banco`, `referencia`, `monto_transferencia`, `numero_i`, `nacionalidad`, `id_beneficio`, `enviado_encuesta`, `num_tarjeta`, `cvv`, `fecha_tarjeta`, `check_terminos`) VALUES
(121, '2024-03-20', '2024-03-21', 1, '', 122, 0, 1, '12:22', 'Transferencia', '8718057463614368', 3, '224cbee79795b1dacd72892d4991bea8.jpg', 'true', 'asdasd', 'daasdsdasd', '123123', 'emilmarpatricia66@gmail.com', '2024-03-22', 'Banco caroni', '121212', 1212, '123123', 'V', NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `reserva` (`id`, `fecha_i`, `fecha_e`, `cantidad`, `solicitudes`, `monto`, `ninos`, `adultos`, `hora_ll`, `opcion_pago`, `codigo`, `status`, `imagen`, `traslado`, `apellidos`, `nombres`, `nro_telefono`, `email`, `fecha_pago`, `banco`, `referencia`, `monto_transferencia`, `numero_i`, `nacionalidad`, `id_beneficio`, `enviado_encuesta`, `num_tarjeta`, `cvv`, `fecha_tarjeta`, `check_terminos`) VALUES
(122, '2024-03-21', '2024-03-22', 1, '', 122, 0, 1, '12:22', 'Pagar en el hotel', '1671477764904690', 3, 'ninguna', 'true', 'sdsdsd', 'sfsfsf', '12323123', 'emilmarpatricia4@gmail.com', '2024-01-01', 'ninguno', '0xxx', 0, '00000', 'ninguna', NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `reserva` (`id`, `fecha_i`, `fecha_e`, `cantidad`, `solicitudes`, `monto`, `ninos`, `adultos`, `hora_ll`, `opcion_pago`, `codigo`, `status`, `imagen`, `traslado`, `apellidos`, `nombres`, `nro_telefono`, `email`, `fecha_pago`, `banco`, `referencia`, `monto_transferencia`, `numero_i`, `nacionalidad`, `id_beneficio`, `enviado_encuesta`, `num_tarjeta`, `cvv`, `fecha_tarjeta`, `check_terminos`) VALUES
(124, '2024-03-20', '2024-03-21', 1, '', 122, 0, 1, '12:02', 'Pagar en el hotel', '1004641254924048', 3, 'ninguna', 'true', 'rerer', 'erewr', '323', 'emilmarpatricia4@gmail.com', '2024-01-01', 'ninguno', '0xxx', 0, '00000', 'ninguna', NULL, 0, NULL, NULL, NULL, NULL),
(126, '2024-03-26', '2024-03-27', 1, '', 122, 0, 1, '22:02', 'Pagar en el hotel', '9934303431554010', 3, 'ninguna', 'true', 'sdfsd', 'sfsdf', '34234', 'emilia@gmail.com', '2024-01-01', 'ninguno', '0xxx', 0, '00000', 'ninguna', NULL, 0, NULL, NULL, NULL, NULL),
(127, '2024-03-27', '2024-03-28', 1, '', 122, 0, 1, '12:22', 'Pagar en el hotel', '9121381942654282', 3, 'ninguna', 'true', 'sdsd', 'sdsd', '2313', 'emila@gmail.com', '2024-01-01', 'ninguno', '0xxx', 0, '00000', 'ninguna', NULL, 0, NULL, NULL, NULL, NULL),
(132, '2024-04-19', '2024-04-20', 1, '', 122, 0, 1, '12:02', 'Tarjeta de credito', '5988487765584331', 3, 'ninguna', 'true', 'efef', 'efef', '2323', 'emilmarpatricia4@gmail.com', '2024-01-01', 'ninguno', '0xxx', 0, '00000', 'ninguna', NULL, 0, '3232', 323, '01/12', 'true'),
(133, '2024-04-19', '2024-04-20', 1, 'ee', 122, 0, 1, '12:22', 'Transferencia', '2741395955624908', 3, '94b0c3610c92f3e5f6874b2e18af460d.jpg', 'true', 'wdwdwd', 'sdsd', '2313', 'emilia@gmail.com', '2024-04-16', 'Banco caroni', '1221', 122, '2222', 'V', NULL, 0, '1212', 0, '00/00', 'false'),
(134, '2024-04-19', '2024-04-20', 1, '', 122, 0, 1, '12:02', 'Transferencia', '2702199786444299', 3, '8e008bc5a61ca3ee5e36dd1d1a0d192d.jpg', 'true', 'erer', 'rerer', '2323', 'emilia@gmail.com', '2024-05-10', 'Banco caroni', '323', 3323, '23', 'E', NULL, 0, '1212', 0, '00/00', 'si'),
(136, '2024-04-28', '2024-04-29', 1, '', 122, 0, 1, '23:03', 'Tarjeta de credito', '5722101851674562', 1, 'ninguna', 'true', 'df', 'dfdf', '4554', 'impresionespzo@gmail.com', '2024-01-01', 'ninguno', '0xxx', 0, '00000', 'ninguna', NULL, 0, '3434', 344, '34/11', 'true'),
(137, '2024-04-28', '2024-05-01', 1, '', 366, 0, 1, '12:02', 'Tarjeta de credito', '1555689024834021', 1, 'ninguna', 'true', 'sds', 'impresionespzo@gmail', '233', 'impresionespzo@gmail.com', '2024-01-01', 'ninguno', '0xxx', 0, '00000', 'ninguna', NULL, 0, '121', 212, '01/222', 'true'),
(138, '2024-04-28', '2024-05-01', 1, '', 366, 0, 1, '12:02', 'Tarjeta de credito', '0198013216524110', 1, 'ninguna', 'true', 'sdsd', 'dsdsd', '2332', 'impresionespzo@gmail.com', '2024-01-01', 'ninguno', '0xxx', 0, '00000', 'ninguna', NULL, 0, '2112', 122, '12/22', 'true');

INSERT INTO `salones` (`id`, `nombre`, `imagen`, `descripcion`, `fecha_p`, `capacidad`, `precio`) VALUES
(4, 'Gran Salon Rosa Bela', '049a482877896843287490ac88df0053.jpg', 'Es el salón más grande que disponemos en Rosa Bela Hotel & Convention Center. Con una capacidad máxima de 400 personas, este majestuoso salón es ideal para celebrar sus eventos a lo grande. \r\n<br>\r\nEl Gran Salón Rosa Bela es versátil y lo hace ideal para celebrar bodas, quince años, fiestas corporativas o conferencias, dependiendo de lo que requiera. El que es el hogar de los mejores eventos en Ciudad Guayana tiene a su disposición todos los servicios de nuestras instalaciones.wewefwef\r\n', '2024-02-03', 600, '400');
INSERT INTO `salones` (`id`, `nombre`, `imagen`, `descripcion`, `fecha_p`, `capacidad`, `precio`) VALUES
(5, 'Salón Lisboa', '25601bdd94e78ed47a7f42e4983ffdc4.jpg', 'El Salón Lisboa es adecuado para celebrar fiestas, ocasiones únicas y cumpleaños. Posee una capacidad para albergar hasta 150 personas, en un espacio cómodo que mide 12,5 m de largo y 8,9 m de ancho.\r\n<br>\r\nSu diseño y arquitectura están pensados para brindar lujo, estilo y comodidad ante cualquier celebración. Ofrece un ambiente de armonía para acompañarle en sus celebraciones únicas, de la mano con nuestros mejores servicios.\r\n', '2024-02-03', 500, '200');
INSERT INTO `salones` (`id`, `nombre`, `imagen`, `descripcion`, `fecha_p`, `capacidad`, `precio`) VALUES
(6, 'Salon Braga', 'f5d83cfc2352fcce307ab418d0350def.jpg', 'Con capacidad para 120 personas, el Salón Braga está diseñado para albergar conferencias, recepciones y eventos corporativos para empresas. Tiene acceso a todos los servicios del hotel, entre los que destaca conectividad Wifi y atención de lujo.\r\n<br>\r\nEs uno de nuestros salones de mayor comodidad disponible para la realización de sus eventos, para lo que estamos dispuestos a adecuarlo a sus necesidades.\r\n', '2024-02-03', 150, '250');
INSERT INTO `salones` (`id`, `nombre`, `imagen`, `descripcion`, `fecha_p`, `capacidad`, `precio`) VALUES
(7, 'Salon Oporto', '1141e5f9ac4a44e389919a18a22d3c60.jpg', 'Nuestros salones Oporto, Faro y Coímbra son de capacidad máxima de 15 personas. Están diseñados para conferencias, reuniones de negocios, charlas y eventos corporativos para empresas.\r\n<br>\r\nSu diseño de construcción está pensado para brindar privacidad, seguridad y confort en cada evento que se realice.  \r\n<br>\r\nLos tres salones cuentan con conexión Wifi, servicio de Coffe Break y servicio secretarial. Son salones de estructura única entre los hoteles en Puerto Ordaz.\r\n', '2024-02-03', 50, '100'),
(8, 'Salon Faro', '8955aca0b36f7707c523c4853574036a.jpg', 'Nuestros salones Oporto, Faro y Coímbra son de capacidad máxima de 15 personas. Están diseñados para conferencias, reuniones de negocios, charlas y eventos corporativos para empresas.\r\n<br>\r\nSu diseño de construcción está pensado para brindar privacidad, seguridad y confort en cada evento que se realice.  \r\n<br>\r\nLos tres salones cuentan con conexión Wifi, servicio de Coffe Break y servicio secretarial. Son salones de estructura única entre los hoteles en Puerto Ordaz.\r\n', '2024-02-03', 15, '130'),
(9, 'Salon Coimbra', '16c729a9fc055cc9c86dfb548b3c6fc6.jpg', 'Nuestros salones Oporto, Faro y Coímbra son de capacidad máxima de 15 personas. Están diseñados para conferencias, reuniones de negocios, charlas y eventos corporativos para empresas.\r\n<br>\r\nSu diseño de construcción está pensado para brindar privacidad, seguridad y confort en cada evento que se realice.  \r\n<br>\r\nLos tres salones cuentan con conexión Wifi, servicio de Coffe Break y servicio secretarial. Son salones de estructura única entre los hoteles en Puerto Ordaz.\r\n', '2024-02-03', 15, '120');

INSERT INTO `usuario_admi` (`id`, `password`, `email`, `tipo`, `nombre`) VALUES
(1, '$2y$10$rDeiE9377n5AoBbt43VHQeeSSEdM8WRsvQq860cQYDE7s/uvokobi', 'sistemas@gmail.com', 1, 'emill');
INSERT INTO `usuario_admi` (`id`, `password`, `email`, `tipo`, `nombre`) VALUES
(6, '$2y$10$3LFmd0kKcfuu2Fd7U3PiuOPZZ.g60B91wg7s4dYUbvv3dCbeUlTxS', 'recepcion2@gmail.com', 2, 'Prueba recepcion');
INSERT INTO `usuario_admi` (`id`, `password`, `email`, `tipo`, `nombre`) VALUES
(7, '$2y$10$Qv4IStEdqymmwdDr0eDpNuCq86QRmtfZUygOhJCttrhyyOwCElFOy', 'comercializacion@gmail.com', 3, 'prueba4');
INSERT INTO `usuario_admi` (`id`, `password`, `email`, `tipo`, `nombre`) VALUES
(8, '$2y$10$v1qHGTnJRCkXtGhV90Gex..3ZzXX5KZNRY/4/HfcQ.YdEyKIhNyke', 'redes@gmail.com', 4, 'redes');

INSERT INTO `usuarios` (`id`, `nombre`, `apellido`, `fecha`, `sexo`, `identificacion`, `nro_telefono`, `pais`, `estado`, `ciudad`, `direccion`, `codigo_postal`, `email`, `contrasenia`, `noches`, `no_leidos`, `token`, `confirmado`, `ocupacion`, `profesion`, `codigo`, `monto_total`) VALUES
(34, 'ddfd', 'fdfdf', '2009-01-01', 'indefinido', '23234234', '4234234234', 'Antigua and Barbuda', 'Bolivar', 'pzp', 'yutyuty', 5434, 'impresionespzo87@gmail.com', '$2y$10$JHxOGDazrH4YuOeUFnPpSO/qGVS4vuSzpFBx41O0IME1lACVvrNRO', 0, 0, '', 0, 'erer', 'ingeniero_en_sistemas', '360634', 0);
INSERT INTO `usuarios` (`id`, `nombre`, `apellido`, `fecha`, `sexo`, `identificacion`, `nro_telefono`, `pais`, `estado`, `ciudad`, `direccion`, `codigo_postal`, `email`, `contrasenia`, `noches`, `no_leidos`, `token`, `confirmado`, `ocupacion`, `profesion`, `codigo`, `monto_total`) VALUES
(35, 'fefef', 'efefef', '2013-01-16', 'F', '234234', '5345345', 'Andorra', 'fdf', 'dfdf', 'dfdf', 324, 'emilmarpatricia56@gmail.com', '$2y$10$iKsr7xHqSsYn6XZN04r/VO.A8hSI0Uhl5K4gGvKVJ.MIRjRHYLWQy', 0, 0, '', 0, 'dfddf', 'doctor', '316235', 0);
INSERT INTO `usuarios` (`id`, `nombre`, `apellido`, `fecha`, `sexo`, `identificacion`, `nro_telefono`, `pais`, `estado`, `ciudad`, `direccion`, `codigo_postal`, `email`, `contrasenia`, `noches`, `no_leidos`, `token`, `confirmado`, `ocupacion`, `profesion`, `codigo`, `monto_total`) VALUES
(36, 'Emilmar', 'cuarez', '2014-01-28', 'F', '33213', '32313123', 'Angola', 'bilivar', 'gdgdg', 'dgddg', 2441, 'emilmarpatricia@gmail.com', '$2y$10$wekCg.QwY4QY7V9VZyys0.XbDooH3uiUpXBf627EDNiT.Pbtg3LsO', 0, 0, '', 0, 'ddv', 'abogado', '356436', 0);
INSERT INTO `usuarios` (`id`, `nombre`, `apellido`, `fecha`, `sexo`, `identificacion`, `nro_telefono`, `pais`, `estado`, `ciudad`, `direccion`, `codigo_postal`, `email`, `contrasenia`, `noches`, `no_leidos`, `token`, `confirmado`, `ocupacion`, `profesion`, `codigo`, `monto_total`) VALUES
(37, 'sdsd', 'sdaad', '2024-01-01', 'M', '1212', '2123123', 'Antarctica', 'bolivar', 'btrt', 'bdff', 232311, 'emilmarpatricia567@gmail.com', '$2y$10$HflD4d5Wp4LWCOMBNeRIceVWHUMcaTSh9pF3rdWN5iqKIugfna.T2', 0, 0, '', 0, 'sdsd', 'ingeniero_civil', '257537', 0),
(39, 'dfdf', 'dfdf', '2024-01-01', 'indefinido', '343434', '4234234234', 'Argentina', 'bpolivat', 'dfdf', 'dfdf', 674, 'impresionespzo@gmail.com', '$2y$10$p1nYt2cnpIkSJnR/RCaLEOHhE/b4OlYezeglDHa0hlYfGxLL4JJEG', 7, 0, '', 0, 'rerer', 'ingeniero_en_sistemas', '975139', 3600);


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;