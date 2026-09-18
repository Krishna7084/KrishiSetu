from flask import Blueprint, request, jsonify
from app import db
from models import Order, ProduceListing

order_bp = Blueprint("order_bp", __name__)


@order_bp.route("/", methods=["POST"])
def create_order():
    data = request.get_json()
    listing = ProduceListing.query.get_or_404(data.get("listing_id"))

    order = Order(
        listing_id=listing.id,
        buyer_name=data.get("buyer_name"),
        quantity_kg=data.get("quantity_kg"),
        total_price=listing.price_per_kg * data.get("quantity_kg"),
        status="confirmed",
        payment_status="held",  # escrow: held until delivery confirmation
    )
    db.session.add(order)
    db.session.commit()
    return jsonify({"id": order.id, "total_price": order.total_price, "message": "Order confirmed, payment held in escrow"}), 201


@order_bp.route("/<int:order_id>/release-payment", methods=["POST"])
def release_payment(order_id):
    order = Order.query.get_or_404(order_id)
    order.payment_status = "released"
    order.status = "delivered"
    db.session.commit()
    return jsonify({"message": "Payment released to farmer"})


@order_bp.route("/<int:order_id>", methods=["GET"])
def get_order(order_id):
    order = Order.query.get_or_404(order_id)
    return jsonify({
        "id": order.id,
        "buyer_name": order.buyer_name,
        "total_price": order.total_price,
        "status": order.status,
        "payment_status": order.payment_status,
    })
