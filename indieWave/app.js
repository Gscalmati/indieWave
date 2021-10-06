
const express = require('express');
const app = express();

const path = require("path");


const routerMain = require("./src/routes/main");
const routerUsers = require("./src/routes/users");
const routerProducts = require("./src/routes/products");


app.use(express.static(path.resolve(__dirname,"public")));

app.listen(3000, () => {
    console.log("Running on 3000")
})



app.use("/", routerMain);

app.use("/products", routerProducts);

app.use("/users", routerUsers);






