"""
KrishiSetu Backend — Flask entry point.
Run: python app.py
"""
from flask import Flask, jsonify
from flask_sqlalchemy import SQLAlchemy
from config import Config

db = SQLAlchemy()


def create_app():
    app = Flask(__name__)
    app.config.from_object(Config)
    db.init_app(app)

    # Register blueprints (route modules)
    from routes.farmer_routes import farmer_bp
    from routes.order_routes import order_bp

    app.register_blueprint(farmer_bp, url_prefix="/api/farmers")
    app.register_blueprint(order_bp, url_prefix="/api/orders")

    @app.route("/api/health")
    def health():
        return jsonify({"status": "ok", "service": "KrishiSetu backend"})

    return app


if __name__ == "__main__":
    app = create_app()
    with app.app_context():
        db.create_all()
    app.run(debug=True, host="0.0.0.0", port=5000)
