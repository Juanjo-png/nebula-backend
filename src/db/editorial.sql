-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-12-2024 a las 20:25:16
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `editorial`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `avances`
--

CREATE TABLE `avances` (
  `id` int(11) NOT NULL,
  `id_libro` int(11) NOT NULL,
  `imagen` varchar(200) NOT NULL,
  `pagina` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `avances`
--

INSERT INTO `avances` (`id`, `id_libro`, `imagen`, `pagina`) VALUES
(1, 2, '../../../assets/img/libros/manga/Chainsaw Man/adelanto/1/1.jpg', 1),
(2, 2, '../../../assets/img/libros/manga/Chainsaw Man/adelanto/1/2.jpg', 2),
(3, 2, '../../../assets/img/libros/manga/Chainsaw Man/adelanto/1/3.jpg', 3),
(4, 2, '../../../assets/img/libros/manga/Chainsaw Man/adelanto/1/4.jpg', 4),
(5, 2, '../../../assets/img/libros/manga/Chainsaw Man/adelanto/1/5.jpg', 5),
(6, 2, '../../../assets/img/libros/manga/Chainsaw Man/adelanto/1/6.jpg', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `nombre`) VALUES
(1, 'Comic Europeo'),
(2, 'Manga'),
(3, 'Comic Estadounidense'),
(4, 'Libros Ilustrados');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `envios`
--

CREATE TABLE `envios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(500) NOT NULL,
  `productos` varchar(500) NOT NULL,
  `direccion` varchar(500) NOT NULL,
  `usuario` int(11) NOT NULL,
  `estado` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `envios`
--

INSERT INTO `envios` (`id`, `nombre`, `productos`, `direccion`, `usuario`, `estado`) VALUES
(10, '3811629339', '[{\"id\":4,\"titulo\":\"CHAINSAW MAN 3\\r\\n\",\"precio\":9,\"portada\":\"../../../assets/img/libros/manga/Chainsaw Man/3-1.jpg\",\"cantidad\":2},{\"id\":17,\"titulo\":\"Spiderman 3\\r\\n\\r\\n\",\"precio\":9,\"portada\":\"../../../assets/img/libros/comic estaodunidense/Spiderman/3-1.jpg\",\"cantidad\":1}]', 'Calle Falsa 123', 22, 'Cancelado'),
(12, '3227167914', '[{\"id\":4,\"titulo\":\"CHAINSAW MAN 3\\r\\n\",\"precio\":9,\"portada\":\"../../../assets/img/libros/manga/Chainsaw Man/3-1.jpg\",\"cantidad\":3}]', 'Calle Falsa 123', 22, 'Cancelado'),
(13, '6704906691', '[{\"id\":9,\"titulo\":\"JUJUTSU KAISEN 3\\r\\n\\r\\n\",\"precio\":9,\"portada\":\"../../../assets/img/libros/manga/Jujutsu Kaisen/3-1.jpg\",\"cantidad\":37},{\"id\":2,\"titulo\":\"CHAINSAW MAN 1 \\r\\n\",\"precio\":9,\"portada\":\"../../../assets/img/libros/manga/Chainsaw Man/1-1.jpg\",\"cantidad\":1},{\"id\":8,\"titulo\":\"JUJUTSU KAISEN 2\\r\\n\\r\\n\",\"precio\":9,\"portada\":\"../../../assets/img/libros/manga/Jujutsu Kaisen/2-1.jpg\",\"cantidad\":1}]', '', 22, 'Cancelado'),
(20, '1842608224', '[{\"id\":7,\"titulo\":\"JUJUTSU KAISEN 1 \",\"precio\":9,\"portada\":\"../../../assets/img/libros/manga/Jujutsu Kaisen/1-1.jpg\",\"cantidad\":2},{\"id\":26,\"titulo\":\"GRIS. ARTBOOK\",\"precio\":35.5,\"portada\":\"../../../assets/img/libros/ilustrados/gris artbook/1-1.jpg\",\"cantidad\":1}]', 'Mi casa', 22, 'Enviado'),
(22, '9352555139', '[{\"id\":5,\"titulo\":\"CHAINSAW MAN 4\\r\\n\",\"precio\":9,\"portada\":\"../../../assets/img/libros/manga/Chainsaw Man/4-1.jpg\",\"cantidad\":2},{\"id\":16,\"titulo\":\"Spiderman 2\\r\\n\\r\\n\",\"precio\":9.05,\"portada\":\"../../../assets/img/libros/comic estaodunidense/Spiderman/2-1.jpg\",\"cantidad\":1}]', 'Cordoba', 22, 'Enviado'),
(23, '1372846814', '[{\"id\":9,\"titulo\":\"JUJUTSU KAISEN 3\\r\\n\\r\\n\",\"precio\":9,\"portada\":\"../../../assets/img/libros/manga/Jujutsu Kaisen/3-1.jpg\",\"cantidad\":2},{\"id\":4,\"titulo\":\"CHAINSAW MAN 3\\r\\n\",\"precio\":9,\"portada\":\"../../../assets/img/libros/manga/Chainsaw Man/3-1.jpg\",\"cantidad\":2}]', 'Mi casa', 22, 'Cancelado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `etiquetas`
--

CREATE TABLE `etiquetas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `etiquetas`
--

INSERT INTO `etiquetas` (`id`, `nombre`) VALUES
(1, '#Deportes'),
(2, '#Videojuegos'),
(3, '#Acción'),
(4, '#Drama'),
(5, '#Suspense'),
(6, '#Asesinos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros`
--

CREATE TABLE `libros` (
  `id` int(11) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `categoria` int(11) NOT NULL,
  `etiqueta` int(11) NOT NULL,
  `precio` double NOT NULL,
  `ISBN` varchar(100) NOT NULL,
  `formato` varchar(100) NOT NULL,
  `paginas` int(11) NOT NULL,
  `color` varchar(50) NOT NULL,
  `autor` varchar(100) NOT NULL,
  `sinopsis` varchar(500) NOT NULL,
  `serie` int(11) NOT NULL,
  `portada` varchar(500) NOT NULL,
  `fechaPublicacion` varchar(20) NOT NULL DEFAULT current_timestamp(),
  `avance` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `libros`
--

INSERT INTO `libros` (`id`, `titulo`, `categoria`, `etiqueta`, `precio`, `ISBN`, `formato`, `paginas`, `color`, `autor`, `sinopsis`, `serie`, `portada`, `fechaPublicacion`, `avance`) VALUES
(2, 'CHAINSAW MAN 1 \r\n', 2, 2, 9, '978-84-679-4115-9\r\n', 'Rústica con sobrecubierta\r\n', 192, 'B/N', 'Tatsuki Fujimoto\r\n', '¡EL NUEVO Y ESPERADÍSIMO TRABAJO DEL AUTOR DE FIRE PUNCH!\n\nDenji es un chico sin un duro que se deja la piel trabajando como Devil Hunter junto a su perro demoníaco Pochita para resarcir una deuda astronómica, pero entonces... ¡¡una sangrienta traición da un giro radical a su miserable vida!!', 1, '../../../assets/img/libros/manga/Chainsaw Man/1-1.jpg', '2024-11-25 19:33:53', 1),
(3, 'CHAINSAW MAN 2\r\n', 2, 3, 9, '978-84-679-4262-0\r\n', 'Rústica con sobrecubierta\r\n', 192, 'B/N', 'Tatsuki Fujimoto\r\n', 'APARECE UN NUEVO ENEMIGO, EL DEMONIO PISTOLA!\r\n\r\n \r\n\r\nMotivado por la obsesión de sobar unas buenas peras, Denji lucha a muerte contra el Demonio Murciélago. ¿Conseguirá su objetivo tras la conclusión de la batalla? Además entra en acción un nuevo enemigo conocido como el Demonio Pistola. Según Makima, se dice que es el mayor enemigo de la humanidad y todos los Devil Hunters andan tras él...', 1, '../../../assets/img/libros/manga/Chainsaw Man/2-1.jpg', '2024-11-25 19:33:53', 0),
(4, 'CHAINSAW MAN 3\r\n', 2, 3, 9, '978-84-679-4351-1\r\n', 'Rústica con sobrecubierta\r\n', 192, 'B/N', 'Tatsuki Fujimoto\r\n', '¡EL DEMONIO ETERNIDAD EXIGE LA MUERTE DE DENJI!\r\n\r\n\r\n¡Un demonio misterioso encierra a los miembros del Departamento especial 4 y para liberar al resto pide la muerte de Denji! Al verse acorralados, las diferencias no tardan en surgir dentro del grupo. Llegados a una situación límite, Denji idea un plan infernal para salir de esta y hacerse con su anhelado beso… ¡Da comienzo una lucha encarnizada en torno a nuestro protagonista medio humano, medio demonio!', 1, '../../../assets/img/libros/manga/Chainsaw Man/3-1.jpg', '2024-11-25 19:33:53', 0),
(5, 'CHAINSAW MAN 4\r\n', 2, 3, 9, '978-84-679-4417-4\r\n', 'Rústica con sobrecubierta\r\n', 192, 'B/N', 'Tatsuki Fujimoto\r\n', '¡APARECEN NUEVOS ENEMIGOS QUE BUSCAN ARREBATARLE EL CORAZÓN A DENJI!\n\nHimeno le da un beso a Denji como premio por haberlos sacado del hotel, pero va tan borracha que acaba vomitándole encima… Poco después, Makima y el resto del Departamento Especial 4 caen víctimas de una emboscada. Resulta que un misterioso espadachín y una extraña joven se presentan ante Denji con la intención de arrebatarle el corazón a petición del Demonio Pistola. ¡¿Dará Denji un paso adelante en medio de toda esta locura', 1, '../../../assets/img/libros/manga/Chainsaw Man/4-1.jpg', '2024-12-25 19:33:53', 0),
(6, 'CHAINSAW MAN 5\r\n', 2, 3, 9, '978-84-679-4509-6\r\n', 'Rústica con sobrecubierta\r\n', 192, 'B/N', 'Tatsuki Fujimoto\r\n', '¡MOTOSIERRA CONTRA KATANA! ¿CÓMO TERMINARÁ ESTA BATALLA?\r\n\r\nAki se encuentra frente a frente con el demonio que controlaba Himeno. ¡¿Qué le pasa por la mente a este hombre consumido por las ansias de venganza...?!\r\n\r\nPor otro lado, ¡¡Denji pelea de nuevo contra Samurai Sword!!', 1, '../../../assets/img/libros/manga/Chainsaw Man/5-1.jpg', '2024-11-25 19:33:53', 0),
(7, 'JUJUTSU KAISEN 1 ', 2, 3, 9, '978-84-679-6111-9', 'Rústica con sobrecubierta\r\n', 192, 'B/N', 'Gege Akutami', '¡LLEGA JUJUTSU KAISEN, EL SHÔNEN QUE ESTÁ CAUSANDO FUROR EN JAPÓN!\r\n\r\nYûji Itadori es un estudiante con unas habilidades físicas excepcionales. Todos los días, como rutina, va al hospital a visitar a su abuelo enfermo y decide apuntarse al club de ocultismo del instituto para no dar un palo al agua... Sin embargo, un buen día el sello del talismán que se hallaba escondido en su instituto se rompe, y comienzan a aparecer unos monstruos. Ante este giro de los acontecimientos, Itadori decide adentr', 2, '../../../assets/img/libros/manga/Jujutsu Kaisen/1-1.jpg', '2024-11-27 19:33:53', 0),
(8, 'JUJUTSU KAISEN 2\r\n\r\n', 2, 3, 9, '978-84-679-6112-6\r\n', 'Rústica con sobrecubierta\r\n', 192, 'B/N', 'Gege Akutami', '¡UNA MALDICIÓN PONE AL GRUPO DE ITADORI CONTRA LAS CUERDAS!\r\n\r\nUn feto maldito ha aparecido en el interior de un reformatorio y, para poder rescatar a las personas atrapadas en el interior, ¡envían a Itadori y a sus dos compañeros de primer año del instituto! Pero entonces el feto maldito les ataca y se transforma en un espíritu maldito de categoría especial, con lo que el grupo entero corre grave peligro... ¡¿Conseguirá Itadori, tras intercambiarse con Sukuna, derrotar al espíritu maldito…?!', 2, '../../../assets/img/libros/manga/Jujutsu Kaisen/2-1.jpg', '2024-11-28 19:33:53', 0),
(9, 'JUJUTSU KAISEN 3\r\n\r\n', 2, 3, 9, '978-84-679-6113-3', 'Rústica con sobrecubierta\r\n', 192, 'B/N', 'Gege Akutami', 'ITADORI TIENE UN NUEVO MENTOR, Y DEBE ENFRENTARSE A UN ESPÍRITU MALDITO…\r\n\r\n¡Aoi Tôdô y Mai Zen’in, dos estudiantes del Instituto de Hechicería de Kyôto, han aparecido frente a Fushiguro y Kugisaki! Y a Fushiguro le va a tocar responder a la pregunta de Tôdô sobre cuál es su tipo de mujer preferida. Por su parte, Itadori, quien está entrenando para mejorar en combate, se dirige hacia el lugar donde ha habido un incidente… ¡con un espíritu maldito que ha despertado!', 2, '../../../assets/img/libros/manga/Jujutsu Kaisen/3-1.jpg', '2024-11-25 19:33:53', 0),
(15, 'Spiderman 1\r\n\r\n', 3, 5, 9, '978-84-679-6113-3', 'Rústica con sobrecubierta\r\n', 192, 'B/N', 'Gege Akutami', 'ITADORI TIENE UN NUEVO MENTOR, Y DEBE ENFRENTARSE A UN ESPÍRITU MALDITO…\r\n\r\n¡Aoi Tôdô y Mai Zen’in, dos estudiantes del Instituto de Hechicería de Kyôto, han aparecido frente a Fushiguro y Kugisaki! Y a Fushiguro le va a tocar responder a la pregunta de Tôdô sobre cuál es su tipo de mujer preferida. Por su parte, Itadori, quien está entrenando para mejorar en combate, se dirige hacia el lugar donde ha habido un incidente… ¡con un espíritu maldito que ha despertado!', 3, '../../../assets/img/libros/comic estaodunidense/Spiderman/1-1.jpg', '2024-11-25 19:33:53', 0),
(16, 'Spiderman 2\r\n\r\n', 3, 4, 9.05, '978-84-679-6113-3', 'Rústica con sobrecubierta\r\n', 192, 'B/N', 'Gege Akutami', 'ITADORI TIENE UN NUEVO MENTOR, Y DEBE ENFRENTARSE A UN ESPÍRITU MALDITO…\r\n\r\n¡Aoi Tôdô y Mai Zen’in, dos estudiantes del Instituto de Hechicería de Kyôto, han aparecido frente a Fushiguro y Kugisaki! Y a Fushiguro le va a tocar responder a la pregunta de Tôdô sobre cuál es su tipo de mujer preferida. Por su parte, Itadori, quien está entrenando para mejorar en combate, se dirige hacia el lugar donde ha habido un incidente… ¡con un espíritu maldito que ha despertado!', 3, '../../../assets/img/libros/comic estaodunidense/Spiderman/2-1.jpg', '2024-11-25 19:33:53', 0),
(17, 'Spiderman 3\r\n\r\n', 3, 5, 9, '978-84-679-6113-3', 'Rústica con sobrecubierta\r\n', 192, 'B/N', 'Gege Akutami', 'ITADORI TIENE UN NUEVO MENTOR, Y DEBE ENFRENTARSE A UN ESPÍRITU MALDITO…\r\n\r\n¡Aoi Tôdô y Mai Zen’in, dos estudiantes del Instituto de Hechicería de Kyôto, han aparecido frente a Fushiguro y Kugisaki! Y a Fushiguro le va a tocar responder a la pregunta de Tôdô sobre cuál es su tipo de mujer preferida. Por su parte, Itadori, quien está entrenando para mejorar en combate, se dirige hacia el lugar donde ha habido un incidente… ¡con un espíritu maldito que ha despertado!', 3, '../../../assets/img/libros/comic estaodunidense/Spiderman/3-1.jpg', '2024-11-25 19:33:53', 0),
(18, 'Spiderman 4\r\n\r\n', 3, 5, 9, '978-84-679-6113-3', 'Rústica con sobrecubierta\r\n', 192, 'B/N', 'Gege Akutami', 'ITADORI TIENE UN NUEVO MENTOR, Y DEBE ENFRENTARSE A UN ESPÍRITU MALDITO…\r\n\r\n¡Aoi Tôdô y Mai Zen’in, dos estudiantes del Instituto de Hechicería de Kyôto, han aparecido frente a Fushiguro y Kugisaki! Y a Fushiguro le va a tocar responder a la pregunta de Tôdô sobre cuál es su tipo de mujer preferida. Por su parte, Itadori, quien está entrenando para mejorar en combate, se dirige hacia el lugar donde ha habido un incidente… ¡con un espíritu maldito que ha despertado!', 3, '../../../assets/img/libros/comic estaodunidense/Spiderman/4-1.jpg', '2024-11-25 19:33:53', 0),
(26, 'GRIS. ARTBOOK', 4, 4, 35.5, '978-84-679-4027-5', 'Cartoné', 176, 'Color', 'Conrad Roset', 'EL LIBRO DE ARTE DE CONRAD ROSET DE UNO DE LOS VIDEOJUEGOS DEL AÑO  Gris, el videojuego diseñado por Conrad Roset y su equipo de Nomada Studio, ha sido una de las sensaciones de la escena indie del año. Su precioso diseño de personajes y niveles, que bebe del imaginario del arte del autor barcelonés, le ha valido ocho de los principales galardones de los Premios Nacionales del Videojuego Gamelab.  Norma Editorial y Nómada Studio te invitan a experimentar el proceso creativo que llevó a la concep', 5, '../../../assets/img/libros/ilustrados/gris artbook/1-1.jpg', '2024-11-25 19:33:53', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `noticias`
--

CREATE TABLE `noticias` (
  `id` int(11) NOT NULL,
  `titulo` mediumtext NOT NULL,
  `contenido` mediumtext NOT NULL,
  `fecha` varchar(200) NOT NULL,
  `autor` varchar(50) NOT NULL,
  `miniatura` varchar(500) NOT NULL,
  `extracto` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `noticias`
--

INSERT INTO `noticias` (`id`, `titulo`, `contenido`, `fecha`, `autor`, `miniatura`, `extracto`) VALUES
(1, 'Frieren Art Works: El arte de Frieren\r\n', '<h1>Frieren Art Works: El arte de Frieren</h1>\n\n<p>Con más de 22 millones de copias vendidas en todo el mundo, una aclamada serie de animación producida por Madhouse y diversos laureles a sus espaldas, como el primer premio de los 69 Shogakukan Manga Awards, el manga Frieren sigue cosechando éxitos y demostrando ser un manga que se aloja en el corazón de sus lectores.</p>\n    \n<p>Desde Norma Editorial seguimos apostando por esta obra tan melancólica y fantástica y es por ello que desde este mes de diciembre podemos disfrutar de su libro de arte oficial, <strong>Frieren Art Works</strong>.</p>\n\n<div class=\"image-container\">        <img src=\"https://www.normaeditorial.com/upload/media/albumes/0001/34/thumb_33439_albumes_big.jpeg\" alt=\"Portada de Frieren Art Works\">\n</div>\n\n<p>Desde que Frieren nos hizo pensar en qué pasó con esos héroes que, tras acabar con el mal, comieron perdices y fueron felices, hemos degustado un total de 12 tomos de una historia que entremezcla a la perfección la fantasía más épica con la introspección más delicada, con una protagonista que, pese a ser parca en palabras y sentimientos, busca entender el significado de la vida en un viaje que la lleva a recorrer el mundo para reencontrarse con el pasado.</p>\n\n<p>Mientras conoce nuevos compañeros y se enfrenta a nuevos peligros, también se cuestiona la fugacidad de la vida y la importancia de ser consciente del paso del tiempo y de disfrutar el momento. Y aunque desconocemos cuál será el desenlace de su historia, sí tenemos claro que podemos atesorarla con este increíble artbook que viene para presidir nuestras estanterías.</p>\n\n    <p>Frieren Art Works ofrece más de 100 páginas repletas de ilustraciones, bocetos e incluso páginas originales a color que se pudieron disfrutar en su serialización original en Japón, así como una interesante entrevista a Tsukasa Abe para conocerle en profundidad, todo exquisitamente presentado en una edición que recrea fielmente la japonesa, para poder disfrutar desde la primera a la última página de una obra que destila magia y belleza en cada trazo.</p>\n\n<p class=\"quote\">\"Un arte que destila magia y belleza en cada trazo.\"</p>', '15 de noviembre de 2024', 'Juanjo', 'https://es.web.img3.acsta.net/img/ba/12/ba1235b56e50944b0c8efa97f09106f0.jpg', 'Con más de 22 millones de copias vendidas en todo el mundo, una aclamada serie de animación producida por Madhouse y diversos laureles a sus espaldas, como el primer premio de los 69 Shogakukan Manga Awards, el manga Frieren sigue cosechando éxitos y demostrando ser un manga que se aloja en el corazón de sus lectores.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `localizator` varchar(21) NOT NULL,
  `stripeId` varchar(255) DEFAULT NULL,
  `status` enum('success','fail','wait') DEFAULT 'wait',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `orders`
--

INSERT INTO `orders` (`id`, `name`, `amount`, `localizator`, `stripeId`, `status`, `created_at`, `updated_at`) VALUES
(4, 'Test Order', 18.10, 'NupUbTmhnHGhxkPIdNifu', NULL, 'wait', '2024-11-16 12:23:49', '2024-11-16 12:23:49'),
(15, 'Test Order', 27.05, 'j5vhxRPwqa0emK1o2foV8', 'pi_3QLpddLB0eLe51x91v9RCDYD', 'success', '2024-11-16 17:17:59', '2024-11-16 17:18:24'),
(16, 'Test Order', 36.10, 'jeYXDl_UDs5nHw9J4HvyX', 'pi_3QLqWZLB0eLe51x90Ws3ajcg', 'success', '2024-11-16 18:14:55', '2024-11-16 18:15:09'),
(17, 'Test Order', 36.10, 'MujCbnWU8Lo5w51lwO4Vq', NULL, 'wait', '2024-11-16 18:30:59', '2024-11-16 18:30:59'),
(18, 'Test Order', 27.10, 'BZ2HIX7hpDwT0thNaBfte', 'pi_3QLqn8LB0eLe51x91VAMzoko', 'success', '2024-11-16 18:31:35', '2024-11-16 18:42:46'),
(19, 'Test Order', 36.10, 'eqvo3wIvHhxqmlJ72G5GQ', NULL, 'wait', '2024-11-16 18:48:25', '2024-11-16 18:48:25'),
(20, 'Test Order', 27.10, 'Q60HnwO-AKyPUfM4rbpgd', 'pi_3QM7ZbLB0eLe51x91zzyoxWY', 'success', '2024-11-17 12:18:41', '2024-11-17 12:27:23'),
(21, 'Test Order', 80.00, 'byi9WmKcjJgEs3W1Kzt4j', 'pi_3QMacjLB0eLe51x90NvFba5Q', 'success', '2024-11-18 19:28:17', '2024-11-18 19:28:32'),
(22, 'Test Order', 80.00, '9t--lujpyaH6SCj6Yg3uj', 'pi_3QMahELB0eLe51x90Bhzc6RW', 'success', '2024-11-18 19:33:01', '2024-11-18 19:33:11'),
(23, 'Test Order', 80.00, '9KZ3i7-i0erIfJMqSmjAe', 'pi_3QMakULB0eLe51x90tidwlmf', 'success', '2024-11-18 19:36:22', '2024-11-18 19:36:33'),
(24, 'Test Order', 80.00, 'YRGsmKzK6EjFhM5lXNHo5', 'pi_3QMalHLB0eLe51x91vfYRZpS', 'success', '2024-11-18 19:37:13', '2024-11-18 19:37:23'),
(25, 'Test Order', 80.00, 'CcNcU0floVaZd3wriGTLs', 'pi_3QMalrLB0eLe51x90lCJbuGh', 'success', '2024-11-18 19:37:43', '2024-11-18 19:38:00'),
(26, 'Test Order', 80.00, 'vronJS68RcRh9F3gv--Ww', 'pi_3QMaoBLB0eLe51x9023HCNmy', 'success', '2024-11-18 19:40:11', '2024-11-18 19:40:22'),
(27, 'Test Order', 27.00, '-V3upNadkJbDFdRpmbjXA', 'pi_3QMdENLB0eLe51x912HSxTOo', 'success', '2024-11-18 22:15:12', '2024-11-18 22:15:34'),
(28, 'Test Order', 53.50, 'uZKsxc4-xkBlx0bIV10F1', NULL, 'wait', '2024-11-25 21:35:24', '2024-11-25 21:35:24'),
(29, 'Test Order', 53.50, 'rceBHJweBKO9Pc3RW15UW', NULL, 'wait', '2024-11-25 23:00:28', '2024-11-25 23:00:28'),
(30, 'Test Order', 0.00, 'pFqiSxTPIMNxoTdVZ05GJ', NULL, 'wait', '2024-11-26 19:21:13', '2024-11-26 19:21:13'),
(31, 'Test Order', 53.50, 'B-zrOvoOvw-mXLuACjZVE', 'pi_3QPWnaLB0eLe51x90fiMwYUU', 'success', '2024-11-26 21:59:35', '2024-11-26 21:59:49'),
(32, 'Test Order', 27.00, 'xFuRsQTAkyGBXZLw2HoaC', 'pi_3QPX6sLB0eLe51x90F8Ihqyu', 'success', '2024-11-26 22:19:31', '2024-11-26 22:19:45'),
(33, 'Test Order', 90.00, 'AadMcF36b4cDc4M7KA1Mu', NULL, 'wait', '2024-11-27 11:19:32', '2024-11-27 11:19:32'),
(34, 'Test Order', 27.00, 'H01iZLgNUtunUiFykVbep', NULL, 'wait', '2024-11-27 11:46:16', '2024-11-27 11:46:16'),
(35, 'Test Order', 27.00, '8KbvgZzSZNBe6q0VKgMcu', NULL, 'wait', '2024-11-27 11:46:19', '2024-11-27 11:46:19'),
(36, 'Test Order', 27.00, 'a5nLSAdXplR9QbOzF7Bjo', NULL, 'wait', '2024-11-27 11:46:22', '2024-11-27 11:46:22'),
(37, 'Test Order', 27.00, '6CN-uZO00TK8bVsf68-Or', NULL, 'wait', '2024-11-27 11:46:28', '2024-11-27 11:46:28'),
(38, 'Test Order', 27.00, 'p4rjVRGSdOtP4ovtxCfjN', NULL, 'wait', '2024-11-27 11:47:21', '2024-11-27 11:47:21'),
(39, 'Test Order', 27.00, 'xsnfh99_PnDhz_gZhlyMB', NULL, 'wait', '2024-11-27 11:50:51', '2024-11-27 11:50:51'),
(40, 'Test Order', 27.00, 'iud4zhOYLlwxWq39vOywU', NULL, 'wait', '2024-11-27 12:04:10', '2024-11-27 12:04:10'),
(41, 'Test Order', 27.00, 'cryB_Jp1qGshg_4pPY1dc', NULL, 'wait', '2024-11-27 12:09:50', '2024-11-27 12:09:50'),
(42, 'Test Order', 27.00, 'liLsWt1c9w8P8b3T6XnAT', NULL, 'wait', '2024-11-27 12:10:40', '2024-11-27 12:10:40'),
(43, 'Test Order', 27.00, 'APKqEnJpT4try0ianxNlj', NULL, 'wait', '2024-11-27 12:11:57', '2024-11-27 12:11:57'),
(44, 'Test Order', 27.00, 'jSya3G7eC9RQPJPkpm2sM', NULL, 'wait', '2024-11-27 12:15:01', '2024-11-27 12:15:01'),
(45, 'Test Order', 27.00, 'X2VsZHKbZ2sd16d4ev33q', NULL, 'wait', '2024-11-27 12:18:07', '2024-11-27 12:18:07'),
(46, 'Test Order', 27.00, '9u13oHUIvRG-mIKkav-kR', NULL, 'wait', '2024-11-27 12:21:09', '2024-11-27 12:21:09'),
(47, 'Test Order', 27.00, 'zWaixT3dOHfsp-yDSvX5q', NULL, 'wait', '2024-11-27 12:30:04', '2024-11-27 12:30:04'),
(48, 'Test Order', 351.00, 'y5iwMLzxIUEIeUzosjlSX', NULL, 'wait', '2024-11-27 12:31:46', '2024-11-27 12:31:46'),
(49, 'Test Order', 351.00, 'SXvZfKHGkp_961HjvlLJx', 'pi_3QPkYTLB0eLe51x91NECE8YD', 'success', '2024-11-27 12:32:51', '2024-11-27 12:41:08'),
(50, 'Test Order', 27.05, 'jenPKlMV3YaM0--1N4CKb', NULL, 'wait', '2024-11-27 12:42:00', '2024-11-27 12:42:00'),
(51, 'Test Order', 54.00, 'YtI2U_XUox3D829qGeiOE', 'pi_3QPkj3LB0eLe51x90db7V5UT', 'success', '2024-11-27 12:49:59', '2024-11-27 12:52:03'),
(52, 'Test Order', 53.50, 'bS1hJd0dUHml3vttIxojS', 'pi_3QPkrfLB0eLe51x91hw0cRpO', 'success', '2024-11-27 12:53:44', '2024-11-27 13:00:57'),
(53, 'Test Order', 53.50, 'G6AnqIYJrNF7uyvmKpFD4', NULL, 'wait', '2024-11-27 16:42:41', '2024-11-27 16:42:41'),
(54, 'Test Order', 53.50, '1LgOFwlJuohUbeP7B2-za', 'pi_3QPoOLLB0eLe51x90T9rTK63', 'success', '2024-11-27 16:44:01', '2024-11-27 16:46:55'),
(55, 'Test Order', 9.00, 'khtc0Yb9qhxuoObXxUz1d', NULL, 'wait', '2024-11-27 17:10:15', '2024-11-27 17:10:15'),
(56, 'Test Order', 27.05, '2_mv3ISqutUH_95mv4Z3O', NULL, 'wait', '2024-11-27 18:06:01', '2024-11-27 18:06:01'),
(57, 'Test Order', 27.05, 'eRMKWUPY8-_llIqSQStaJ', 'pi_3QPpgVLB0eLe51x91EMEHwIl', 'success', '2024-11-27 18:06:34', '2024-11-27 18:09:55'),
(58, 'Test Order', 36.00, 'JwiBPEybYd0paBOQ0E7u7', 'pi_3QPpxaLB0eLe51x91JauTwXj', 'success', '2024-11-27 18:26:20', '2024-11-27 18:27:32'),
(59, 'Test Order', 62.55, 'LYjRDuQBZZyQfwLIGomJ5', NULL, 'wait', '2024-12-01 11:52:59', '2024-12-01 11:52:59');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `series`
--

CREATE TABLE `series` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `categoria` int(11) NOT NULL,
  `portada` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `series`
--

INSERT INTO `series` (`id`, `nombre`, `categoria`, `portada`) VALUES
(1, 'CHAINSAW MAN', 2, '../../../assets/img/libros/manga/Chainsaw Man/1-1.jpg'),
(2, 'JUJUTSU KAISEN', 2, '../../../assets/img/libros/manga/Jujutsu Kaisen/1-1.jpg'),
(3, 'SPIDERMAN', 3, '../../../assets/img/libros/comic estaodunidense/Spiderman/1-1.jpg'),
(5, 'ILUSTRADOS SIN SERIE', 4, '../../../assets/img/otros/blank.png'),
(6, 'MANGA SIN SERIE', 2, '../../../assets/img/otros/blank.png'),
(7, 'COMIC EUROPEO SIN SERIE', 1, '../../../assets/img/otros/blank.png'),
(8, 'COMIC ESTADOUNIDENSE SIN SERIE', 3, '../../../assets/img/otros/blank.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(40) NOT NULL,
  `correo` varchar(90) NOT NULL,
  `contraseña` varchar(100) NOT NULL,
  `Admin` tinyint(1) NOT NULL,
  `Pregunta` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `correo`, `contraseña`, `Admin`, `Pregunta`) VALUES
(7, 'Waluigi', 'ejemplo@gmail.com', '$2b$10$EZsL20N0aU09YDkwAyYniO/YcfkpA42nMvjEdhfw4KWzWwG670ozG', 1, ''),
(8, 'Luigi', 'luigi.com', '$2b$10$Ns4p5jPS7JekwmALJz2oKuq6B7mE3Tyun7cyX/ieMh1Hntfp8Y8yG', 0, ''),
(9, 'Toad', 'ejemplo@gmail.com', '$2b$10$YIvRjl2giPz/syujVUViieGtGaeRi5SFl23fxl1lmPqPhabeRr5q6', 0, ''),
(10, 'Bowser', 'ejemplo@gmail.com', '$2b$10$B1RPbouUGQS/aia.I8/ZdOZtNgwyt/m6ekyM9mHVI.BgMuPtu08Ku', 1, ''),
(11, 'buscopinga96', 'ejemplo@gmail.com', '$2b$10$1fZ6vOxcQKXmYZaBETvrKeFcnzTtDoZ1rCXxrZ.dvq0CVPV..exOy', 1, ''),
(12, 'JuanJose', 'ejemplo@gmail.com', '$2b$10$IkFew6NPE8qzx903pdl5K.yGfpBIJP4VXAN6U9Rl9MlT.4nKs.I1e', 0, ''),
(14, 'Pit', 'ejemplo@gmail.com', '$2b$10$WPz1TSHEPhkawIMN/YDnUenw//6iEzh5qEhx3/dmKMgzpk/b8aveC', 0, ''),
(19, 'Waluigi1', 'ejemplo@gmail.com', '$2b$10$yVMk/3mRrcTz9d1qByErB.KMgryarPGcjmD5AEknZl0xQeWh2/ESi', 0, ''),
(20, 'Mario', 'mario@gmail.com', '$2b$10$32bMI8WKcBR0tBV77yCs4OhPiFJGU7ANYqqqhgYVw5aRPXab75vGy', 0, ''),
(21, 'ManoloTanga', 'tumamaentanga@gmail.com', '$2b$10$ntgJ7UOLsxoVCmOffAS8zOYkHi.f6JRkiEL4015rtEr0W37QLMwfm', 0, 'Juanjo'),
(22, 'Bellsprout', 'loquesea1@gmail.com', '$2b$10$rluLc8nqJF.O1TMBh4gWDuQ.2qWrVkDHeBKr7K6iS.owcllweZeS2', 1, '$2b$10$gkIx5xaAboXe4lbI1JSoFOjXVP2AsInVX4VCSS22jaeAWCHgOVZU2'),
(23, 'Ejemplo', 'ejemplo1234@gmail.com', '$2b$10$HgQ9uOFh4MBszmsGDlUGM.0ANJu7bu7FChMbCHalDtliPAhckmRtK', 0, '$2b$10$DD0.Q.Fvn59HtVEUIbyCp.mG211InR0Gsb84fBCYz7CxD7Kcvzzsu');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `avances`
--
ALTER TABLE `avances`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `envios`
--
ALTER TABLE `envios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuarios_usuario_envios` (`usuario`);

--
-- Indices de la tabla `etiquetas`
--
ALTER TABLE `etiquetas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `libros`
--
ALTER TABLE `libros`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categorias_categoria_libros` (`categoria`),
  ADD KEY `series_serie_libros` (`serie`),
  ADD KEY `etiquetas_etiqueta_libros` (`etiqueta`);

--
-- Indices de la tabla `noticias`
--
ALTER TABLE `noticias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `series`
--
ALTER TABLE `series`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categorias_categoria_series` (`categoria`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `avances`
--
ALTER TABLE `avances`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `envios`
--
ALTER TABLE `envios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `etiquetas`
--
ALTER TABLE `etiquetas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `libros`
--
ALTER TABLE `libros`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `noticias`
--
ALTER TABLE `noticias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT de la tabla `series`
--
ALTER TABLE `series`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `envios`
--
ALTER TABLE `envios`
  ADD CONSTRAINT `usuarios_usuario_envios` FOREIGN KEY (`usuario`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `libros`
--
ALTER TABLE `libros`
  ADD CONSTRAINT `categorias_categoria_libros` FOREIGN KEY (`categoria`) REFERENCES `categorias` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `etiquetas_etiqueta_libros` FOREIGN KEY (`etiqueta`) REFERENCES `etiquetas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `series_serie_libros` FOREIGN KEY (`serie`) REFERENCES `series` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `series`
--
ALTER TABLE `series`
  ADD CONSTRAINT `categorias_categoria_series` FOREIGN KEY (`categoria`) REFERENCES `categorias` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
