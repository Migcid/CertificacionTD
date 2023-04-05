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

	
	
