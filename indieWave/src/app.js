
const express = require('express');
const app = express();

const path = require("path");




/* Configuracion Express */
app.use(express.static(path.resolve(__dirname,"../public")));

/* Configuracion template engine */
app.set("view engine", "ejs");
app.set("views", path.resolve(__dirname,"/views"))


/* Configuracion rutas */
const routerMain = require("./routes/main");
const routerUsers = require("./routes/users");
const routerProducts = require("./routes/products");


app.use("/", routerMain);

app.use("/products", routerProducts);

app.use("/users", routerUsers);



app.listen(3000, () => {
    console.log("Running on 3000")
})



