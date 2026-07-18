import pandas as pd
from sqlalchemy import create_engine


df = pd.read_csv('mi_matches.csv')

mi_wins_df = df[df['match_winner'] == 'mumbai indians']

engine = create_engine('mysql+pymysql://root:password@localhost/assignment_database')

mi_wins_df.to_sql('mi_wins', con=engine, if_exists='append', index=False)

print("data filtered successfully. rows injected into the sql table 'mi_wins'.")
