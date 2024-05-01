// src/app.js
const express = require('express');
const userRoutes = require('./routes/userRoutes');
const app = express();
const PORT = 3000;

app.use('/user', userRoutes);

app.listen(PORT, () => {
  console.log(`Servidor corriendo en http://localhost:${PORT}`);
});

module.exports = app;
