# facturas para cada mes y cada cliente
clientes = read.delim("datos_clientes.csv", sep = ";", header = TRUE, stringsAsFactors = FALSE)

fechas_ini_fact = seq(as.Date("2016-01-01"),as.Date("2016-12-01"),by="month")
fechas_fin_fact = c(fechas_ini_fact[-1] -1,as.Date("2016-12-31"))

for (i in 1:nrow(clientes)) {
  for(j in 1:length(fechas_ini_fact)){
    cliente<-as.list(clientes[i,])
    inicio_factura<-as.character(fechas_ini_fact[j])
    fin_factura = as.character(fechas_fin_fact[j])
    rmarkdown::render("plantilla.Rmd",
                      output_file = paste0("facturas_generadas/factura_cliente_id",cliente$id,format(as.Date(inicio_factura),"%b%Y"),".html"),
                      params = list(cliente=cliente, inicio_factura=inicio_factura, fin_factura=fin_factura))
  }
}

