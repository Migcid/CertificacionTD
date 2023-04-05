const express = require('express');
const { create } = require('express-handlebars')
const path = require('path');
const app = express();

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

app.get("/", (req, res) => {
    res.render("home")
})


app.listen(PORT, () => console.log("http://localhost:"+PORT));
