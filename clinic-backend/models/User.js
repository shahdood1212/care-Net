const mongoose = require("mongoose");

const userSchema = new mongoose.Schema(
  {
    name: {
      type: String,
      required: true,
      trim: true,
    },

    email: {
      type: String,
      unique: true,
      required: true,
      lowercase: true,
    },

    password: {
      type: String,
      required: true,
    },

    role: {
      type: String,
      enum: ["doctor", "patient"],
      required: true,
    },

    age: {
      type: Number,
    },

    phone: {
      type: String,
    },

    specialty: {
  type: String,
  default: function () {
    return this.role === "doctor" ? "" : null;
  }
}
  },
  { timestamps: true }
);

module.exports = mongoose.model("User", userSchema);