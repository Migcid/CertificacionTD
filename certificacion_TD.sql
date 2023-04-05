select * from usuarios;
select * from categorias;
select * from publicaciones_noticias;
select * from comentarios;



CREATE TABLE usuarios(
	id serial primary key, 
	nombre varchar(60) not null,
	email varchar (60) not null,
	password varchar(150) not null

);

CREATE TABLE categorias(
	id serial primary key, 
	nombre varchar(60) not null

);

CREATE TABLE publicaciones_noticias(
	id serial primary key, 
	titulo varchar(60) not null,
	contenido varchar (4000) not null,
	fecha date not null,
	imagen varchar(60) not null, 
	id_categoria int not null,
	id_usuario int not null,
	FOREIGN KEY(id_categoria) REFERENCES categorias(id),
	FOREIGN KEY(id_usuario) REFERENCES usuarios(id)
	
);

CREATE TABLE comentarios(
	id serial primary key, 
	contenido varchar (4000) not null,
	id_usuario int not null,
	id_publicacion int not null,
	FOREIGN KEY(id_usuario) REFERENCES usuarios(id),
	FOREIGN KEY(id_publicacion) REFERENCES publicaciones_noticias(id)

);

UPDATE publicaciones_noticias SET imagen = 'imagen.jpg'


-- USUARIOS

INSERT INTO usuarios(nombre, email, password) VALUES('Facundo Cid', 'facundo@hola.cl', '123456'), ('Miguel Cid', 'miguel@hola.cl', '123456'), ('Alicia Puentes', 'alicia@hola.cl', '123456'), ('Agustina Puentes', 'apuentes@hola.cl', '123456');

-- CATEGORIAS

INSERT INTO categorias(nombre) VALUES('ComidaSaludable'),( 'ComidaChatarra');

 -- PUBLICACIONES_NOTICIAS

INSERT INTO publicaciones_noticias(titulo, contenido, fecha, id_categoria, id_usuario) VALUES('Ensalda de Lechuga', 'La ensalada de lechuga es saludable para nuestro organismo', now(), '1', '1' );
INSERT INTO publicaciones_noticias(titulo, contenido, fecha, id_categoria, id_usuario) VALUES('Papas Fritas (envasadas)', 'Las papas fritas envasadas contienen acidos y aceites transgenicos nocivos para nuestro organismo con nivel de toxicidad muy alto.', now(), '2', '4' );
INSERT INTO publicaciones_noticias(titulo, contenido, fecha, id_categoria, id_usuario) VALUES('Quinoa inflada o pop', 'Cereal natural nutritivo para nuestro organismo con beneficios de alta eficiencia. ', now(), '1', '3' );
INSERT INTO publicaciones_noticias(titulo, contenido, fecha, id_categoria, id_usuario) VALUES('Jurel en lata o conserva', 'Jurel en lata representa alto nivel de toxicidad por el recipiente de envasado, puestp que el metal libera particulas daninas para nuestro organismo ', now(), '2', '2' );
INSERT INTO publicaciones_noticias(titulo, contenido, fecha, id_categoria, id_usuario) VALUES('Cereales', 'Buena fuente de vitaminas y minerales solo al ser organico, sin pesticidas', now(), '1', '2' );