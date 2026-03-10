const express = require('express');
const app = express();
app.use(express.json());

app.get('/health', (req, res) => res.send('OK'));
app.get('/status', (req, res) => res.json({status: 'running'}));
app.post('/process', (req, res) => res.json({received: req.body}));

app.listen(3000, () => console.log('App running on port 3000'));