
const express = require('express');
const app = express();

const path = require("path");

app.use(express.static(path.resolve(__dirname,"public")));

app.listen(3000, () => {
    console.log("Running on 3000")
})

app.get("/", (req,res) =>{
    res.sendFile(path.resolve(__dirname, "views/home.html"));
})

app.get("/productDetail", (req, res) =>{
    res.sendFile(path.resolve(__dirname, "views/productDetail.html"));
})

app.get("/shoppingCart", (req, res) =>{
    res.sendFile(path.resolve(__dirname, "views/shoppingCart.html"));
})

app.get("/register", (req, res) =>{
    res.sendFile(path.resolve(__dirname, "views/register.html"));
})