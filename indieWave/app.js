
const express = require('express');
const app = express();

const path = require("path");

app.use(express.static(path.resolve(__dirname,"public")));

app.listen(3000, () => {
    console.log("Running on 3000")
})

app.get("/", (req,res) =>{
    res.sendFile(path.resolve(__dirname, "src/views/home.html"));
})

app.get("/home", (req,res) =>{
    res.sendFile(path.resolve(__dirname, "src/views/home-dos.html"));
})

app.get("/productDetail", (req, res) =>{
    res.sendFile(path.resolve(__dirname, "src/views/productDetail.html"));
})

app.get("/shoppingCart", (req, res) =>{
    res.sendFile(path.resolve(__dirname, "src/views/shoppingCart.html"));
})

app.get("/register", (req, res) =>{
    res.sendFile(path.resolve(__dirname, "src/views/register.html"));
})

app.get("/login", (req, res) =>{
    res.sendFile(path.resolve(__dirname, "src/views/login.html"));
})