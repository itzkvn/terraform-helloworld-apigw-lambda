# Hello World - API Gateway + Lambda

### Requisitos de ejecución

- Docker

Mi motivación para ejecutarlo con un wrapper es poder lockear las versiones de los binarios y evitar problemas de retrocompatibilidad con algun modulo de terraform.


### Pasos para ejecutar

```bash
# En el root del repositorio
docker build -t "tf-wrapper" .
./tf init
# Es necesario tener un archivo llamado aws_credentials en el root del repositorio que posteriormente se monta en el container del wrapper
./tf apply
```