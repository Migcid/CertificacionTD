const express = require('express');
const { create } = require('express-handlebars')
const path = require('path');
const app = express();
const {getPublicaciones} = require('./consultas')

//MIDDLEWARE

app.use(express.json());
app.use(express.urlencoded({extended:true}));

let PORT = process.env.PORT || 3000;


// inicio configuración handlebars

const hbs = create({
	partialsDir: [
		"views/partials/",
	],
});

app.engine("handlebars", hbs.engine);
app.set("view engine", "handlebars");
app.set("views",  "./views");

//fin handlebars configuracion

// RUTAS DE VISTAS

app.get("/", async (req, res) => {
    try{
        let publicaciones = await getPublicaciones();
        console.log("publicaciones_noticias", publicaciones)
        
        res.render("home", {
            publicaciones
        })
    } catch(error) {
        console.log(error)
        res.render("home", {
            error: "No se cargaron las noticias"
        })

    }
    
})


app.listen(PORT, () => console.log("http://localhost:"+PORT));
