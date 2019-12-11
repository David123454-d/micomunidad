-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-12-2019 a las 21:50:42
-- Versión del servidor: 10.3.16-MariaDB
-- Versión de PHP: 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `socialred`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `clave` ()  NO SQL
SELECT  aes_decrypt(contraseña, "llave") from usuario$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ELIMINAR_USUARIO` (IN `usuario` VARCHAR(50))  DELETE FROM usuario WHERE usuario=2$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_chat` (IN `pUsuario` VARCHAR(50), IN `pFecha` DATE, IN `pMensaje` VARCHAR(50))  INSERT INTO chat (Usuario, Fecha, Mensaje) values(pUsuario, pFecha, pMensaje)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_curso` (IN `cNombre` VARCHAR(50), IN `cDescripcion` VARCHAR(50), IN `cCupos` INT, IN `cDuracion` INT, IN `cHorarios` VARCHAR(50), IN `cCosto` VARCHAR(50), IN `cCertificado` ENUM('Si','No'), IN `cInstitucion` VARCHAR(50), IN `cInstructor` VARCHAR(50), IN `cLugar` INT)  INSERT INTO curso (Nombre, Descripcion, Cupos, Duracion, Horarios, Costo , Certificado, Institucion, Instructor, Id_lugar) values(cNombre, cDescripcion, cCupos, cDuracion, cHorarios, cCosto , cCertificado, cInstitucion, cInstructor, clugar)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_evento` (IN `pNombre_evento` VARCHAR(50), IN `pDescripcion` VARCHAR(50), IN `pFecha` DATE, IN `pHora_inicio` TIME, IN `pHora_finalizacion` TIME, IN `pLugar` INT, IN `pEstado` VARCHAR(50), IN `pUsuario` INT)  INSERT INTO evento (Nombre_evento, Descripcion, Fecha, Hora_inicio, Hora_finalizacion, Lugar, Estado, Usuario) values(pNombre_evento, pDescripcion, pFecha, pHora_inicio, pHora_finalizacion, pLugar, pEstado, pUsuario)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_info` (IN `Cedula` INT, IN `Nombres` VARCHAR(50), IN `Apellidos` VARCHAR(50), IN `Telefono` INT, IN `Celular` INT, IN `Usuario` VARCHAR(50), IN `Direccion` VARCHAR(50))  INSERT INTO informacion_usuario (Cedula,Nombres, Apellidos, Telefono, Celular, Direccion,Usuario) values(Cedula,Nombres, Apellidos, Telefono, Celular, Direccion,Usuario)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_inscripcion` (`Descripcion` VARCHAR(50), `Horario` VARCHAR(25), `id_curso` INT, `id_datos` INT)  INSERT INTO inscripcion (Descripcion,Horario, id_curso, id_datos) values(Descripcion,Horario, id_curso, id_datos)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `inser_usuario` (IN `pusuario` VARCHAR(50), IN `pcontraseña` VARCHAR(50))  INSERT INTO usuario (usuario, contraseña) values(pusuario , aes_encrypt(pcontraseña, "llave"))$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spCambiarEstadoInscrip` (IN `pID` INT, IN `pEstado` VARCHAR(30))  NO SQL
UPDATE inscripcion SET Estado = pEstado where id_inscripcion = pID$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spConsultaEspInscripciones` (IN `pID` INT)  NO SQL
SELECT id_inscripcion, Descripcion, Horario, id_curso, id_datos, Estado from inscripcion WHERE id_inscripcion = pID$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spConsultarCursos` ()  NO SQL
SELECT * FROM 	vwconsultarcurso$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spConsultarEspCurso` (IN `id` INT)  select c.Nombre, c.Descripcion, c.Cupos, c.Duracion, c.Horarios, c.Costo, c.Certificado, c.Institucion, c.Instructor, l.Nombre, c.Estado,c.id_curso from curso c INNER JOIN lugar l on c.Id_lugar = l.id_lugar where c.id_curso = id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spConsultarEspEvento` (IN `id` INT)  NO SQL
select * from evento where id_evento = id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spConsultarEspInfoU` (IN `cedula` INT)  NO SQL
select * from informacion_usuario where cedula = cedula$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spConsultarEspPrestamo` (IN `id` INT)  NO SQL
select * from prestamo where id_prestamo=id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spConsultarEspUsu` (IN `usu` VARCHAR(50))  NO SQL
select * from prestamo where usuario = usu$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spConsultarEvento` ()  NO SQL
select e.id_evento, e.Nombre_evento, e.Descripcion, e.Fecha, e.Hora_inicio, e.Hora_finalizacion, l.Nombre, e.Estado, u.Nombres from evento e inner join lugar l on e.Lugar = l.id_lugar INNER JOIN informacion_usuario u on u.Cedula = e.Usuario$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spConsultarEvento_2` (IN `usuario` VARCHAR(50))  NO SQL
SELECT * from evento WHERE Usuario=usuario$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spConsultarInfU` ()  NO SQL
select * from informacion_usuario$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spConsultarInscripciones` ()  SELECT * from vwConsultarInscripcion$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spConsultarInscripcionUsu` (IN `id` INT)  NO SQL
select * from inscripcion where id_datos = id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spConsultarLgPorId` (IN `id` INT)  select Nombre from lugar where id_lugar=id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spConsultarLugares` ()  NO SQL
select * from lugar$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spConsultarNmCursos` ()  NO SQL
select Nombre, id_curso from curso where Estado = 'Activo'$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spConsultarNmLugares` ()  NO SQL
select Nombre from lugar$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spConsultarNmUsers` ()  NO SQL
select Nombres, Apellidos, Cedula from informacion_usuario$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spConsultarNmUsuarios` (IN `id` INT)  NO SQL
select Nombres, Apellidos from informacion_usuario where Cedula=id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spConsultarPrestamo` ()  NO SQL
SELECT * from vwconsultarprestamo$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spConsultarPrestamo_2` (IN `usuario` VARCHAR(50))  SELECT * from prestamo where Usuario=usuario$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spConsultarRol` (IN `usu` VARCHAR(50))  NO SQL
select ui.cedula,ui.nombres,ui.apellidos,ui.telefono,ui.celular,ui.direccion,ui.estado,ui.usuario,u.rol from informacion_usuario ui, usuario u where ui.usuario = usu and u.usuario = usu$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spConsultarUsuario` ()  NO SQL
select u.usuario, u.contraseña, u.rol from usu u$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spEliminarCurso` (IN `pID` INT)  UPDATE curso SET Estado='Inactivo' where id_curso = pID$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spEliminarPrestamo` (`id_prestamo` INT(11))  update prestamo set Estado='Activo' where id_prestamo=pID$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spElminarChat` (IN `pMensaje` VARCHAR(50))  DELETE FROM chat WHERE Mensaje=pMensaje$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spElminarEvento` (IN `pNombre_evento` VARCHAR(50))  DELETE FROM evento WHERE Nombre_evento=pNombre_evento$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spElminarInfUsu` (`pCedula` INT(11))  DELETE FROM informacion_usuario WHERE Cedula=pCedula$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spInsertarPrestamo` (IN `pid_lugar` INT(11), IN `pTiempo` TIME, IN `pHSalida` TIME, IN `pFecha` DATE, IN `pDescripcion` VARCHAR(50), IN `pUsuario` VARCHAR(50))  INSERT INTO prestamo (id_lugar,HoraDeInicio, HoraDeSalida,Fecha,Descripcion,Usuario) 
values(pid_lugar,pTiempo,pHSalida,pFecha,pDescripcion,pUsuario)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spModificarCur` (IN `pNombre` VARCHAR(50), IN `pDescripcion` VARCHAR(50), IN `pCupos` INT(11), IN `pDuracion` INT(11), IN `pHorarios` VARCHAR(50), IN `pCosto` VARCHAR(50), IN `pCertificado` ENUM('Si','No'), IN `pInstitucion` VARCHAR(50), IN `pInstructor` VARCHAR(50), IN `pLugar` INT, IN `pID` INT)  UPDATE curso SET Descripcion=pDescripcion,Cupos=pCupos,Duracion=pDuracion,Horarios=pHorarios, Costo=pCosto, Certificado=pCertificado, Institucion=pInstitucion, Instructor=pInstructor, Id_lugar = pLugar WHERE id_curso = pID$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spModificarEven` (IN `id` INT, IN `pNombre_evento` VARCHAR(50), IN `pDescripcion` VARCHAR(50), IN `pFecha` DATE, IN `pHora_inicio` TIME, IN `pHora_finalizacion` TIME, IN `pLugar` INT, IN `pEstado` VARCHAR(50))  UPDATE evento SET Nombre_evento=pNombre_evento, Descripcion=pDescripcion, Fecha=pFecha, Hora_inicio=pHora_inicio, Hora_finalizacion=pHora_finalizacion, Lugar=pLugar, Estado=pEstado WHERE id_evento=id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spModificarInfU` (IN `Nombres` VARCHAR(50), IN `Apellidos` VARCHAR(50), IN `Telefono` INT(11), IN `Celular` INT(11), IN `Direccion` VARCHAR(50), IN `Usuario` VARCHAR(50), IN `pcedula` INT)  UPDATE informacion_usuario SET Nombres=Nombres,Apellidos=Apellidos,Telefono=Telefono,Celular=Celular,
Direccion=Direccion ,Usuario=Usuario WHERE Cedula=pcedula$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spModificarInscripcion` (IN `pid_inscripcion` INT(11), IN `pDescripcion` VARCHAR(50), IN `pHorario` VARCHAR(50), IN `pid_curso` INT(11), IN `pid_datos` INT(11))  UPDATE inscripcion SET Descripcion=pDescripcion,Horario=pHorario,
id_curso=pid_curso,id_datos=pid_datos WHERE id_inscripcion=pid_inscripcion$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spModificarLugar` (IN `pLu` INT)  NO SQL
update lugar SET Estado = 'Prestado' WHERE lugar.id_lugar = pLu$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spModificarLugarD` (IN `id` INT)  NO SQL
update lugar set estado = "Disponible" WHERE id_lugar = id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spModificarPrestamo` (IN `id_pres` INT, IN `id_lugar` INT, IN `tiempo` TIME, IN `HSalida` TIME, IN `fecha` DATE, IN `descripcion` VARCHAR(50), IN `usuario` VARCHAR(50), IN `estado` VARCHAR(50))  NO SQL
update prestamo set id_lugar=id_lugar,HoraDeInicio=tiempo,HoraDeSalida=HSalida,fecha=fecha,descripcion=Descripcion,Usuario=usuario,estado=Estado where id_prestamo=id_pres$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spModificarUsu` (IN `pusuario` VARCHAR(50), IN `pcontraseña` VARCHAR(50))  UPDATE usuario SET contraseña=pcontraseña WHERE usuario=pusuario$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spSolicitarPass` (IN `pUser` VARCHAR(50))  NO SQL
SELECT contraseña as Respuesta from usu WHERE usuario = pUser$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spValidar2Eventos` (IN `pUsuario` INT)  NO SQL
select if (exists(select * from evento where usuario=pUsuario and Estado="Activo" or usuario=pUsuario and Estado="EnProceso"),1,0)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spValidarDatosU` (IN `pUsu` VARCHAR(50))  NO SQL
SELECT if (EXISTS(SELECT * FROM informacion_usuario i WHERE i.Usuario = pUsu),1,0) as Respuesta$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spValidarInscripcion` (IN `pID` INT)  NO SQL
SELECT IF(EXISTS (SELECT * FROM inscripcion WHERE id_datos = pID AND Estado = 'En proceso' or id_datos = pID AND Estado = 'Activo'),1,0)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spValidarLugarCursos` (IN `Lugar` INT)  NO SQL
select if (exists(select * from curso where id_lugar = Lugar and Estado = "Activo"),1,0)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spValidarLugarD` (IN `pID` INT)  NO SQL
SELECT IF (EXISTS(SELECT * FROM lugar WHERE id_lugar = pID AND Estado = 'Prestado'),1,0)$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `chat`
--

CREATE TABLE `chat` (
  `Usuario` varchar(50) NOT NULL,
  `Fecha` date NOT NULL,
  `Mensaje` varchar(140) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `chat`
--

INSERT INTO `chat` (`Usuario`, `Fecha`, `Mensaje`) VALUES
('stellys2711@gmail.com', '2019-10-17', 'Hola :3'),
('hacuslikes@gmail.com', '2019-10-18', 'Hola :)'),
('michel@gmail.com', '2019-10-18', 'Soy la administradora');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curso`
--

CREATE TABLE `curso` (
  `id_curso` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Descripcion` varchar(50) NOT NULL,
  `Cupos` int(11) NOT NULL,
  `Duracion` int(11) NOT NULL,
  `Horarios` enum('Lunes a Viernes - Diurno','Lunes a Viernes - Tarde','Sabado - Diurno','Sabado - Tarde') NOT NULL,
  `Costo` varchar(50) DEFAULT NULL,
  `Certificado` enum('Si','No') NOT NULL,
  `Institucion` varchar(50) NOT NULL,
  `Instructor` varchar(50) NOT NULL,
  `Id_lugar` int(11) NOT NULL,
  `Estado` varchar(20) NOT NULL DEFAULT 'Activo'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `curso`
--

INSERT INTO `curso` (`id_curso`, `Nombre`, `Descripcion`, `Cupos`, `Duracion`, `Horarios`, `Costo`, `Certificado`, `Institucion`, `Instructor`, `Id_lugar`, `Estado`) VALUES
(1, 'Guitarra', 'Curso basico', 19, 13, 'Lunes a Viernes - Tarde', 'Gratis', 'Si', 'SENA', 'Arman Dolo', 2, 'Activo'),
(2, 'Computación', 'Curso basico', 19, 13, 'Lunes a Viernes - Tarde', 'Gratis', 'Si', 'SENA', 'Arman Dolo', 2, 'Activo'),
(3, 'Cocina', 'Curso de cocina para principiantes', 14, 1, 'Lunes a Viernes - Tarde', 'Gratis', 'No', 'SENA', 'Ruben Dario', 5, 'Activo'),
(4, 'Reparación de computadoras', 'Curso de reparacion basico', 19, 3, 'Lunes a Viernes - Diurno', '100000', 'No', 'SENA', 'Pedro Jimenez', 2, 'Inactivo'),
(5, 'Baile', 'Curso basico', 19, 2, 'Lunes a Viernes - Diurno', 'Gratis', 'No', 'SENA', 'John Breyner', 1, 'Activo'),
(6, 'Conduccion', 'Curso de conduccion', 10, 12, 'Lunes a Viernes - Diurno', '50000', 'Si', 'A.D.C CAR', 'Jose Contreras', 6, 'Inactivo'),
(7, 'Canto', 'Principiante', 20, 13, 'Lunes a Viernes - Diurno', 'Gratis', 'No', 'SENA', 'Lucas Prieto', 6, 'Inactivo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evento`
--

CREATE TABLE `evento` (
  `id_evento` int(11) NOT NULL,
  `Nombre_evento` varchar(50) NOT NULL,
  `Descripcion` varchar(100) NOT NULL,
  `Fecha` date NOT NULL,
  `Hora_inicio` time NOT NULL,
  `Hora_finalizacion` time NOT NULL,
  `Lugar` int(11) NOT NULL,
  `Estado` varchar(20) NOT NULL,
  `Usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `evento`
--

INSERT INTO `evento` (`id_evento`, `Nombre_evento`, `Descripcion`, `Fecha`, `Hora_inicio`, `Hora_finalizacion`, `Lugar`, `Estado`, `Usuario`) VALUES
(13, 'Jornada de vacunacion', 'vacunacion', '2019-11-16', '06:00:00', '13:00:00', 3, 'Activo', 1001053322),
(15, 'Concurso de baile', 'baila y gana 100000', '2019-11-22', '02:00:00', '06:00:00', 6, 'Cancelado', 1001053322),
(18, 'Concierto', 'concierto de musica clasica', '2019-11-21', '10:00:00', '16:00:00', 1, 'Concluido', 1022514551),
(19, 'Marchaton', 'marchar por hacer SI funcionales', '2019-12-02', '17:00:00', '18:00:00', 1, 'Activo', 12345678);

--
-- Disparadores `evento`
--
DELIMITER $$
CREATE TRIGGER `actiu` AFTER UPDATE ON `evento` FOR EACH ROW IF NEW.Estado = 'Activo' THEN
UPDATE lugar
SET lugar.Estado = "Ocupado"

WHERE new.Lugar = lugar.id_lugar;


END IF
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `ffff` AFTER UPDATE ON `evento` FOR EACH ROW IF NEW.Estado = 'Concluido' THEN
UPDATE lugar
SET lugar.Estado = "Disponible"

WHERE new.Lugar = lugar.id_lugar;


END IF
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `luge` BEFORE INSERT ON `evento` FOR EACH ROW IF NEW.Estado = 'Activo' THEN
UPDATE lugar
SET lugar.Estado = "Ocupado"

WHERE new.Lugar = lugar.id_lugar;


END IF
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `lugea` AFTER UPDATE ON `evento` FOR EACH ROW IF NEW.Estado = 'En proceso' THEN
UPDATE lugar
SET lugar.Estado = "Disponible"

WHERE new.Lugar = lugar.id_lugar;


END IF
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `lugee` AFTER UPDATE ON `evento` FOR EACH ROW IF NEW.Estado = 'Cancelado' THEN
UPDATE lugar
SET lugar.Estado = "Disponible"

WHERE new.Lugar = lugar.id_lugar;


END IF
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `ytttt` BEFORE INSERT ON `evento` FOR EACH ROW IF NEW.Estado = 'En proceso' THEN
UPDATE lugar
SET lugar.Estado = "Disponible"

WHERE new.Lugar = lugar.id_lugar;
END IF
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `informacion_usuario`
--

CREATE TABLE `informacion_usuario` (
  `Cedula` int(11) NOT NULL,
  `Nombres` varchar(50) NOT NULL,
  `Apellidos` varchar(50) NOT NULL,
  `Telefono` int(11) NOT NULL,
  `Celular` int(11) NOT NULL,
  `Direccion` varchar(50) NOT NULL,
  `Estado` varchar(50) NOT NULL DEFAULT 'Activo',
  `Usuario` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `informacion_usuario`
--

INSERT INTO `informacion_usuario` (`Cedula`, `Nombres`, `Apellidos`, `Telefono`, `Celular`, `Direccion`, `Estado`, `Usuario`) VALUES
(132, 'asd', 'asd', 123, 123, 'asd', 'Activo', 'dayana@a.a'),
(324324, 'dayanna', 'otero', 12318238, 82328377, 'adghhasdgh', 'Activo', 'dmotero12@misena.edu.co'),
(12345678, ' carolina', 'forero', 123456, 12345, 'calle', 'Activo', 'carolitaforeros@misena.edu.co'),
(51815259, 'Clara Stelly', 'Silva Gonzalez', 2902994, 32026888, 'Cra 69a # 22 - 45 Sur', 'Activo', 'stellys2711@gmail.com'),
(123456789, 'alejandro', 'munevar', 122212, 112343, 'calle 5', 'Activo', 'amunevarb@misena.edu.co'),
(1001053322, 'Dayanna', 'Otero', 25788, 2046740198, 'callle 6 sur', 'Activo', 'michel@gmail.com'),
(1001456765, 'David', 'Casallas', 22345, 123345, 'calle 7', 'Activo', 'casallas@gmail.com'),
(1022514551, 'Mariana', 'Froes', 2945262, 311524515, 'Cra 45 # 20 - 45 Sur', 'Activo', 'hacuslikes@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inscripcion`
--

CREATE TABLE `inscripcion` (
  `id_inscripcion` int(11) NOT NULL,
  `Descripcion` varchar(50) NOT NULL,
  `Horario` varchar(25) NOT NULL,
  `id_curso` int(11) NOT NULL,
  `id_datos` int(11) NOT NULL,
  `Estado` varchar(50) NOT NULL DEFAULT 'En proceso'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `inscripcion`
--

INSERT INTO `inscripcion` (`id_inscripcion`, `Descripcion`, `Horario`, `id_curso`, `id_datos`, `Estado`) VALUES
(11, 'o', 'Sabado - Diurno', 2, 1001053322, 'Activo'),
(13, 'Quiero aprender a bailar', 'Sabado - Diurno', 5, 1022514551, 'Activo'),
(14, 'nada', 'Lunes a Viernes - Tarde', 1, 12345678, 'En proceso');

--
-- Disparadores `inscripcion`
--
DELIMITER $$
CREATE TRIGGER `vjjkjfj` BEFORE UPDATE ON `inscripcion` FOR EACH ROW IF NEW.Estado = 'Activo' THEN
UPDATE curso
SET curso.Cupos = curso.Cupos -1

WHERE new.id_curso = curso.id_curso;


END IF
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lugar`
--

CREATE TABLE `lugar` (
  `id_lugar` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Direccion` varchar(50) NOT NULL,
  `Estado` varchar(50) NOT NULL DEFAULT 'Activo'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `lugar`
--

INSERT INTO `lugar` (`id_lugar`, `Nombre`, `Direccion`, `Estado`) VALUES
(1, 'Iglesia San Vicente', 'calle 56 a sur # 28-29', 'Ocupado'),
(2, 'Colegio Ciudad Bogotá', 'carrera 27 # 55 a sur # 27-85', 'Prestado'),
(3, 'Servimed IPS Tunal', 'calle 52 a sur # 27-85', 'Ocupado'),
(4, 'Tele San Vicente ', 'calle 53 b sur # 33 A - 47 sur', 'Disponible'),
(5, 'Comedor Comunitario San Vicente', 'calle 55 a sur # 32-33', 'Prestado'),
(6, 'Salon Comunal San Vicente', 'calle 53 b # 33 A 55- sur', 'Prestado'),
(7, 'Colegio Gimnasio Comercial Los Andes', 'calle 52 sur b 36 A 52', 'Disponible');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamo`
--

CREATE TABLE `prestamo` (
  `id_prestamo` int(11) NOT NULL,
  `id_lugar` int(11) NOT NULL,
  `HoraDeInicio` time NOT NULL,
  `HoraDeSalida` time NOT NULL,
  `Fecha` date NOT NULL,
  `Descripcion` varchar(50) NOT NULL,
  `Usuario` varchar(50) NOT NULL,
  `Estado` varchar(20) NOT NULL DEFAULT 'Pendiente'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `prestamo`
--

INSERT INTO `prestamo` (`id_prestamo`, `id_lugar`, `HoraDeInicio`, `HoraDeSalida`, `Fecha`, `Descripcion`, `Usuario`, `Estado`) VALUES
(17, 6, '10:00:00', '14:00:00', '2019-11-30', 'ikd', 'casallas@gmail.com', 'Activo'),
(19, 3, '12:00:00', '15:00:00', '2019-11-23', 'Actividad ', 'hacuslikes@gmail.com', 'Activo');

--
-- Disparadores `prestamo`
--
DELIMITER $$
CREATE TRIGGER `dfdfgdg` AFTER UPDATE ON `prestamo` FOR EACH ROW IF NEW.Estado = 'Concluido' THEN
UPDATE lugar
SET lugar.Estado = "Disponible"

WHERE new.id_lugar = lugar.id_lugar;
END IF
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `gggg` BEFORE INSERT ON `prestamo` FOR EACH ROW IF NEW.Estado = 'En proceso' THEN
UPDATE lugar
SET lugar.Estado = "Disponible"

WHERE new.id_lugar = lugar.id_lugar;


END IF
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `presa` AFTER UPDATE ON `prestamo` FOR EACH ROW IF NEW.Estado = 'Activo' THEN
UPDATE lugar
SET lugar.Estado = "Ocupado"

WHERE new.id_lugar = lugar.id_lugar;


END IF
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `presc` AFTER UPDATE ON `prestamo` FOR EACH ROW IF NEW.Estado = 'Cancelado' THEN
UPDATE lugar
SET lugar.Estado = "Disponible"

WHERE new.id_lugar = lugar.id_lugar;


END IF
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `presep` AFTER UPDATE ON `prestamo` FOR EACH ROW IF NEW.Estado = 'En proceso' THEN
UPDATE lugar
SET lugar.Estado = "Disponible"

WHERE new.id_lugar = lugar.id_lugar;


END IF
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `presi` BEFORE INSERT ON `prestamo` FOR EACH ROW IF NEW.Estado = 'Activo' THEN
UPDATE lugar
SET lugar.Estado = "Ocupado"

WHERE new.id_lugar = lugar.id_lugar;


END IF
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `usu`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `usu` (
`usuario` varchar(50)
,`contraseña` varbinary(50)
,`rol` enum('Administrador','Ciudadano')
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `usuario` varchar(50) NOT NULL,
  `contraseña` varchar(50) NOT NULL,
  `Rol` enum('Administrador','Ciudadano') NOT NULL DEFAULT 'Ciudadano'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`usuario`, `contraseña`, `Rol`) VALUES
('amunevarb@misena.edu.co', '|{ðò¦Sn&Tá É(œ0', 'Ciudadano'),
('carolitaforeros@misena.edu.co', '×(±úL«¢£‘0€!±Î¦', 'Ciudadano'),
('casallas@gmail.com', '«jÔM…â\0Ý³¤\\b×—ð', 'Ciudadano'),
('dayana@a.a', ';l¯Boº:së÷¯µ\0c', 'Ciudadano'),
('dmotero12@misena.edu.co', '¥*ÅÜHÌH¦÷´O„^î', 'Ciudadano'),
('hacuslikes@gmail.com', 'FÖõí¡Ô¡Sì&N', 'Ciudadano'),
('jhcastillo526@misena.edu.co', '%yF—#\"Ð,G›ÞA¯Ÿ', 'Ciudadano'),
('michel@gmail.com', '«f¨m\r™ëøyÅG', 'Administrador'),
('stellys2711@gmail.com', 'Ëøç4¿Š!üë”ZVØ¡¥', 'Ciudadano');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vwconsultarcurso`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vwconsultarcurso` (
`Nombre` varchar(50)
,`Descripcion` varchar(50)
,`Cupos` int(11)
,`Duracion` int(11)
,`Horarios` enum('Lunes a Viernes - Diurno','Lunes a Viernes - Tarde','Sabado - Diurno','Sabado - Tarde')
,`Costo` varchar(50)
,`Certificado` enum('Si','No')
,`Institucion` varchar(50)
,`Instructor` varchar(50)
,`lugar` varchar(50)
,`Estado` varchar(20)
,`id_curso` int(11)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vwconsultarevento`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vwconsultarevento` (
`id_evento` int(11)
,`NombreEvento` varchar(50)
,`Descripcion` varchar(100)
,`Fecha` date
,`Hora_inicio` time
,`Hora_finalizacion` time
,`Nombre` varchar(50)
,`Estado` varchar(20)
,`Nombres` varchar(50)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vwconsultarinscripcion`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vwconsultarinscripcion` (
`id_inscripcion` int(11)
,`Descripcion` varchar(50)
,`Horario` varchar(25)
,`Nombre` varchar(50)
,`Nombres` varchar(50)
,`Estado` varchar(50)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vwconsultarprestamo`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vwconsultarprestamo` (
`id_prestamo` int(11)
,`Nombre` varchar(50)
,`HoraDeInicio` time
,`HoraDeSalida` time
,`Fecha` date
,`Descripcion` varchar(50)
,`Usuario` varchar(50)
,`Estado` varchar(20)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vwconsultarusuario`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vwconsultarusuario` (
`usuario` varchar(50)
,`contraseña` varchar(50)
,`Rol` enum('Administrador','Ciudadano')
);

-- --------------------------------------------------------

--
-- Estructura para la vista `usu`
--
DROP TABLE IF EXISTS `usu`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `usu`  AS  select `usuario`.`usuario` AS `usuario`,aes_decrypt(`usuario`.`contraseña`,'llave') AS `contraseña`,`usuario`.`Rol` AS `rol` from `usuario` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vwconsultarcurso`
--
DROP TABLE IF EXISTS `vwconsultarcurso`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vwconsultarcurso`  AS  select `c`.`Nombre` AS `Nombre`,`c`.`Descripcion` AS `Descripcion`,`c`.`Cupos` AS `Cupos`,`c`.`Duracion` AS `Duracion`,`c`.`Horarios` AS `Horarios`,`c`.`Costo` AS `Costo`,`c`.`Certificado` AS `Certificado`,`c`.`Institucion` AS `Institucion`,`c`.`Instructor` AS `Instructor`,`l`.`Nombre` AS `lugar`,`c`.`Estado` AS `Estado`,`c`.`id_curso` AS `id_curso` from (`curso` `c` join `lugar` `l` on(`c`.`Id_lugar` = `l`.`id_lugar`)) where `c`.`Estado` = 'Activo' ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vwconsultarevento`
--
DROP TABLE IF EXISTS `vwconsultarevento`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vwconsultarevento`  AS  select `e`.`id_evento` AS `id_evento`,`e`.`Nombre_evento` AS `NombreEvento`,`e`.`Descripcion` AS `Descripcion`,`e`.`Fecha` AS `Fecha`,`e`.`Hora_inicio` AS `Hora_inicio`,`e`.`Hora_finalizacion` AS `Hora_finalizacion`,`l`.`Nombre` AS `Nombre`,`e`.`Estado` AS `Estado`,`i`.`Nombres` AS `Nombres` from ((`evento` `e` join `lugar` `l` on(`e`.`Lugar` = `l`.`id_lugar`)) join `informacion_usuario` `i` on(`e`.`Usuario` = `i`.`Cedula`)) where `e`.`Estado` = 'Activo' ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vwconsultarinscripcion`
--
DROP TABLE IF EXISTS `vwconsultarinscripcion`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vwconsultarinscripcion`  AS  select `ins`.`id_inscripcion` AS `id_inscripcion`,`ins`.`Descripcion` AS `Descripcion`,`ins`.`Horario` AS `Horario`,`c`.`Nombre` AS `Nombre`,`i`.`Nombres` AS `Nombres`,`ins`.`Estado` AS `Estado` from ((`inscripcion` `ins` join `curso` `c` on(`c`.`id_curso` = `ins`.`id_curso`)) join `informacion_usuario` `i` on(`i`.`Cedula` = `ins`.`id_datos`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vwconsultarprestamo`
--
DROP TABLE IF EXISTS `vwconsultarprestamo`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vwconsultarprestamo`  AS  select `p`.`id_prestamo` AS `id_prestamo`,`l`.`Nombre` AS `Nombre`,`p`.`HoraDeInicio` AS `HoraDeInicio`,`p`.`HoraDeSalida` AS `HoraDeSalida`,`p`.`Fecha` AS `Fecha`,`p`.`Descripcion` AS `Descripcion`,`p`.`Usuario` AS `Usuario`,`p`.`Estado` AS `Estado` from (`prestamo` `p` join `lugar` `l` on(`p`.`id_lugar` = `l`.`id_lugar`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vwconsultarusuario`
--
DROP TABLE IF EXISTS `vwconsultarusuario`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vwconsultarusuario`  AS  select `usuario`.`usuario` AS `usuario`,`usuario`.`contraseña` AS `contraseña`,`usuario`.`Rol` AS `Rol` from `usuario` ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `chat`
--
ALTER TABLE `chat`
  ADD KEY `FK_chat` (`Usuario`);

--
-- Indices de la tabla `curso`
--
ALTER TABLE `curso`
  ADD PRIMARY KEY (`id_curso`),
  ADD KEY `Lugar` (`Id_lugar`);

--
-- Indices de la tabla `evento`
--
ALTER TABLE `evento`
  ADD PRIMARY KEY (`id_evento`),
  ADD KEY `FK_LugarEvento` (`Usuario`),
  ADD KEY `FK_LugarEvento_2` (`Lugar`);

--
-- Indices de la tabla `informacion_usuario`
--
ALTER TABLE `informacion_usuario`
  ADD PRIMARY KEY (`Cedula`),
  ADD KEY `FK_Usuario` (`Usuario`);

--
-- Indices de la tabla `inscripcion`
--
ALTER TABLE `inscripcion`
  ADD PRIMARY KEY (`id_inscripcion`),
  ADD KEY `FK_UserInscripcion` (`id_datos`),
  ADD KEY `FK_CursoInscripcion` (`id_curso`);

--
-- Indices de la tabla `lugar`
--
ALTER TABLE `lugar`
  ADD PRIMARY KEY (`id_lugar`);

--
-- Indices de la tabla `prestamo`
--
ALTER TABLE `prestamo`
  ADD PRIMARY KEY (`id_prestamo`),
  ADD KEY `FK_Lugar` (`id_lugar`),
  ADD KEY `FK_UserPrestamo` (`Usuario`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `curso`
--
ALTER TABLE `curso`
  MODIFY `id_curso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `evento`
--
ALTER TABLE `evento`
  MODIFY `id_evento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `inscripcion`
--
ALTER TABLE `inscripcion`
  MODIFY `id_inscripcion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `lugar`
--
ALTER TABLE `lugar`
  MODIFY `id_lugar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `prestamo`
--
ALTER TABLE `prestamo`
  MODIFY `id_prestamo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `chat`
--
ALTER TABLE `chat`
  ADD CONSTRAINT `FK_chat` FOREIGN KEY (`Usuario`) REFERENCES `informacion_usuario` (`Usuario`);

--
-- Filtros para la tabla `curso`
--
ALTER TABLE `curso`
  ADD CONSTRAINT `Lugar` FOREIGN KEY (`Id_lugar`) REFERENCES `lugar` (`id_lugar`);

--
-- Filtros para la tabla `evento`
--
ALTER TABLE `evento`
  ADD CONSTRAINT `FK_LugarEvento_2` FOREIGN KEY (`Lugar`) REFERENCES `lugar` (`id_lugar`),
  ADD CONSTRAINT `FK_UserEvento` FOREIGN KEY (`Usuario`) REFERENCES `informacion_usuario` (`Cedula`);

--
-- Filtros para la tabla `informacion_usuario`
--
ALTER TABLE `informacion_usuario`
  ADD CONSTRAINT `FK_Usuario` FOREIGN KEY (`Usuario`) REFERENCES `usuario` (`usuario`);

--
-- Filtros para la tabla `inscripcion`
--
ALTER TABLE `inscripcion`
  ADD CONSTRAINT `FK_CursoInscripcion` FOREIGN KEY (`id_curso`) REFERENCES `curso` (`id_curso`),
  ADD CONSTRAINT `FK_UserInscripcion` FOREIGN KEY (`id_datos`) REFERENCES `informacion_usuario` (`Cedula`);

--
-- Filtros para la tabla `prestamo`
--
ALTER TABLE `prestamo`
  ADD CONSTRAINT `FK_Lugar` FOREIGN KEY (`id_lugar`) REFERENCES `lugar` (`id_lugar`),
  ADD CONSTRAINT `FK_UserPrestamo` FOREIGN KEY (`Usuario`) REFERENCES `informacion_usuario` (`Usuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
