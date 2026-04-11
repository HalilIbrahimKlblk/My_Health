import React, { useState } from 'react';
import './Navbar.css';

const Navbar = () => {
  const [menuOpen, setMenuOpen] = useState(false);

  return (
    <nav className='navbar'>
      <div className="navbar-left">
        <a href='/' className="logo-link">
          <img src="/img/logo.png" alt="home" />
        </a>
      </div>

      <button className={`navbar-toggle ${menuOpen ? 'active' : ''}`} onClick={() => setMenuOpen(!menuOpen)}>
        <span className="bar"></span>
        <span className="bar"></span>
        <span className="bar"></span>
      </button>

      <div className={`navbar-right ${menuOpen ? 'open' : ''}`}>
        <a
          href="#about"
          className='nav-link'
          onClick={(e) => {
            e.preventDefault();
            document.getElementById("about")
              .scrollIntoView({ behavior: "smooth" });
            setMenuOpen(false);
          }}
        >
          Hakkımızda
        </a>
        <a
          href="#app"
          className='nav-link'
          onClick={(e) => {
            e.preventDefault();
            document.getElementById("app")
              .scrollIntoView({ behavior: "smooth" });
            setMenuOpen(false);
          }}
        >
          Mobil App
        </a>
        <a
          href="#contact"
          className='nav-link'
          onClick={(e) => {
            e.preventDefault();
            document.getElementById("contact")
              .scrollIntoView({ behavior: "smooth" });
            setMenuOpen(false);
          }}
        >
          İletişim
        </a>
        <a
          href="/Login"
          className='contact-btn'
        >
          Giriş Yap / Kayıt Ol
        </a>
      </div>
    </nav>
  );
};

export default Navbar;