import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'air_quality_cubit.freezed.dart';
part 'air_quality_state.dart';

class AirQualityCubit extends Cubit<AirQualityState> {
  AirQualityCubit() : super(const AirQualityState());
  String html = ''' 
  <!DOCTYPE html>
<html>

<body>
    <table class="styled-table" cellspacing="0" cellpadding="0" border="1">
        <tbody>
            <tr>
                <td colspan="6" valign="middle" align="center"><strong id="TIME">Data: 19.6.2023, Ora: 22:00</strong>*
                    <br>
                </td>
            </tr>
            <!-- <div><b id="TIME" ></b></div> -->
            <tr>
                <td colspan="3" valign="middle" align="center"><strong>Rădăuți Centru </strong></td>
                <td colspan="3" valign="middle" align="center"><strong>Rădăuți Est</strong></td>

            </tr>
            <tr>
                <td colspan="3" valign="middle" align="center"><img decoding="async" loading="lazy" id="myImg"
                        src="https://www.radautiulcivic.ro/wp-content/uploads/2021/07/Calitatea_aerului_moderata.png"
                        width="50" height="50"> </td>
                <td colspan="3" valign="middle" align="center"><img decoding="async" loading="lazy" id="myImg_depozit"
                        src="https://www.radautiulcivic.ro/wp-content/uploads/2021/07/Calitatea_aerului_rea.png"
                        width="50" height="50"> </td>
            </tr>
            <tr>
                <td colspan="3" id="cell_color" style="color: black; background-color: rgb(240, 230, 65);"
                    valign="middle" align="center">MODERATĂ</td>
                <td colspan="3" id="cell_color_depozit" style="color: black; background-color: rgb(255, 80, 80);"
                    valign="middle" align="center">REA</td>
            </tr>

            <tr>
                <td colspan="1" align="center">PM2.5</td>
                <td colspan="2" align="center">CO2 </td>
                <td colspan="2" align="center">PM2.5</td>
                <td colspan="1" align="center">PM10</td>
            </tr>
            <tr>
                <td colspan="1" align="center"><b id="PM2_CENTRU">20 <br>μg/m<sup>3</sup></b> <br> </td>
                <td colspan="2" valign="middle" align="center"><b id="CO2">439 <br>ppm</b> <br></td>
                <td colspan="2" align="center"><b id="PM2_DEPOZIT">25 <br>μg/m<sup>3</sup></b> <br> </td>
                <td colspan="1" valign="middle" align="center"><b id="PM10_DEPOZIT">38 <br>μg/m<sup>3</sup></b> <br>
                </td>
            </tr>

            <tr>
                <td colspan="3" valign="middle" align="center"><strong>Rădăuți Nord </strong></td>
                <td colspan="3" valign="middle" align="center"><strong>Rădăuți Vest </strong></td>

            </tr>
            <tr>
                <td colspan="3" valign="middle" align="center"><img decoding="async" loading="lazy"
                        id="myImg_bazar_auto"
                        src="https://www.radautiulcivic.ro/wp-content/uploads/2021/07/Calitatea_aerului_acceptabila.png"
                        width="50" height="50"> </td>
                <td colspan="3" valign="middle" align="center"><img decoding="async" loading="lazy" id="myImg_iesire_SV"
                        src="https://www.radautiulcivic.ro/wp-content/uploads/2021/07/Calitatea_aerului_rea.png"
                        width="50" height="50"> </td>
            </tr>
            <tr>
                <td colspan="3" id="cell_color_bazar_auto"
                    style="color: black; font-style: normal; background-color: rgb(80, 204, 170);" valign="middle"
                    align="center">ACCEPTABILĂ</td>
                <td colspan="3" id="cell_color_iesire_SV"
                    style="color: black; font-style: normal; background-color: rgb(255, 80, 80);" valign="middle"
                    align="center">REA</td>
            </tr>

            <tr>
                <td colspan="1" align="center">PM2.5</td>
                <td colspan="2" align="center">PM10 </td>
                <td colspan="2" align="center">PM2.5</td>
                <td colspan="1" align="center">PM10</td>
            </tr>
            <tr>
                <td colspan="1" align="center"><b id="PM2_BAZAR_AUTO">18 <br>μg/m<sup>3</sup></b> <br> </td>
                <td colspan="2" valign="middle" align="center"><b id="PM10_BAZAR_AUTO">27.5 <br>μg/m<sup>3</sup></b>
                    <br>
                </td>
                <td colspan="2" align="center"><b id="PM2_iesire_SV">46 <br>μg/m<sup>3</sup></b> <br> </td>
                <td colspan="1" valign="middle" align="center"><b id="PM10_iesire_SV">78 <br>μg/m<sup>3</sup></b> <br>
                </td>
            </tr>

            <tr>
                <td colspan="6" style="background-color:rgb(228, 228, 228);color:black" valign="middle" align="center">
                    <strong>Stația Meteo (Stefan Cel Mare Nr.132)</strong> <br>
                </td>

            </tr>
            <tr>
                <td colspan="3" valign="middle" align="center">Temperatura</td>
                <td colspan="3" valign="middle" align="center">Umiditatea</td>
            </tr>
            <tr>
                <td colspan="3" valign="middle" align="center"><b id="TEMPMETEO">17.2°C</b> <br> </td>
                <td colspan="3" valign="middle" align="center"><b id="HUMMETEO">89 %</b> <br></td>
            </tr>
            <tr>
                <td colspan="3" valign="middle" align="center">Viteza Vantului</td>
                <td colspan="3" valign="middle" align="center">Presiunea</td>
            </tr>
            <tr>
                <td colspan="3" valign="middle" align="center"><b id="VANT">1.1 m/s</b> <br> </td>
                <td colspan="3" valign="middle" align="center"><b id="PRESIUNEA">971.3 mBar</b> <br> </td>
            </tr>
            <tr>

                <td colspan="3" valign="middle" align="center">Direcția vantului</td>
                <td colspan="3" valign="middle" align="center">Direcția vantului</td>
            </tr>
            <tr>
                <td colspan="3" valign="middle" align="center"><b id="DIRECTIA">VSV</b><b id="SAGEATA"
                        style="transform: rotate(337.5deg); display: inline-block;">→</b> <br> </td>
                <td colspan="3" valign="middle" align="center"><b id="DIRECTIAGEO">Marginea</b><br> </td>
            </tr>
            <tr>
                <td colspan="6" valign="middle" align="center">
                    <div class="chartjs-size-monitor">
                        <div class="chartjs-size-monitor-expand">
                            <div class=""></div>
                        </div>
                        <div class="chartjs-size-monitor-shrink">
                            <div class=""></div>
                        </div>
                    </div><canvas id="PM25" style="display: block; width: 360px; height: 326px;"
                        class="chartjs-render-monitor" width="360" height="326">test</canvas>
                </td>
            </tr>
            <tr>
                <td colspan="6" valign="middle" align="center">*Datele se actualizează o dată pe oră<br> </td>
            </tr>
            <tr>


            </tr>

        </tbody>
    </table>
</body>

</html>''';
  void getQuality() async {
    try {
      // emit(state.copyWith(qualityStatus: QualityStatus.inProgress));
      // final response =
      //     await http.get(Uri.parse('https://calitateaer.radautiulcivic.ro'));
      // if (response.statusCode == 200) {
      //   //  final parsedHtml = parser.parse(response.body);
      //   // final tag = parsedHtml.querySelector('.styled-table')?.outerHtml;
      //   emit(
      //     state.copyWith(
      //       qualityStatus: QualityStatus.success,
      //       qualityHtml: html,
      //     ),
      //   );
      // } else {
      //   throw Exception();
      // }
    } catch (e) {
      emit(state.copyWith(qualityStatus: QualityStatus.failure));
    }
  }
}
