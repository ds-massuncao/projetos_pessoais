# import connection
from faker import Faker




fake = Faker('pt_BR')



# for i in range(1):
    
#     cep = []
#     cep.append(fake.postcode())
#     cep.append(fake.address())
#     cep.append(fake.bairro())
#     cep.append(fake.estado_nome())
    
#     print(cep)
    
print(fake.postcode())