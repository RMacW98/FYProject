import pytest
import pandas as pd

df = pd.DataFrame(columns=['values'])

def simple_moving_average(x):
    df.values = x
    df['SMA'] = df['values'].rolling(window=2).mean()

    return df.SMA[1]

# Should pass test
def test_method1():
    assert simple_moving_average([1,2]) == 1.5

def exponential_moving_average(x):
    df.values = x
    df['EWM'] = df['values'].ewm(span=2).mean()

    return df.EWM[2]

# Should pass
def test_method1():
    assert exponential_moving_average([1,2,3]) == 2.615384615384615

# Should fail assertion
# pytest movingaverages-unittests.py -k test_method1
def test_method2():
    assert exponential_moving_average([1,2,3]) == 1.5


