import React, { useRef, useState } from 'react'
import emailjs from '@emailjs/browser'
import './Contact.css'

const Contact = () => {
    const form = useRef()
    const [loading, setLoading] = useState(false)

    const validateEmail = (email) => {
        return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)
    }

    const sendEmail = (e) => {
        e.preventDefault()

        const emailValue = form.current.user_email.value
        const messageValue = form.current.message.value

        if (!validateEmail(emailValue)) {
            alert("Geçerli bir email adresi giriniz ❌")
            return
        }

        if (messageValue.length < 10) {
            alert("Mesaj en az 10 karakter olmalı ❌")
            return
        }

        setLoading(true)

        emailjs.sendForm(
            'service_bcmdoiv',
            'template_dmqhg7y',
            form.current,
            '62BIWuva9wqNnghCl'
        )
            .then((result) => {
                alert("Mesaj başarıyla gönderildi ✅")
                form.current.reset()
                setLoading(false)
            }, (error) => {
                alert("Bir hata oluştu ❌")
                setLoading(false)
            })
    }
    return (
        <div className="contact-container">
            <form ref={form} onSubmit={sendEmail}>
                <div className="form-group">
                    <label htmlFor="name">İsim</label>
                    <input type="text" name="user_name" id="name" placeholder="Adınız"></input>
                </div>
                <div className="form-group">
                    <label htmlFor="email">E-posta</label>
                    <input type="email" name="user_email" id="email" placeholder="ornek@email.com"></input>
                </div>
                <div className="form-group">
                    <label htmlFor="subject">Başlık</label>
                    <input type="text" name="subject" id="subject" placeholder="Başlık"></input>
                </div>
                <div className="form-group">
                    <label htmlFor="message">Mesaj</label>
                    <textarea name="message" id="message" rows="5" placeholder="Mesajınız..."></textarea>
                </div>
                <button 
                    type="submit" 
                    className="btn" 
                    disabled={loading}
                    style={{ width: "100%" }}
                >
                    {loading ? "Gönderiliyor..." : "Gönder"}
                </button>
            </form>
        </div>
    )
}

export default Contact