// Importation d'express
const express = require ('express');

//Création du routeur
const router = express.Router();

//Import du module de connexion à la base de données
const connection = require('../connexionMysql')



//Liste de toutes les recettes
router.get("/", (req,res) => {
    connection.query('SELECT * FROM recette', (err, data) => {
        if(err){
            console.log(err);
            res.status(500).send("Impossible d'exécuter la requête");
        }
            
        
    })
    
});

//Liste d'une seule recette
router.get('/:id', (req, res, next) => {
    connection.query('SELECT * FROM recette WHERE idRecette=?', [req.params.id],
    (err,data) => {
        if(err){
            console.log(err);
            res.status(500).send("Impossible d'exécuter la requête");
        } else {
            res.json(data)
        };
    })
})



//Exportation du routeur
module.exports = router;