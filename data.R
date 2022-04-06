library(pxweb)
Sys.setlocale(locale="UTF-8")

d <- pxweb_interactive()

# Schooling ----

# PXWEB query 
pxweb_query_list <- 
  list("Vuosi"=c("2020"),
       "Muuttomaa"=c("SSS","EUR","528","008","020","056","070","100","890","810","891","200","724","372","352","380","040","832","300","191","196","428","438","440","442","470","833","498","492","499","578","807","620","616","250","642","752","276","674","688","703","705","756","208","203","792","804","348","112","336","643","233","826","AFR","012","024","204","072","854","108","262","818","232","710","728","231","266","270","288","324","624","120","132","404","140","174","178","180","426","430","434","450","454","466","504","478","480","508","516","562","566","384","226","646","894","678","686","690","694","706","729","748","834","768","148","788","800","716","AME","028","032","044","052","084","068","076","152","188","212","214","218","222","530","308","320","328","332","340","388","124","170","192","484","558","591","600","604","659","662","670","740","780","858","862","840","AAS","004","784","051","031","048","050","064","096","410","608","268","360","356","368","364","376","626","392","887","400","116","398","156","417","414","418","422","462","458","496","104","524","512","586","275","408","634","682","702","144","760","762","764","795","860","704","OSE","036","242","296","584","583","520","585","598","090","882","776","798","554","548","X"),
       "Koulutusaste"=c("SSS","3","4","5","6","7","8","9_X"),
       "Sukupuoli"=c("SSS","1","2"),
       "Ikä"=c("18-","18-24","25-34","35-44","45-54","55-64","65-74","75-"),
       "Tiedot"=c("vm41_kansa_246"))

# Download data 
px_data <- 
  pxweb_get(url = "https://statfin.stat.fi/PXWeb/api/v1/fi/StatFin/muutl/statfin_muutl_pxt_11ac.px",
            query = pxweb_query_list)

# Convert to data.frame 
px_data_frame <- as.data.frame(px_data, column.name.type = "text", variable.value.type = "text")

# Get pxweb data comments 
px_data_comments <- pxweb_data_comments(px_data)
px_data_comments_df <- as.data.frame(px_data_comments)

# Cite the data as 
pxweb_cite(px_data)

# Municipalities ----

# PXWEB query 
pxweb_query_list <- 
  list("Alue"=c("SSS","MA1","MK01","MK02","MK04","MK05","MK06","MK07","MK08","MK09","MK10","MK11","MK12","MK13","MK14","MK15","MK16","MK17","MK18","MK19","MK21"),
       "Tiedot"=c("toimintakate_asuk","vuosikate_asuk","verotulot_asuk","valtionosuus_asuk","vuosikate_poisto","inv_omahankintamen","inv_tulorah","rahavarat_asuk","omavaraisuus_aste","kertynyt_yli_ali_eur","kertynyt_yli_ali_asuk","suhteel_velkaant","lainakanta_eur","lainakanta_asuk","lainat_vuokravastuut_eur","lainat_vuokravastuut_asuk","lainasaamiset_eur","k_vuosikate_poisto","k_vuosikate_asuk","k_inv_omahankintamen","k_inv_tulorah","k_kertynyt_yli_ali_eur","k_kertynyt_yli_ali_asuk","k_lainakanta_eur","k_lainakanta_asuk","k_lainat_vuokravastuut_eur","k_lainat_vuokravastuut_asuk","k_lainasaamiset_eur","sote_kayttokustannukset","sote_kayttotuotot","sote_netto_kayttokust","sote_netto_kayttokust_asuk","opek_kayttokustannukset","opek_kayttotuotot","opek_netto_kayttokust","opek_netto_kayttokust_asuk"),
       "Vuosi"=c("2020"))

# Download data 
px_data <- 
  pxweb_get(url = "https://statfin.stat.fi/PXWeb/api/v1/fi/StatFin/kta/statfin_kta_pxt_12ml.px",
            query = pxweb_query_list)

# Convert to data.frame 
px_data_frame <- as.data.frame(px_data, column.name.type = "text", variable.value.type = "text")

# Get pxweb data comments 
px_data_comments <- pxweb_data_comments(px_data)
px_data_comments_df <- as.data.frame(px_data_comments)

# Cite the data as 
pxweb_cite(px_data)

# Municipalities 1987-2019 ----

# PXWEB query 
pxweb_query_list <- 
  list("Alue 2020"=c("SSS","020","005","009","010","016","018","019","035","043","046","047","049","050","051","052","060","061","062","065","069","071","072","074","075","076","077","078","079","081","082","086","111","090","091","097","098","099","102","103","105","106","108","109","139","140","142","143","145","146","153","148","149","151","152","165","167","169","170","171","172","176","177","178","179","181","182","186","202","204","205","208","211","213","214","216","217","218","224","226","230","231","232","233","235","236","239","240","320","241","322","244","245","249","250","256","257","260","261","263","265","271","272","273","275","276","280","284","285","286","287","288","290","291","295","297","300","301","304","305","312","316","317","318","398","399","400","407","402","403","405","408","410","416","417","418","420","421","422","423","425","426","444","430","433","434","435","436","438","440","441","475","478","480","481","483","484","489","491","494","495","498","499","500","503","504","505","508","507","529","531","535","536","538","541","543","545","560","561","562","563","564","309","576","577","578","445","580","581","599","583","854","584","588","592","593","595","598","601","604","607","608","609","611","638","614","615","616","619","620","623","624","625","626","630","631","635","636","678","710","680","681","683","684","686","687","689","691","694","697","698","700","702","704","707","729","732","734","736","790","738","739","740","742","743","746","747","748","791","749","751","753","755","758","759","761","762","765","766","768","771","777","778","781","783","831","832","833","834","837","844","845","846","848","849","850","851","853","857","858","859","886","887","889","890","892","893","895","785","905","908","092","915","918","921","922","924","925","927","931","934","935","936","941","946","976","977","980","981","989","992","MK01","MK02","MK04","MK05","MK06","MK07","MK08","MK09","MK10","MK11","MK12","MK13","MK14","MK15","MK16","MK17","MK18","MK19","MK21","SK011","SK014","SK015","SK016","SK021","SK022","SK023","SK024","SK025","SK041","SK043","SK044","SK051","SK052","SK053","SK061","SK063","SK064","SK068","SK069","SK071","SK081","SK082","SK091","SK093","SK101","SK103","SK105","SK111","SK112","SK113","SK114","SK115","SK122","SK124","SK125","SK131","SK132","SK133","SK134","SK135","SK138","SK141","SK142","SK144","SK146","SK151","SK152","SK153","SK154","SK161","SK162","SK171","SK173","SK174","SK175","SK176","SK177","SK178","SK181","SK182","SK191","SK192","SK193","SK194","SK196","SK197","SK211","SK212","SK213"),
       "Tiedot"=c("M408","M411","M476","M391","M421","M478","M404","M410","M303","M297","M302","M44","M62","M70","M488","M486","M137","M140","M130","M162","M78","M485","M152","M72","M84","M106","M151","M499","M496","M495","M497","M498"),
       "Vuosi"=c("1987","1988","1989","1990","1991","1992","1993","1994","1995","1996","1997","1998","1999","2000","2001","2002","2003","2004","2005","2006","2007","2008","2009","2010","2011","2012","2013","2014","2015","2016","2017","2018","2019"))

# Download data 
px_data <- 
  pxweb_get(url = "https://pxwebapi2.stat.fi/PXWeb/api/v1/fi/Kuntien_avainluvut/2020/kuntien_avainluvut_2020_aikasarja.px",
            query = pxweb_query_list)

# Convert to data.frame 
px_data_frame <- as.data.frame(px_data, column.name.type = "text", variable.value.type = "text")

# Get pxweb data comments 
px_data_comments <- pxweb_data_comments(px_data)
px_data_comments_df <- as.data.frame(px_data_comments)

# Cite the data as 
pxweb_cite(px_data)

# Data manipulation ----

library(tidyverse)

data <- px_data_frame %>% as_tibble()
data <- data %>% rename(Alue = `Alue 2020`, Luvut = `Kuntien avainluvut`)
data <- data %>% pivot_wider(id_cols = c(Alue, Vuosi), names_from = Tiedot, values_from = Luvut)
data %>% head()
data %>% glimpse()

muni <- data %>% filter(!grepl('koko maa|maakunta|seutukunta', Alue, ignore.case = T))

# Latest available data
muni.latest <- municipalities %>% 
  group_by(Alue) %>% 
  drop_na() %>% 
  slice(which.max(Vuosi)) %>%
  select(-Vuosi) %>% 
  arrange(desc(Väkiluku))
  
# 20 biggest municipalities 
g20.names <- muni.latest %>% head(20) %>% select(Alue)
g20.data <- muni.latest %>% filter(Alue %in% greatest20.names$Alue)

g20.data.pca <- g20.data %>% column_to_rownames(var = 'Alue')
g20.pca <- prcomp(g20.data.pca, scale. = T)
g20.pca$sdev^2/sum(g20.pca$sdev^2)*100 %>% round(digits = 2)
g20.pca$rotation[,1] %>% sort()

# All municipalities
muni.latest.pca <- muni.latest %>% column_to_rownames(var = "Alue")
muni.pca <- prcomp(muni.latest.pca, scale. = T)
muni.pca$sdev^2/sum(muni.pca$sdev^2)*100
muni.pca$rotation[,1] %>% sort()
