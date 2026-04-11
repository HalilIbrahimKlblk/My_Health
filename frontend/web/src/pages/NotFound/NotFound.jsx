import React from 'react'
import './NotFound.css'

const NotFound = () => {
    return (
        <div className='notFound-div'>
            <h1 className='notFound-h1'>Üzgünüz, bu sayfaya ulaşılamıyor</h1>
            <p className='notFound-p'>Tıkladığınız bağlantı bozuk olabilir veya sayfa kaldırılmış olabilir.</p>
            <img className='img-eror' src='../img/notfound.png' width={200} />
            <p><a className='notFound-a' href='/'>Ana Menüye Geri Dön</a></p>
        </div>
    )
}

export default NotFound