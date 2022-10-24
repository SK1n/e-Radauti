import 'package:flutter/material.dart';
import 'package:flutterapperadauti/modules/air_quality/views/color_legend_widget.dart';
import 'package:flutterapperadauti/modules/air_quality/views/legend_widget.dart';

class AirQualityLegend extends StatelessWidget {
  const AirQualityLegend({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        LegendWidget(
          collapsedTitle: 'Unde este instalat aparatul?',
          expandedTitle: 'Unde este instalat aparatul?',
          expandedContent:
              'Aparatul de monitorizare a calității aerului este instalat în centrul Municipiului Rădăuți, în Piața Garoafelor și măsoară concentrația de PM2,5, de CO2, temperatura și Umiditatea Relativă. Stația Meteo din Rădăuți este cea oficială instalată de autoritățile române. Stația se află pe Str. Ștefan cel Mare, Nr. 132 și măsoară temperatura, umiditatea relativă, viteza vântului, direcția vântului și presiunea atmosferică.',
        ),
        LegendWidget(
          collapsedTitle: 'Ce sunt particulele PM2,5?',
          expandedTitle: 'Ce sunt particulele PM2,5?',
          expandedContent:
              'Particulele PM2,5 sunt particule cu diametrul de sub 2.5 micrometri (aproximativ 100 de ori mai mici decât firul de păr uman) produse de către procesul de ardere a diferiților combustibili precum Diesel, biomasă, cărbune, deșeuri etc.\n\nFiind atât de mici și pătrunzând cu ușurină în plămâni, particulele PM2,5 sunt cele mai periculoase pentru sănătate, în special în mediul urban. Se estimează că anual, în Uniunea Europeană, peste 400.000 de oameni mor prematur din cauza expunerii la o concentrație mare de particule PM2,5.\n\nÎn România, numărul estimativ ajunge la aproximativ 25.000. Aceste particule sunt atât de mici încât pătrund cu ușurință în sistemul respirator și în sistemul circulator, cauzând probleme cardiace sau pulmonare precum astm bronșitic.\n\nLimita maximă medie anuală stabilită de către Uniunea Europeană este de 25 μg/m\u00B3 iar în SUA de 12 μg/m\u00B3. Valori de peste 25 μg/m\u00B3 vor fi observate mereu pe aparat, în special atunci când sunt inversiuni termice.\n\n Este foarte important ca valorile să nu crească foarte mult iar expunerea să nu fie de lungă durată.',
        ),
        LegendWidget(
          collapsedTitle: 'Ce înseamnă culoarea fundalului?',
          expandedTitle: 'Ce înseamnă culoarea fundalului?',
          expandedWidget: ColorLegendWidget(),
        ),
        LegendWidget(
          collapsedTitle: 'Ce spune legea legat de calitatea aerului?',
          expandedTitle: 'Ce spune legea legat de calitatea aerului?',
          expandedContent:
              'În România, legea principală care oferă informații substanțiale despre subiectul calitatea aerului este Legea Nr. 104 din 2011. Culorile și scara de concentrații din această aplicație sunt aliniate cu Ordinul nr. 1.818 din 2 octombrie 2020 și ia în considerare prevederile art. 87 alin. (2) din Legea nr. 104/2011 privind calitatea aerului înconjurător, cu modificările ulterioare în temeiul art. 57 alin. (1), (4) și (5) din Ordonanța de urgență a Guvernului nr. 57/2019 privind Codul administrativ, cu modificările și completările ulterioare, și al art. 13 alin. (4) din Hotărârea Guvernului nr. 43/2020 privind organizarea și funcționarea Ministerului Mediului, Apelor și Pădurilor',
        ),
        LegendWidget(
          collapsedTitle: 'Unde găsesc mai multe informații?',
          expandedTitle: 'Unde găsesc mai multe informații?',
          expandedContent:
              'Echipa Rădăuțiul Civic a construit o pagină specială pentru o descriere în detaliu a parametrilor de calitatea aerului (http://calitateaer.radautiulcivic.ro). Pagina conține grafice care arată cum evoluează în timp concentrația de PM2,5, CO2, Umiditatea Relativă, Viteza și Direcția Vântului, Temperatura și Presiunea Atmosferică. Pagina poate fi accesată pe www.radautiulcivic.ro/calitatea-aerului',
        ),
      ],
    );
  }
}
//
