import { useEffect } from "react";
import { useNavigate } from "react-router-dom";
import "./Admin.css";

const Admin = () => {

  const navigate = useNavigate();

  useEffect(() => {
    const isAdmin = sessionStorage.getItem("isAdmin");

    if (!isAdmin) {
      navigate("/Login", { replace: true });
    }
  }, [navigate]);

  return (
    <div>
      <h1>Admin Panelim</h1>
    </div>
  );
};

export default Admin;