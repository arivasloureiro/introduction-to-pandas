import pandas as pd

# Configuraciones extra de Pandas
pd.set_option('display.float_format', lambda x: '%.6f' % x)
pd.set_option("display.max_columns", 50)
pd.set_option("display.max_colwidth", 100)
