# CodeBook

## Descripción

Este proyecto toma los datos de los estudios de actividad humana usando teléfonos inteligentes, los limpia y organiza para producir un conjunto de datos ordenados con las medias de cada variable para cada actividad y cada sujeto.

## Variables

### Datos originales

- `subject_train.txt` y `subject_test.txt`: ID del sujeto.
- `X_train.txt` y `X_test.txt`: Las mediciones de las características.
- `y_train.txt` y `y_test.txt`: Las etiquetas de las actividades.

### Transformaciones

1. Fusionar los conjuntos de entrenamiento y de prueba para crear un único conjunto de datos.
2. Extraer sólo las mediciones de la media y la desviación estándar.
3. Utilizar nombres de actividades descriptivos.
4. Etiquetar el conjunto de datos con nombres descriptivos de las variables.
5. Crear un segundo conjunto de datos ordenado con la media de cada variable para cada actividad y cada sujeto.

## Resultado final

- `tidy_data_avg.txt`: Conjunto de datos ordenado final con la media de cada variable para cada actividad y cada sujeto.
