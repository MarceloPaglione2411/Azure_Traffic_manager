# Azure_Traffic_manager

Nesse projeto criei: 2 AppService Plan - ! vm na região EASTUS - Traffic manager Profile - 2 Traffic manager endpoint

O Azure Traffic Manager é um balanceador de carga de tráfego baseado no DNS. Esse serviço permite distribuir o tráfego para seus aplicativos voltados ao público nas regiões globais do Azure. Também fornece alta disponibilidade e rápida capacidade de resposta aos seus pontos de extremidade públicos.

Usa quatro métodos diferentes de roteamento. 

Prioridade: use um aplicativo primário para todo o tráfego e forneça backups caso o backup primário ou os aplicativos de backup não estejam disponíveis.

Ponderada: distribua tráfego em um conjunto de aplicativos, seja uniformemente ou acordo com pesos, o que você definir.

Desempenho: quando você tiver aplicativos em diferentes localizações geográficas, use o aplicativo "mais próximo" em termos da menor latência de rede.

Geográfico: direcionar os usuários para aplicativos específicos com base em qual localização geográfica a consulta DNS se origina.


