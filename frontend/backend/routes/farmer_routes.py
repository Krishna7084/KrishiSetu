from flask import Blueprint, request, jsonify
from app import db
from models import Farmer, ProduceListing

farmer_bp = Blueprint("farmer_bp", __name__)


@farmer_bp.route("/", methods=["POST"])
def register_farmer():
    data = request.get_json()
    farmer = Farmer(
        name=data.get("name"),
        phone=data.get("phone"),
        village=data.get("village"),
        district=data.get("district"),
        state=data.get("state"),
    )
    db.session.add(farmer)
    db.session.commit()
    return jsonify({"id": farmer.id, "message": "Farmer registered successfully"}), 201


@farmer_bp.route("/<int:farmer_id>/listings", methods=["POST"])
def add_listing(farmer_id):
    data = request.get_json()
    listing = ProduceListing(
        farmer_id=farmer_id,
        crop_name=data.get("crop_name"),
        quantity_kg=data.get("quantity_kg"),
        quality_grade=data.get("quality_grade", "B"),
        price_per_kg=data.get("price_per_kg"),
        harvest_date=data.get("harvest_date"),
    )
    db.session.add(listing)
    db.session.commit()
    return jsonify({"id": listing.id, "message": "Listing created"}), 201


@farmer_bp.route("/listings", methods=["GET"])
def get_all_listings():
    listings = ProduceListing.query.filter_by(status="available").all()
    return jsonify([
        {
            "id": l.id,
            "crop_name": l.crop_name,
            "quantity_kg": l.quantity_kg,
            "price_per_kg": l.price_per_kg,
            "quality_grade": l.quality_grade,
        }
        for l in listings
    ])
