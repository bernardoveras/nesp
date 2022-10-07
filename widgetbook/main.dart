import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:widgetbook/widgetbook.dart';

import 'components/nesp_badges.dart';
import 'components/nesp_button.dart';
import 'theme/nesp_theme.dart';

class WidgetbookHotReload extends StatelessWidget {
  const WidgetbookHotReload({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      appInfo: AppInfo(
        name: 'Nesp',
      ),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('pt', 'BR'),
      ],
      frames: const [
        WidgetbookFrame(
          name: 'Widgetbook',
          allowsDevices: true,
        ),
        WidgetbookFrame(
          name: 'None',
          allowsDevices: false,
        ),
      ],
      devices: [
        Apple.iPhone12,
        Apple.iPad10Inch,
        Samsung.s10,
        Desktop.desktop1080p,
      ],
      textScaleFactors: [
        1,
        2,
        3,
      ],
      themes: [
        WidgetbookTheme(
          name: 'Light',
          data: NespTheme.light,
        ),
        WidgetbookTheme(
          name: 'Dark',
          data: NespTheme.dark,
        ),
      ],
      categories: [
        WidgetbookCategory(
          name: 'Button',
          widgets: [
            WidgetbookComponent(
              name: 'Button',
              useCases: [
                WidgetbookUseCase(
                  name: 'primary',
                  builder: (context) => LayoutBuilder(builder: (context, constraints) {
                    return Center(
                      child: SizedBox(
                        width: context.knobs.nullableSlider(
                          label: 'Width',
                          initialValue: 150,
                          max: constraints.maxWidth,
                          min: 150,
                        ),
                        height: context.knobs.nullableSlider(
                          label: 'Height',
                          initialValue: 48,
                          max: 100,
                          min: 48,
                        ),
                        child: NespButton(
                          context.knobs.text(
                            label: 'Label',
                            description: 'Texto do botão',
                            initialValue: 'Primary',
                          ),
                          radius: context.knobs
                              .number(
                                label: 'Border radius',
                                initialValue: 8.0,
                                description: 'Arrendondamento do botão',
                              )
                              .toDouble(),
                          outlined: context.knobs.boolean(
                            label: 'Outlined',
                            initialValue: false,
                          ),
                          loading: context.knobs.boolean(
                            label: 'Loading',
                            description: 'Estado de carregamento',
                            initialValue: false,
                          ),
                          prefixIcon: context.knobs.boolean(
                            label: 'Prefix Icon',
                            description: 'Ícone da esquerda',
                            initialValue: false,
                          )
                              ? Icons.circle_outlined
                              : null,
                          suffixIcon: context.knobs.boolean(
                            label: 'Suffix Icon',
                            description: 'Ícone da direita',
                            initialValue: false,
                          )
                              ? Icons.circle_outlined
                              : null,
                          onPressed: () {},
                        ),
                      ),
                    );
                  }),
                ),
                WidgetbookUseCase(
                  name: 'outlined',
                  builder: (context) => LayoutBuilder(builder: (context, constraints) {
                    return Center(
                      child: SizedBox(
                        width: context.knobs.nullableSlider(
                          label: 'Width',
                          initialValue: 150,
                          max: constraints.maxWidth,
                          min: 150,
                        ),
                        height: context.knobs.nullableSlider(
                          label: 'Height',
                          initialValue: 48,
                          max: 100,
                          min: 48,
                        ),
                        child: NespButton(
                          context.knobs.text(
                            label: 'Label',
                            description: 'Texto do botão',
                            initialValue: 'Primary',
                          ),
                          radius: context.knobs
                              .number(
                                label: 'Border radius',
                                initialValue: 8.0,
                                description: 'Arrendondamento do botão',
                              )
                              .toDouble(),
                          outlined: true,
                          loading: context.knobs.boolean(
                            label: 'Loading',
                            description: 'Estado de carregamento',
                            initialValue: false,
                          ),
                          prefixIcon: context.knobs.boolean(
                            label: 'Prefix Icon',
                            description: 'Ícone da esquerda',
                            initialValue: false,
                          )
                              ? Icons.circle_outlined
                              : null,
                          suffixIcon: context.knobs.boolean(
                            label: 'Suffix Icon',
                            description: 'Ícone da direita',
                            initialValue: false,
                          )
                              ? Icons.circle_outlined
                              : null,
                          onPressed: () {},
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ],
        ),
        WidgetbookCategory(
          name: 'Budges',
          widgets: [
            WidgetbookComponent(
              name: 'Budge',
              useCases: [
                WidgetbookUseCase(
                  name: 'custom',
                  builder: (context) => Center(
                    child: NespBadges(
                      'CUSTOM',
                      radius: context.knobs.slider(
                        label: 'Border Radius',
                        initialValue: 4.0,
                        min: 0.0,
                      ),
                      onPressed: () {},
                      foregroundColor: context.knobs.options<Color>(
                        label: 'Cor',
                        options: [
                          const Option(label: 'Teal', value: Colors.teal),
                          const Option(label: 'Roxo', value: Colors.purple),
                          const Option(label: 'Vermelho', value: Colors.red),
                          const Option(label: 'Verde', value: Colors.green),
                          const Option(label: 'Rosa', value: Colors.pink),
                        ],
                      ),
                    ),
                  ),
                ),
                WidgetbookUseCase(
                  name: 'neutral',
                  builder: (context) => Center(
                    child: NespBadges.neutral(
                      'NEUTRAL',
                      radius: context.knobs.slider(
                        label: 'Border Radius',
                        initialValue: 4.0,
                        min: 0.0,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
                WidgetbookUseCase(
                  name: 'primary',
                  builder: (context) => Center(
                    child: NespBadges.primary(
                      'PRIMARY',
                      radius: context.knobs.slider(
                        label: 'Border Radius',
                        initialValue: 4.0,
                        min: 0.0,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
                WidgetbookUseCase(
                  name: 'success',
                  builder: (context) => Center(
                    child: NespBadges.success(
                      'SUCCESS',
                      radius: context.knobs.slider(
                        label: 'Border Radius',
                        initialValue: 4.0,
                        min: 0.0,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
                WidgetbookUseCase(
                  name: 'error',
                  builder: (context) => Center(
                    child: NespBadges.error(
                      'ERROR',
                      radius: context.knobs.slider(
                        label: 'Border Radius',
                        initialValue: 4.0,
                        min: 0.0,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
                WidgetbookUseCase(
                  name: 'warning',
                  builder: (context) => Center(
                    child: NespBadges.warning(
                      'WARNING',
                      radius: context.knobs.slider(
                        label: 'Border Radius',
                        initialValue: 4.0,
                        min: 0.0,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

void main() {
  runApp(
    const WidgetbookHotReload(),
  );
}
