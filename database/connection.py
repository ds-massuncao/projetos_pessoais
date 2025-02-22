import pg8000


try:
    con = pg8000.connect(
        user = "ortodensdb"
        password = "admin"
        host = "localhost"
        database = "farmacia" 
    )
        
        
except Exception as e:

    print(f"Erro ao conectar ao banco de dados: {e}")
    



