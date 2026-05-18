const mongoose = require("mongoose");

const doctorSchema = new mongoose.Schema(
  {
    name: {
      type: String,
      required: true,
    },

    specialty: {
      type: String,
      required: true,
    },

    hospital: {
      type: String,
      required: true,
    },

    experience: {
      type: String,
      required: true,
    },

    rating: {
      type: String,
      default: "4.5",
    },

    patientsCount: {
      type: Number,
      default: 0,
    },
  },
  { timestamps: true }
);

module.exports = mongoose.model("Doctor", doctorSchema);