from datetime import datetime
from app import db


class Farmer(db.Model):
    __tablename__ = "farmers"

    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(120), nullable=False)
    phone = db.Column(db.String(15), unique=True, nullable=False)
    village = db.Column(db.String(120))
    district = db.Column(db.String(120))
    state = db.Column(db.String(120))
    trust_score = db.Column(db.Float, default=0.0)
    created_at = db.Column(db.DateTime, default=datetime.utcnow)


class ProduceListing(db.Model):
    __tablename__ = "produce_listings"

    id = db.Column(db.Integer, primary_key=True)
    farmer_id = db.Column(db.Integer, db.ForeignKey("farmers.id"), nullable=False)
    crop_name = db.Column(db.String(120), nullable=False)
    quantity_kg = db.Column(db.Float, nullable=False)
    quality_grade = db.Column(db.String(20))
    price_per_kg = db.Column(db.Float, nullable=False)
    harvest_date = db.Column(db.Date)
    status = db.Column(db.String(20), default="available")  # available/sold/expired
    created_at = db.Column(db.DateTime, default=datetime.utcnow)


class Order(db.Model):
    __tablename__ = "orders"

    id = db.Column(db.Integer, primary_key=True)
    listing_id = db.Column(db.Integer, db.ForeignKey("produce_listings.id"), nullable=False)
    buyer_name = db.Column(db.String(120), nullable=False)
    quantity_kg = db.Column(db.Float, nullable=False)
    total_price = db.Column(db.Float, nullable=False)
    status = db.Column(db.String(20), default="pending")  # pending/confirmed/delivered/cancelled
    payment_status = db.Column(db.String(20), default="held")  # held/released/refunded
    created_at = db.Column(db.DateTime, default=datetime.utcnow)
