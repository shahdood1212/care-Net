const express = require("express");
const mongoose = require("mongoose");
const cors = require("cors");

const doctorRoutes = require("./routes/doctorRoutes");

require("dotenv").config();

const app = express();

app.use(cors());
app.use(express.json());

// Routes
const authRoutes = require("./routes/authRoutes");
app.use("/api/auth", authRoutes);
app.use("/api/doctors", doctorRoutes);
// Home route
app.get("/", (req, res) => {
  res.send("Clinic API is running 🚀");
});

// MongoDB
mongoose
  .connect(process.env.MONGO_URL)
  .then(() => console.log("MongoDB Connected"))
  .catch((err) => console.log(err));

// Server
const PORT = 3000;
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});