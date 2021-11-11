const express = require('express');
const app = express();

const path = require("path");

const methodOverride = require("method-override");


/* COnfiguracion Session */
const session = require("express-session");
app.use(session({
    secret: "La Ola Indie",
    resave: false,
    saveUninitialized: false
}));
const loggedUserMiddleware = require("./middlewares/loggedUserMiddleware");
app.use(loggedUserMiddleware);

/* Configuracion Express */
app.use(express.static(path.resolve(__dirname, "../public")));

/* Configuracion JSON */
app.use(express.urlencoded({ extended: false }));
app.use(express.json());

/* Configuracion Method Override */
app.use(methodOverride("_method"));

/* Configuracion template engine */
app.set("view engine", "ejs");
app.set("views", path.resolve(__dirname, "views"))


/* Configuracion rutas */
const routerMain = require(path.resolve(__dirname, "routes/main"));
const routerUsers = require("./routes/users");
const routerProducts = require("./routes/products");

app.use("/", routerMain);

app.use("/products", routerProducts);

app.use("/users", routerUsers);



app.listen(process.env.PORT || 3000, () => {
    console.log("Running on 3000")
})