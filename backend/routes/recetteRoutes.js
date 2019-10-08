// Importation d'express
const express = require ('express');

//Création du routeur
const router = express.Router();



//Liste des recettes
router.get("/", (req,res) => {
    connection.query('SELECT * FROM recette', (err, res))
    res.json(data)
});


//Exportation du routeur
module.exports = router;