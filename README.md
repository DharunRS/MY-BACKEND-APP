# Product Catalog API (Backend)

A robust, production-ready backend built with Django REST Framework (DRF), designed to serve as the core service for the Product Catalog application.

## 📋 Features
- **API Architecture:** RESTful endpoints for efficient CRUD operations on product entities.
- **Database:** PostgreSQL integration with SSL-enforced connections.
- **Production Ready:** Configured with Gunicorn for high-performance request handling.
- **Middleware:** CORS headers configured to allow secure communication with the frontend.
- **Auto-Migration:** Integrated Docker startup scripts to ensure database consistency on deployment.

## 🚀 Setup & Deployment
- **Environment Management:** Uses standard environment variables for configuration.
- **Docker:** Containerized for consistent performance across local development and cloud production.
- **Deployment:** Automatically deployed to Render through GitHub Actions.

## ⚙️ Key Dependencies
- Django 5.2.3
- Django REST Framework
- Gunicorn
- psycopg2 (PostgreSQL adapter)
