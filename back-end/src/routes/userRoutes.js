// src/routes/userRoutes.js
const express = require('express');
const router = express.Router();
const userRepository = require('../repositories/userRepository');

router.get('/get-users', (req, res) => {
  userRepository.getUsers((err, results) => {
    if (err) {
      res.status(500).send('Error al obtener datos');
      return;
    }
    res.json(results);
  });
});



module.exports = router;
