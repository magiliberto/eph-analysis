# eph-analysis
Data Analysis of the Permanent Household Survey (EPH) published by [INDEC](https://www.indec.gob.ar/indec/web/Institucional-Indec-BasesDeDatos).

Restore renv
```{bash}
R -s -e "renv::restore()"
```

Run on a Docker container
```
# 1 - build the image with the Dockerfile

# 2 - run a container with the image syncking folders
# 2.1 - With Rstudio (for interactive development)

project_name="eph-analysis"
docker build -t $project_name:4.2.2 ./docker-rstudio

sudo docker run -ti --rm -p 8989:8787 \
	-v "$PWD":/home/rstudio/"$project_name" \
	-v "$HOME"/.config/rstudio:/home/rstudio/.config/rstudio \
	-w /home/rstudio/"$project_name" \
	-e PASSWORD=ds $project_name:4.2.2


# 2.2 - For shinny and quarto publications

```