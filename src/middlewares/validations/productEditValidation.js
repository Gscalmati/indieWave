const db = require("../../database/models");
const { body } = require("express-validator");

const validations =[
    /*Validación nombre */
    body("game_name").notEmpty().withMessage(" El nombre no puede estar vacío")
    .isLength({ min: 5 }).withMessage(" Ingrese un nombre mayor a 5 caracteres")
    .custom((value) => {
        return db.Products.findOne({
                where: {
                    name: value
                }
            })
            .then(function(result) {
                if (result) {
                    return Promise.reject("Ya existe un producto con ese nombre");
                }
            })
    })
    .isAlpha('en-US','es-ES', { ignore: '\s' }).withMessage(" Ingrese un nombre válido"),
    
    /*Validación desarrollador*/
    body("developer").notEmpty().withMessage(" El desarrollador no puede estar vacío")
    .isAlpha('en-US','es-ES', { ignore: '\s' }).withMessage("Ingrese un nombre válido"),

    /*Validación email*/
    body("email").notEmpty().withMessage(" El campo no puede estar vacío")
    .isEmail().withMessage(" Ingrese un email con formato válido").bail(),

    /*Validación fecha */
    body("release_date").notEmpty().withMessage(" Ingrese fecha de lanzamiento")
    //.isISO8601({ strict: false, strictSeparator: false }).withMessage(" La fecha de lanzamiento debe de ser en formato dd/mm/yyyy"),
    .isDate().withMessage(" La fecha de lanzamiento debe de ser en formato dd/mm/yyyy"),

    /*Validación precio */
    body("price").notEmpty().withMessage("El precio no puede estar vacío")
    .isInt().withMessage("El precio debe ser un numero entero")
    .isNumeric({no_symbols: false}).withMessage("El campo precio solamente lleva números"),

    /*Validación logo */
    body("logo")
    .custom((logo, { req }) => {
        if (!req.file){
            return true
        } else if(req.file.mimetype === "logo/png" || req.file.mimetype === "logo/jpeg" || req.file.mimetype === "logo/jpg"){
            return true
        }
        return false
    })
    .withMessage("El logo debe ser de formato JPG/JPEG/PNG o ninguna"),

    /*Validación imagen */
    body("images")
    .custom((images, { req }) => {
        if (!req.file){
            return true
        } else if(req.file.mimetype === "images/png" || req.file.mimetype === "images/jpeg" || req.file.mimetype === "images/jpg"){
            return true
        }
        return false
    })
    .withMessage("La imagen debe ser de formato JPG/JPEG/PNG o ninguna"),

    /*Validación requisitos minimos */
    body("min_requirements").isLength({ min: 20 }).withMessage("Ingrese al menos 20 carácteres"),

    /*Validación requisitos recomendados */
    body("rec_requirements").isLength({ min: 20 }).withMessage("Ingrese al menos 20 carácteres"),

    /*Validación descripción */
    body("description").isLength({ min: 50 }).withMessage("Ingrese al menos 50 carácteres")
]

module.exports = validations;