import React from 'react';
import Navbar from '../components/Navbar/Navbar';
import Footer from '../components/Footer/Footer';

const MainLayout = ({ children }) => {
    return (
        <>
            <Navbar />
            <div>{children}</div>
            <Footer />
        </>
    );
};

export default MainLayout;
