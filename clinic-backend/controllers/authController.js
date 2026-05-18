const User = require("../models/User");
const bcrypt = require("bcryptjs");
// REGISTER
const register = async (req, res) => {
  try {
    const { name, email, password, role, age, phone, specialty } = req.body;

    // check if user exists
    const existingUser = await User.findOne({ email });
    if (existingUser) {
      return res.status(400).json({ message: "Email already exists" });
    }
const hashedPassword = await bcrypt.hash(password, 10);

const user = new User({
  name,
  email,
  password: hashedPassword,
  role,
  age,
  phone,
  specialty: role === "doctor" ? specialty : undefined,
});
    await user.save();

   res.status(201).json({
  message: "User registered successfully",
  user: {
    _id: user._id,
    name: user.name,
    email: user.email,
    role: user.role,
    age: user.age,
    phone: user.phone,
    specialty: user.specialty,
    createdAt: user.createdAt,
  },
});
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
};
const login = async (req, res) => {
  try {
    const { email, password } = req.body;

    const user = await User.findOne({ email });

    if (!user) {
      return res.status(404).json({ message: "User not found" });
    }

    const isMatch = await bcrypt.compare(password, user.password);

    if (!isMatch) {
      return res.status(400).json({ message: "Invalid password" });
    }

    res.status(200).json({
      message: "Login successful",
      user: {
        _id: user._id,
        name: user.name,
        email: user.email,
        role: user.role,
      },
    });
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
};
module.exports = {
  register,
  login,
};