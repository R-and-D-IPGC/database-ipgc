construir_mapa_cidade_destacada <- function(codigo_estado,codigo_cidade) {
  library(brazilmaps)
  library(ggplot2)
  estado <- get_brmap(geo = "City", geo.filter = list(State = codigo_estado))
  num_cidades = length(estado$City)
  df_cidade = data.frame(estado$City, rep(0,num_cidades))
  colnames(df_cidade) = c("cod_cidade","destacar")
  pos_cidade = which(df_cidade$cod_cidade == codigo_cidade)
  df_cidade$destacar[pos_cidade]=1
  mapa_destaque_cidade = plot_brmap(estado, data_to_join=df_cidade,
                                    join_by=c("City"="cod_cidade"),
                                    var="destacar")
  mapa_destaque_cidade = mapa_destaque_cidade +
    scale_fill_gradient(low='grey', high='red') +
    theme(legend.position = "none")
  return(mapa_destaque_cidade)
}
