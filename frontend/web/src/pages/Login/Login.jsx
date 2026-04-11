import React, { useState } from "react";
import { useNavigate } from "react-router-dom";
import "./Login.css";

const Login = () => {

  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");

  const navigate = useNavigate();

  const handleLogin = async (e) => {
    e.preventDefault();

    try {
      const response = await fetch("http://localhost:8080/my-health/v1/user/login", {
        method: "POST",
        headers: {
          "Content-Type": "application/json"
        },
        body: JSON.stringify({
          email: email,
          password: password
        })
      });

      if (!response.ok) {
        throw new Error("Login failed");
      }

      const data = await response.json();

      // Backend'den gelen veriler
      const role = data.role;

      // Session'a kaydet
      sessionStorage.setItem("role", role);

      // Role göre yönlendirme
      if (role === "ADMIN") {
        navigate("/Admin");
      } 
      else if (role === "DOCTOR") {
        navigate("/Doctor");
      } 
      else if (role === "PHARMACIST") {
        navigate("/Pharmacist");
      }
      else if (role === "ADMIN_HOSPITAL") {
        navigate("/AdminHospital");
      }
      else if (role === "ADMIN_PHARMACY") {
        navigate("/AdminPharmacy");
      }
      else {
        alert("Bu paneli kullanma yetkiniz yok!");
      }

    } catch (error) {
      console.error(error);
      alert("Kullanıcı adı veya şifre hatalı");
    }
  };

  return (
    <div className="login-container">
      <div className="login-card">

        <img
          src="/img/admin.png"
          alt="admin"
          className="admin-icon"
        />

        <h2>Admin Paneli Giriş</h2>

        <form onSubmit={handleLogin}>
          
          <div className="input-group">
            <label>Email</label>
            <input
              type="email"
              placeholder="Email giriniz"
              value={email}
              onChange={(e) => setEmail(e.target.value)}
              required
            />
          </div>

          <div className="input-group">
            <label>Şifre</label>
            <input
              type="password"
              placeholder="Şifrenizi giriniz"
              value={password}
              onChange={(e) => setPassword(e.target.value)}
              required
            />
          </div>

          <button type="submit" className="login-btn">
            Giriş Yap
          </button>

        </form>
      </div>
    </div>
  );
};

export default Login;