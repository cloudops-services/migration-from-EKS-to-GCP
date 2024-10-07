const express = require('express');
const app = express();
const port = process.env.PORT || 8080;

app.get('/', (req, res) => {
  res.send('Hello, World! This is a Node.js app running on App Engine.');
});

app.listen(port, () => {
  console.log(`App listening on port ${port}`);
});
