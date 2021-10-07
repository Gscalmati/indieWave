
const express = require('express');
const app = express();

const path = require("path");


const routerMain = require("./routes/main");
const routerUsers = require("./routes/users");
const routerProducts = require("./routes/products");

app.use(express.static(path.resolve(__dirname,"../public")));

app.set("view engine", "ejs");
app.set("views", "./views")




app.listen(3000, () => {
    console.log("Running on 3000")
})



app.use("/", routerMain);

app.use("/products", routerProducts);

app.use("/users", routerUsers);






