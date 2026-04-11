import React, { useState } from "react";
import { useNavigate } from "react-router-dom";
import "./Login.css";

const Login = () => {

  const [username, setUsername] = useState("");
  const [password, setPassword] = useState("");

  const navigate = useNavigate();

  const handleLogin = (e) => {
    e.preventDefault();

    if (username === "admin" && password === "1234") {

      sessionStorage.setItem("isAdmin", "true");
      navigate("/Admin");

    } else {
      alert("Kullanıcı adı veya şifre hatalı");
    }
  };

  return (
    <div className="login-container">
      <div className="login-card">

        <img
          src="../../public/img/admin.png"
          className="admin-icon"
        />

        <h2>Admin Paneli</h2>

        <form onSubmit={handleLogin}>
          <div className="input-group">
            <label>Kullanıcı Adı</label>
            <input
              type="text"
              placeholder="Kullanıcı adınızı giriniz"
              value={username}
              onChange={(e) => setUsername(e.target.value)}
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