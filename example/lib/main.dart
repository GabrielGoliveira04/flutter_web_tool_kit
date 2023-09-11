import 'package:flutter/material.dart';
import 'package:flutter_web_tool_kit/flutter_web_tool_kit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final scrollController = ScrollController();
  final _formKey = GlobalKey();
  final _infoKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return WebStructureWidget(
        scrollController: scrollController,
        navbar: const WebNavbarWidget.floating(
          navBarAlignment: NavbarAlignment.start,
          // floatingColor: Colors.cyan,
          elevation: 0,
          navLinks: [
            NavlinksWidget(
              label: 'Teste',
              hoverStyle: TextStyle(decoration: TextDecoration.underline),
            ),
            NavlinksWidget(label: 'Teste'),
            NavlinksWidget(label: 'Teste'),
          ],
        ),
        children: [
          WebSectionWidget(
            childrenMainAxisSize: MainAxisSize.min,
            childrenMainAxisAlignment: MainAxisAlignment.center,
            height: MediaQuery.of(context).size.height * 0.89,
            backgroundColor: const Color(0xFFA74C0B),
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.1,
              right: MediaQuery.of(context).size.width * 0.1,
            ),
            children: [
              WebRowWidget(
                mainAxisSize: MainAxisSize.min,
                rowResponsiveItemOrdenation:
                    RowResponsiveItemOrdenation.reverse,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Apoie a Associação da Aldeia Karajá de Aruanã – AAKA: faça uma doação',
                          style: TextStyle(
                              fontSize: 60,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              height: 1.21),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          '“Homenagear, valorizar e ajudar a manter viva a cultura indígena”. Esse é o principal objetivo do projeto A Lenda Tainá-Kan, que reuniu diversos parceiros para contar essa lenda Karajá.',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              height: 1.45,
                              fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(width: 32, height: 32),
                        WebRowWidget(
                          children: [
                            OutlinedButton(
                                onPressed: () {},
                                child: const Text('Conheça mais')),
                            const SizedBox(width: 24, height: 24),
                            ElevatedButton(
                                onPressed: () {},
                                child: const Text('Fazer Doação'))
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(width: 40, height: 40),
                  Container(
                    height: 500,
                    width: 500,
                    color: Colors.amberAccent,
                  )
                ],
              )
            ],
          ),
          WebSectionWidget(
            height: MediaQuery.of(context).size.height * 0.06,
            backgroundColor: const Color(0xFFB66112),
            children: const [],
          ),
          WebSectionWidget(
            height: MediaQuery.of(context).size.height * 0.06,
            backgroundColor: const Color(0xFFCC801C),
            children: const [],
          ),
          WebSectionWidget(
            key: _infoKey,
            childrenMainAxisSize: MainAxisSize.min,
            childrenMainAxisAlignment: MainAxisAlignment.center,
            backgroundColor: const Color(0xffE09A25),
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.1,
                vertical: 66),
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'A nossa homenagem \na Tainá-Kan',
                    style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff1C1300),
                        height: 1.22),
                  ),
                  const SizedBox(height: 90),
                  WebRowWidget(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: DelayedFadeAnimationWidget(
                          widgetKey: _infoKey,
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'A Lenda Tainá-Kan',
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff1C1300),
                                    height: 1.20),
                              ),
                              SizedBox(height: 24),
                              Text(
                                '''Conta a tradição Karajá que Imaeró, uma bela indígena, desejava a estrela Tainá-Kan, conhecida como estrela d'alva. Sua vontade se realizou, mas a estrela se materializou na forma de um velho homem, já enrugado. Imaeró, decepcionada por encontrar um ancião em vez de um jovem, o rejeitou.
                                        No entanto, sua irmã, Denakê, se compadeceu de Tainá-Kan e decidiu que se casaria com ele. O velho homem prometeu cuidar de Denakê e alimentá-la, partindo para a mata. Denakê ouviu que deveria esperá-lo em casa, mas, com o passar das horas, decidiu ir ao seu encontro.
                                        Denakê, então, se deparou com uma surpresa ao encontrá-lo preparando um roçado na mata: Tainá-Kan havia assumido a forma de um guerreiro Karajá, jovem e forte. Ele explica que não apareceu desta forma para Imaeró porque ela não foi capaz de enxergar além do que seus olhos podiam ver. “Seu amor não era por mim, mas, sim, por meu brilho”, disse.
                                        Tainá-Kan foi muito feliz ao lado de Denakê e deu um grande presente ao povo Karajá: ensinou a eles o dom da agricultura.
                                        ''',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff1C1300),
                                    height: 1.45),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 60,
                        height: 60,
                      ),
                      const Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'A homenagem',
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff1C1300),
                                  height: 1.20),
                            ),
                            SizedBox(height: 24),
                            Text(
                              '''Inspirados por essa linda lenda, a nossa homenagem será em forma de cerveja. Criamos, assim, a cerveja A Lenda Tainá-Kan, produzida a partir de uma collab entre a Cervejaria Nacional, a Cruls Cervejaria e a CERROPS Lúpulos do Cerrado, com apoio da Agrária, da Bio4 e do Instituto LeftBank.
                                    ''',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff1C1300),
                                  height: 1.45),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
          WebSectionWidget(
            height: MediaQuery.of(context).size.height * 0.06,
            backgroundColor: const Color(0xFFCC801C),
            children: const [],
          ),
          WebSectionWidget(
            height: MediaQuery.of(context).size.height * 0.06,
            backgroundColor: const Color(0xFFB64D12),
            children: const [],
          ),
          WebSectionWidget(
            height: MediaQuery.of(context).size.height * 0.06,
            backgroundColor: const Color(0xFFA31E0C),
            children: const [],
          ),
          WebSectionWidget(
            childrenMainAxisSize: MainAxisSize.min,
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.1,
                vertical: 66),
            backgroundColor: const Color(0xFF980808),
            children: [
              WebRowWidget(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Doe de forma segura',
                          style: TextStyle(
                              fontSize: 60,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              height: 1.21),
                        ),
                        SizedBox(height: 16),
                        Text(
                          'O Instituto Leftbank é um intermediário entre você e uma causa social. Aliado ao Leftbank criamos um conta segura para que sua doação chegue ao destino sem burocracia.',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              height: 1.45,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(height: 32),
                        Text(
                          'Conhecer site do Instituto Left',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              height: 1.45,
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.underline),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 60,
                    height: 60,
                  ),
                  Flexible(
                    child: DelayedSizeAnimation(
                      widgetKey: _formKey,
                      delay: 500,
                      child: Card(
                          key: _formKey,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(24),
                            child: Column(
                              children: [
                                const Text(
                                  'Insira dados de identificação da doação',
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(height: 48),
                                TextFormField(),
                                const SizedBox(height: 10),
                                TextFormField(),
                                const SizedBox(height: 10),
                                TextFormField(),
                              ],
                            ),
                          )),
                    ),
                  )
                ],
              )
            ],
          ),
          WebSectionWidget(
            height: MediaQuery.of(context).size.height * 0.06,
            backgroundColor: const Color(0xFFA31E0C),
            children: const [],
          ),
          WebSectionWidget(
            height: MediaQuery.of(context).size.height * 0.06,
            backgroundColor: const Color(0xFFB64D12),
            children: const [],
          ),
          WebSectionWidget(
            height: MediaQuery.of(context).size.height * 0.06,
            backgroundColor: const Color(0xFFCC801C),
            children: const [],
          ),
          WebSectionWidget(
            childrenMainAxisSize: MainAxisSize.min,
            childrenMainAxisAlignment: MainAxisAlignment.center,
            backgroundColor: const Color(0xffE09A25),
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.1,
                vertical: 96),
            children: [
              WebRowWidget(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'A nossa conexão com \no Povo Karajá',
                          style: TextStyle(
                              fontSize: 48,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff1C1300),
                              height: 1.22),
                        ),
                        SizedBox(height: 16),
                        Text(
                          '''A equipe do projeto esteve presencialmente na Aldeia Karajá de Aruanã em março de 2023 para se reunir com as lideranças indígenas, o Cacique Raúl e a presidente da Associação da Aldeia Karajá de Aruanã - AAKA, Indiana da Silva. Nesses dias de reunião à beira do Rio Araguaia, além de todos os conteúdos escritos e visuais do projeto terem sido cuidadosamente analisados e validados, tivemos a oportunidade de conhecer ainda mais profundamente a cultura Karajá.
                    ''',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff1C1300),
                              height: 1.45),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 60,
                    height: 60,
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Flexible(
                                child: Container(
                              height: 290,
                              color: Colors.white,
                            )),
                            const SizedBox(
                              width: 20,
                              height: 20,
                            ),
                            Flexible(
                                child: Container(
                                    height: 290, color: Colors.white)),
                          ],
                        ),
                        const SizedBox(
                          width: 20,
                          height: 20,
                        ),
                        Row(
                          children: [
                            Flexible(
                                child: Container(
                                    height: 280, color: Colors.white)),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
          WebSectionWidget(
            height: MediaQuery.of(context).size.height * 0.06,
            backgroundColor: const Color(0xFFE0B465),
            children: const [],
          ),
          WebSectionWidget(
            height: MediaQuery.of(context).size.height * 0.06,
            backgroundColor: const Color(0xFFE0CB9D),
            children: const [],
          ),
          WebSectionWidget(
            height: MediaQuery.of(context).size.height * 0.06,
            backgroundColor: const Color(0xFFE0E4DC),
            children: const [],
          ),
          //Apoiadores
          WebSectionWidget(
            height: MediaQuery.of(context).size.height * 0.89,
            backgroundColor: const Color(0xFFDFF0FA),
            children: const [],
          ),
          WebSectionWidget(
            height: MediaQuery.of(context).size.height * 0.06,
            backgroundColor: const Color(0xFFBBDEEF),
            children: const [],
          ),
          WebSectionWidget(
            height: MediaQuery.of(context).size.height * 0.06,
            backgroundColor: const Color(0xFF9ECFED),
            children: const [],
          ),
          WebSectionWidget(
            height: MediaQuery.of(context).size.height * 0.06,
            backgroundColor: const Color(0xFF80BDE2),
            children: const [],
          ),

          //Produto
          WebSectionWidget(
            childrenMainAxisSize: MainAxisSize.min,
            childrenMainAxisAlignment: MainAxisAlignment.center,
            backgroundColor: const Color(0xff80BDE2),
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.1,
                vertical: 66),
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Conheça a cerveja \na Tainá-Kan',
                    style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff1C1300),
                        height: 1.22),
                  ),
                  const SizedBox(height: 90),
                  WebRowWidget(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'A Criação',
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff1C1300),
                                  height: 1.20),
                            ),
                            SizedBox(height: 24),
                            Text(
                              '''A receita da cerveja foi criada em parceria entre os mestres-cervejeiros da Cervejaria Cruls e da Cervejaria Nacional para ser alinhada ao paladar do brasileiro: leve, fácil de se beber e muito aromática. Leva apenas insumos nacionais, incluindo mandioca, em referência à tradicional alimentação do povo Karajá, e o lúpulo brasileiro Comet, remetendo à estrela Tainá-Kan.
Os maltes Pilsen e Munich foram doados pela Agrária e a levedura American Ale pela Bio4.
                  ''',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff1C1300),
                                  height: 1.45),
                            ),
                            SizedBox(height: 80),
                            Text(
                              'O projeto',
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff1C1300),
                                  height: 1.20),
                            ),
                            SizedBox(height: 24),
                            Text(
                              '''A lata e todos os materiais de comunicação foram produzidos ressaltando a beleza da cultura Karajá, resultado do trabalho voluntário e de detalhada pesquisa da ilustradora Raquel Gomide.
Estão presentes nos materiais a estrela d’alva, Tainá-Kan nas suas versões jovem e idosa, as irmãs Denakê e Imaeró, o Rio Araguaia, a mata, as pinturas corporais, as cores e tons... Todos os detalhes foram cuidadosamente escolhidos para serem fiéis à cultura.
As latas carregam em suas artes QR Codes para captação de doações diretas para a AAKA, através de PIX criado em parceria com o Instituto LeftBank. É um projeto lindo que só se tornou realidade devido a dedicação e doação de tempo, habilidades e produtos dos parceiros envolvidos. Ajude-nos a homenagear, valorizar e ajudar a manter viva a cultura indígena.
                  ''',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff1C1300),
                                  height: 1.45),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 80,
                        height: 80,
                      ),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 466,
                              width: 466,
                              decoration: const BoxDecoration(
                                  color: Colors.white, shape: BoxShape.circle),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
          WebSectionWidget(
            height: MediaQuery.of(context).size.height * 0.06,
            backgroundColor: const Color(0xFF6483AB),
            children: const [],
          ),
          WebSectionWidget(
            height: MediaQuery.of(context).size.height * 0.06,
            backgroundColor: const Color(0xFF765B76),
            children: const [],
          ),
          WebSectionWidget(
            height: MediaQuery.of(context).size.height * 0.06,
            backgroundColor: const Color(0xFF863543),
            children: const [],
          ),
          WebSectionWidget(
            childrenMainAxisSize: MainAxisSize.min,
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.1,
                vertical: 66),
            backgroundColor: const Color(0xFF980808),
            children: [
              WebRowWidget(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Doe de forma segura',
                          style: TextStyle(
                              fontSize: 60,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              height: 1.21),
                        ),
                        SizedBox(height: 16),
                        Text(
                          'O Instituto Leftbank é um intermediário entre você e uma causa social. Aliado ao Leftbank criamos um conta segura para que sua doação chegue ao destino sem burocracia.',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              height: 1.45,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(height: 32),
                        Text(
                          'Conhecer site do Instituto Left',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              height: 1.45,
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.underline),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 60,
                    height: 60,
                  ),
                  Flexible(
                    child: Card(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(24),
                          child: Column(
                            children: [
                              const Text(
                                'Insira dados de identificação da doação',
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(height: 48),
                              TextFormField(),
                              const SizedBox(height: 10),
                              TextFormField(),
                              const SizedBox(height: 10),
                              TextFormField(),
                            ],
                          ),
                        )),
                  )
                ],
              )
            ],
          ),
        ]);
  }
}
