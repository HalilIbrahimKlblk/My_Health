import { useEffect } from "react";
import { useNavigate } from "react-router-dom";
import "./Admin.css";

const Admin = () => {

  const navigate = useNavigate();

  useEffect(() => {
    // "isAdmin" yerine Login sayfasında kaydettiğimiz "role" değerini okuyoruz
    const role = sessionStorage.getItem("role");

    // Eğer rol ADMIN değilse (veya boşsa) Login'e geri gönder
    if (role !== "ADMIN") {
      navigate("/Login", { replace: true });
    }
  }, [navigate]);

  return (
    <div>
      <h1>Admin olarak giriş yaptınız</h1>
    </div>
  );
};

export default Admin;