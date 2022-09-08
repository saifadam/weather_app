# Execute this
# Payload for this is (use jwt.io) to generate Bearer token:
#{
#  "sub": "1234567890",
#  "name": "Saifadam Pathan",
#  "iss": "admin-issuer",
#  "iat": 1516239022
#}
kubectl create secret \
  generic app-admin-jwt  \
  --from-literal=kongCredType=jwt  \
  --from-literal=key="admin-issuer" \
  --from-literal=algorithm=RS256 \
  --from-literal=rsa_public_key="-----BEGIN PUBLIC KEY-----
  MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAu1SU1LfVLPHCozMxH2Mo
4lgOEePzNm0tRgeLezV6ffAt0gunVTLw7onLRnrq0/IzW7yWR7QkrmBL7jTKEn5u
+qKhbwKfBstIs+bMY2Zkp18gnTxKLxoS2tFczGkPLPgizskuemMghRniWaoLcyeh
kd3qqGElvW/VDL5AaWTg0nLVkjRo9z+40RQzuVaE8AkAFmxZzow3x+VJYKdjykkJ
0iT9wCS0DRTXu269V264Vf/3jvredZiKRkgwlL9xNAwxXFg0x/XFw005UWVRIkdg
cKWTjpBP2dPwVZ4WWC+9aGVd+Gyn1o0CLelf4rEjGoXbAAEgAqeGUxrcIlbjXfbc
mwIDAQAB
-----END PUBLIC KEY-----"
