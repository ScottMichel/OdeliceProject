//Importation d'express 
const express = require('express');

//Importation du module body-parser 
const bodyParser = require('body-parser');

//Importation des routes
const recetteRoutes = require('./routes/recetteRoutes')

//Importation de la bibliothèque cors
const cors = require('cors');

//Creation de l'application
const app = express();

//Déclaration de body parser dans un Middleware
app.use(bodyParser.json());
app.use(bodyParser.urlencoded());

//Autorisation des connexion venant d'autres domaines (CORS)
app.use(cors());

//Déclaration des routes dans des middleware
app.use('/recette', recetteRoutes);

//Gestion des erreurs
app.use((err, req, res, next) => {
    console.error(err);
    res.status(500).json({
        success: false,
        message: err.message
    })
});

//Lancement du serveur
app.listen(3000);