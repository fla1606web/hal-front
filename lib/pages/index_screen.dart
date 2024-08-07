import 'package:flutter/material.dart';
import 'package:flutter_app/values/app_routes.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sidebarx/sidebarx.dart';
import 'base_container.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({super.key});

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final _formKey = GlobalKey<FormState>();

  void initializeControllers() {}

  void disposeControllers() {}

  void controllerListener() {}

  @override
  void initState() {
    initializeControllers();
    super.initState();
  }

  @override
  void dispose() {
    disposeControllers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _controller = SidebarXController(selectedIndex: 0, extended: false);

    return BaseContainer(
      key: _formKey,
      title: "HAL",
      controller: _controller,
      child: body(context),
    );
  }
}

Stack body(BuildContext context) {
  return Stack(children: [
    Container(
      margin: EdgeInsets.fromLTRB(65, 66, 0, 0),
      color: Colors.blueGrey[50],
      child: Row(
        children: [
          Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(15, 10, 0, 0),
                child: RichText(
                  text: TextSpan(
                    text: "Crea tu primera aplicación",
                    style: GoogleFonts.getFont(
                      'Fredoka',
                      fontWeight: FontWeight.w500,
                      fontSize:
                          MediaQuery.of(context).size.width < 600 ? 18 : 25,
                      color: Color(0xFF000000),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 40, 20, 0),
                padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: RichText(
                  text: TextSpan(
                    text: "Aplicaciones/Crear Aplicación",
                    style: GoogleFonts.getFont(
                      'Fredoka',
                      fontWeight: FontWeight.w400,
                      fontSize:
                          MediaQuery.of(context).size.width < 600 ? 13 : 18,
                      color: Color(0xFF000000),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
    Container(
      color: Colors.blueGrey[50],
      margin: EdgeInsets.fromLTRB(65, 200, 0, 0),
      child: Container(
        margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: GridView.builder(
            itemCount: items.length,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 400,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                childAspectRatio: 2.9 / 0.8),
            itemBuilder: (context, i) {
              return Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFF000000)),
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                child: Container(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(10, 15, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Opacity(
                            opacity: 0.3,
                            child: Container(
                              width: MediaQuery.of(context).size.width < 400
                                  ? 35
                                  : 50,
                              height: MediaQuery.of(context).size.height < 400
                                  ? 35
                                  : 50,
                              child: SvgPicture.asset(
                                'assets/vectors/gallery_1_x2.svg',
                              ),
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 2, 0, 4),
                              child: TextButton.icon(
                                onPressed: () => (Navigator.pushNamed(
                                    context, items[i].url.toString())),
                                label: Text(items[i].title.toString()),
                                style: TextButton.styleFrom(
                                    textStyle: GoogleFonts.getFont(
                                      'Fredoka',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20,
                                    ),
                                    foregroundColor: Color(0xFF000000)),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: RichText(
                                text: TextSpan(
                                  text: "Lorem Ipsum",
                                  style: GoogleFonts.getFont(
                                    'Fredoka',
                                    fontWeight: FontWeight.w400,
                                    fontSize:
                                        MediaQuery.of(context).size.width < 600
                                            ? 11
                                            : 15,
                                    color: Color(0xFF000000),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    ),
  ]);
}

List<ItemList> items = [
  ItemList(title: 'Crea una base de datos', url: AppRoutes.createDatabase),
  ItemList(
    title: 'Usar un template',
  ),
  ItemList(title: 'Datos', url: AppRoutes.dataEntity)
];

class ItemList {
  String? title;
  String? url;
  ItemList({this.title, this.url});
}
