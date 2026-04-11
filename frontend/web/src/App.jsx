import React from 'react';
import './App.css';
import { BrowserRouter, Routes, Route } from 'react-router-dom';
import Home from './pages/Home/Home';
import NotFound from './pages/NotFound/NotFound';
import Admin from './pages/Admin/Admin';
import MainLayout from './layouts/MainLayout';
import EmptyLayout from './layouts/EmptyLayout';
import Login from './pages/Login/Login';

const App = () => {
  return (
    <>
      <BrowserRouter>
        <Routes>
          {/* Ana sayfa - Navbar ve Footer var */}
          <Route path="/" element={<MainLayout><Home /></MainLayout>} />
          {/* 404 sayfası - Navbar ve Footer yok */}
          <Route path="*" element={<EmptyLayout><NotFound /></EmptyLayout>} />
          <Route path="/Admin" element={<EmptyLayout><Admin /></EmptyLayout>} />
          <Route path="/Login" element={<EmptyLayout><Login /></EmptyLayout>} />
        </Routes>
      </BrowserRouter>
    </>
  );
};

export default App;