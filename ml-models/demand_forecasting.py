"""
Demand Forecasting Model — skeleton.

Uses historical order volumes to forecast next-period demand for a crop
in a given region. Replace with a proper time-series model
(e.g. Scikit-learn regression, Prophet, ARIMA) once real order data is available.
"""
import pandas as pd
from sklearn.linear_model import LinearRegression
import numpy as np


def forecast_demand(order_history: pd.DataFrame, periods_ahead: int = 7):
    """
    order_history: DataFrame with columns ['day_index', 'quantity_kg']
    Returns forecasted quantity for the next `periods_ahead` periods.
    """
    X = order_history[["day_index"]].values
    y = order_history["quantity_kg"].values

    model = LinearRegression()
    model.fit(X, y)

    last_day = order_history["day_index"].max()
    future_days = np.array([[last_day + i] for i in range(1, periods_ahead + 1)])
    forecast = model.predict(future_days)

    return {"forecast_quantity_kg": [round(v, 2) for v in forecast]}


if __name__ == "__main__":
    dummy = pd.DataFrame({
        "day_index": range(1, 31),
        "quantity_kg": np.random.normal(loc=500, scale=50, size=30),
    })
    print(forecast_demand(dummy))
