% hechos.pl

personaje(eric).
personaje(timmy).
personaje(kelvin).
personaje(virginia).

rol(eric, protagonista).
rol(kelvin, aliado_capturado).
rol(virginia, superviviente).
rol(virginia, mutante).

edad(eric, 30).

aliado(kelvin).
capturado(kelvin).
no_habla(kelvin).
obedece_ordenes(kelvin).
puede_volverse_aliado(virginia).

habilidad(kelvin, cargar_troncos).
habilidad(kelvin, construir).

tiene(eric, hacha).
tiene(eric, encendedor).

arma(hacha).
herramienta(hacha).
herramienta(encendedor).

zona(superficie).
zona(cuevas).
zona(bunkeres).

momento(dia).
momento(noche).

enemigo(canibales).
enemigo(mutantes).

aparece(canibales, superficie).
aparece(mutantes, superficie).
aparece(mutantes, cuevas).

requiere_llave(bunkeres).

peligro(superficie, medio, dia).
peligro(superficie, alto, noche).
peligro(cuevas, alto, dia).
peligro(cuevas, alto, noche).

nivel_riesgo(bajo, 1).
nivel_riesgo(medio, 2).
nivel_riesgo(alto, 3).

necesita(eric, refugio).
necesita(eric, comida).
necesita(eric, agua).

material(troncos).
material(piedras).

se_encuentra(troncos, superficie).
se_encuentra(piedras, superficie).
