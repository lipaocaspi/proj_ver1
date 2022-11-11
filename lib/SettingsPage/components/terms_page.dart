import 'package:flutter/material.dart';
import 'package:proj_ver1/responsive.dart';

class TermsPage extends StatelessWidget {
  const TermsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: MobileTermsPage(),
    );
  }
}

class MobileTermsPage extends StatelessWidget {
  const MobileTermsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Términos y Condiciones"),
      ),
      body: Column(children: [
        Container(
          padding: EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 15),
          child: InkWell(
            onTap: () {},
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: Icon(Icons.document_scanner),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child:
                            Text("Términos y condiciones de uso de UIS Wheels"),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 15, right: 15, bottom: 10),
          child: InkWell(
            onTap: () {},
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: Icon(Icons.privacy_tip),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: Text("Aviso de privacidad de UIS Wheels"),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
