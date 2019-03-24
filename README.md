# insurgency
Dockerfile que cria uma imagem contendo o servidor do game insurgency.

A imagem é baseada na imagem cm2network/steamcmd que com propriedade faz a instalação e configuração do programa steamcmd.

Para a construção da imagem pode-se passar as seguintes variáveis de ambiente:
$ docker build --build-arg PORT=27015 MAP=buhriz_coop MAXPLAYERS=45 --tag arauto/insurgency:0.1

Ou se preferir, passar quando for iniciar o container:
$ docker run --detached --env "PORT=27015" --env "MAP=buhriz_coop" --env "MAXPLAYERS=45"

Dois volumes são produzidos, insurgency-dedicated e insurgency-logs. O primeiro está direcionado para a pasta do game e o segundo para a pasta logs, contendo o arquivo insurgency.log com as mensagens lançadas no console durante o funcionamento do servidor.
