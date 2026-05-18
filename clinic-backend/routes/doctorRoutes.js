const express = require("express");
const router = express.Router();

const {
  getDoctors,
  getDoctorById,
  createDoctor,
  updateDoctor,
  deleteDoctor,
  increasePatients,
} = require("../controllers/doctorController");

// GET all doctors
router.get("/", getDoctors);

// GET doctor by id
router.get("/:id", getDoctorById);

// CREATE doctor
router.post("/", createDoctor);

// UPDATE doctor
router.put("/:id", updateDoctor);

// DELETE doctor
router.delete("/:id", deleteDoctor);

// INCREASE patients count
router.put("/:id/patient", increasePatients);

module.exports = router;