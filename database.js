const mongoose = require('mongoose');

const MONGODB_URI = 'mongodb://mongodb:27017/pucsd';

mongoose
  .connect(MONGODB_URI, { useNewUrlParser: true, useUnifiedTopology: true, useFindAndModify: false })
  .then(() => {
    console.log('Successfully connected to MongoDB.');
  })
  .catch((err) => {
    console.error('Could not connect to MongoDB:', err);
    process.exit(1); // Exit the application with an error code
  });
