"""
Price Recommendation Model — skeleton.

Input : historical mandi prices, current demand-supply signal, crop type
Output: a recommended fair price range (min, max) for the farmer

Replace the dummy logic below with a trained regression/time-series model
(e.g. scikit-learn) once historical mandi data (e-NAM / Agmarknet) is available.
"""
import pandas as pd
import numpy as np


def recommend_price(crop_name: str, historical_prices: pd.Series, demand_index: float = 1.0):
    """
    Very simple placeholder: base price = recent average, adjusted by demand_index.
    demand_index > 1 means demand is higher than usual (push price up).
    """
    if historical_prices.empty:
        raise ValueError("No historical price data available for this crop")

    base_price = historical_prices.tail(30).mean()
    recommended = base_price * demand_index

    price_min = round(recommended * 0.95, 2)
    price_max = round(recommended * 1.08, 2)

    return {
        "crop": crop_name,
        "recommended_price": round(recommended, 2),
        "price_range": (price_min, price_max),
    }


if __name__ == "__main__":
    sample = pd.Series(np.random.normal(loc=25, scale=2, size=60))  # ₹/kg dummy data
    result = recommend_price("Tomato", sample, demand_index=1.1)
    print(result)
