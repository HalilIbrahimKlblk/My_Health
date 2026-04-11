import React from 'react'
import './Home.css'
import Contact from '../../components/Contact/Contact';


const Home = () => {
    return (
        <div>
            <section className="hero">
                <div className="container hero-content">
                    <h1>Sağlığınız parmağınızın <span className="gradient-text"> ucunda</span></h1>
                    <p>Kişisel sağlık verilerinizi takip etmenizi, analiz etmenizi ve size özel önerilerle daha bilinçli kararlar almanızı sağlayan dijital bir sağlık platformunu hemen deneyin.</p>
                    <div className="hero-btns">
                        <button
                            className="btn"
                            onClick={() =>
                                document
                                    .getElementById("projects")
                                    .scrollIntoView({ behavior: "smooth" })
                            }
                        >
                            Uygulamayı İndir
                        </button>
                        <button
                            className="btn btn-outline"
                            onClick={() =>
                                document
                                    .getElementById("contact")
                                    .scrollIntoView({ behavior: "smooth" })
                            }
                        >
                            İletişime Geç
                        </button>
                    </div>
                </div>
            </section>
            <h2 className="section-title" id='about'><span>Hakkımızda</span></h2>
            <div className="container">
                <div className="about-content">
                    <div className="about-right">
                        <div className="about-text">
                            <h1 className="about-name">My Health</h1>
                        </div>
                        <p>Mersin Üniversitesi</p>
                        <div className="cv-box">
                            <a href="https://play.google.com/" className="cv-btn" download target="_blank"><i className="fas fa-download"></i> Download App</a>
                        </div>
                    </div>
                </div>
            </div>
            <div className='container'>
                <div className='about-flex-content'>
                    <div className='about-flex-item'>
                        <h2 className='about-h2'>Hedef Kitle</h2>
                    </div>
                    <div className='about-flex-item'>
                        <h2 className='about-h2'>Uygulama İçeriği</h2>
                    </div>
                </div>
            </div>
            <div className="container">
                <div className="info-cards">
                    <a className='card-link' href="mailto:halilkalabalik64@gmail.com">
                        <div className="info-card">
                            <i className="fas fa-envelope"></i>
                            <div>
                                <h4>E-Mail</h4>
                            </div>
                        </div>
                    </a>
                    <a className='card-link'>
                        <div className="info-card">
                            <i className="fas fa-map-marker-alt"></i>
                            <div>
                                <h4>Ankara</h4>
                            </div>
                        </div>
                    </a>
                    <a className='card-link' href="https://github.com/HalilIbrahimKlblk">
                        <div className="info-card">
                            <i className="fab fa-github"></i>
                            <div>
                                <h4>GitHub</h4>
                            </div>
                        </div>
                    </a>
                    <a className='card-link' href="https://www.linkedin.com/in/halil-ibrahim-kalabalik/">
                        <div className="info-card">
                            <i className="fab fa-linkedin"></i>
                            <div>
                                <h4>LinkedIn</h4>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
            <h2 className="section-title" id='app'><span>Mobil Uygulama</span></h2>
            <div className="container">
            </div>
            <h2 className="section-title" id='blog'><span>İşletmeler İçin</span></h2>
            <div className="container">
            </div>
            <h2 className="section-title" id='blog'><span>Nasıl Çalışır ?</span></h2>
            <div className="container">
            </div>
            <h2 className="section-title" id='contact'><span>İletişim</span></h2>
            <div className="container">
                <Contact />
            </div>
        </div>
    )
}

export default Home