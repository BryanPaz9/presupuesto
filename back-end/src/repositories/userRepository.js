const db = require('../config/db');

const getUsers = (callback) => {
  db.query('SELECT * FROM seg_usuarios', (err, results) => {
    if (err) {
      return callback(err, null);
    }
    return callback(null, results);
  });
};

module.exports = { getUsers };
