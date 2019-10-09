// Importation d'express
const express = require('express');

//Création du routeur
const router = express.Router();

//Import du module de connexion à la base de données
const connection = require('../connexionMysql')

router.get('/test', (req, res) => {
    connection.query('SELECT * FROM commentaire', (err, data) => {
        if (err) {
            console.log(err)
        } else {
            console.log(data)
            res.json(data);
        }

    })
});

//Liste de toutes les recettes
router.get("/", (req, res) => {
    connection.query('SELECT * FROM odelice.recette', (err, data) => {
        if (err) {
            console.log(err);
            res.status(500).send("Impossible d'exécuter la requête");
        } else {
            console.log('test');
            res.json(data);
        }
    })

});

//Recherche une recette dans la barre url
router.get('/search', (req, res) => {
    console.log('param : ' + req.query.titre)
    connection.query("SELECT * FROM recette WHERE titre LIKE ?", ['%' + req.query.titre + '%'],
        (err, data) => {
            console.log('callback');
            if (err) {
                console.log(err);
                res.status(500).send("Impossible d'exécuter la requête");
            } else {
                console.log(data);
                res.json(data)
            }
        });
});

//Liste d'une seule recette
router.get('/:id', (req, res, next) => {
    connection.query('SELECT * FROM recette WHERE idRecette=?', [req.params.id],
        (err, data) => {
            if (err) {
                console.log(err);
                res.status(500).send("Impossible d'exécuter la requête");
            } else {
                res.json(data)
            };
        })
})

//Liste des commentaires par recette
router.get('/commentaire/:id', (req, res) => {
    connection.query('SELECT * FROM commentaire WHERE idRecette=?', [req.params.id],
        (err, data) => {
            if (err) {
                console.log(err);
                res.status(500).send("Impossible d'exécuter la requête");
            } else {
                res.json(data)
            };
        });
});





//Exportation du routeur
module.exports = router;