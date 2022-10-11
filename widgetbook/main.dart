import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:widgetbook/widgetbook.dart';

import 'components/dialogs/dialog.dart';
import 'theme/nesp_theme.dart';
import 'components/badges/badge.dart';
import 'components/buttons/button.dart';

class WidgetbookHotReload extends StatefulWidget {
  const WidgetbookHotReload({super.key});

  @override
  State<WidgetbookHotReload> createState() => _WidgetbookHotReloadState();
}

class _WidgetbookHotReloadState extends State<WidgetbookHotReload> {
  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();

    NespDialog.init(navigatorKey);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      builder: (context, child) => child!,
      theme: NespTheme.light,
      home: Center(
        child: Widgetbook.material(
          appInfo: AppInfo(name: 'Nesp'),
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
                                initialValue: 'Primary',
                              ),
                              radius: context.knobs
                                  .number(
                                    label: 'Border radius',
                                    initialValue: 8.0,
                                  )
                                  .toDouble(),
                              outlined: context.knobs.boolean(
                                label: 'Outlined',
                                initialValue: false,
                              ),
                              loading: context.knobs.boolean(
                                label: 'Loading',
                                initialValue: false,
                              ),
                              prefixIcon: context.knobs.boolean(
                                label: 'Prefix Icon',
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
                                initialValue: 'Primary',
                              ),
                              radius: context.knobs
                                  .number(
                                    label: 'Border radius',
                                    initialValue: 8.0,
                                  )
                                  .toDouble(),
                              outlined: true,
                              loading: context.knobs.boolean(
                                label: 'Loading',
                                initialValue: false,
                              ),
                              prefixIcon: context.knobs.boolean(
                                label: 'Prefix Icon',
                                initialValue: false,
                              )
                                  ? Icons.circle_outlined
                                  : null,
                              suffixIcon: context.knobs.boolean(
                                label: 'Suffix Icon',
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
                      name: 'default',
                      builder: (context) => Center(
                        child: NespBadges(
                          context.knobs.text(
                            label: 'Label',
                            initialValue: 'LABEL',
                          ),
                          type: context.knobs.options<BadgeType>(
                            label: 'Type',
                            options: BadgeType.values
                                .map(
                                  (e) => Option(label: e.name, value: e),
                                )
                                .toList(),
                          ),
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
            WidgetbookCategory(
              name: 'Dialogs',
              widgets: [
                WidgetbookComponent(
                  name: 'Dialog',
                  useCases: [
                    WidgetbookUseCase(
                      name: 'default',
                      builder: (context) {
                        final title = context.knobs.text(label: 'title', initialValue: 'Dialog Title');
                        final description = context.knobs.text(
                          label: 'description',
                          initialValue:
                              'Este é um texto de espaço reservado. A caixa de diálogo básica para modais deve conter apenas informações valiosas e relevantes. Simplifique as caixas de diálogo removendo elementos desnecessários.',
                        );

                        final primaryButtonLabel = context.knobs.nullableText(
                          label: 'primary button label',
                          initialValue: 'Confirm',
                        );
                        final secondaryButtonLabel = context.knobs.nullableText(
                          label: 'secondary button label',
                          initialValue: 'Cancel',
                        );

                        return Center(
                          child: NespButton(
                            'Open dialog',
                            onPressed: () {
                              NespDialog.show(
                                title: title,
                                description: description,
                                primaryButtonSettings: primaryButtonLabel == null
                                    ? null
                                    : NespDialogButtonProps(
                                        label: primaryButtonLabel,
                                      ),
                                secondaryButtonSettings: secondaryButtonLabel == null
                                    ? null
                                    : NespDialogButtonProps(
                                        label: secondaryButtonLabel,
                                      ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const WidgetbookHotReload());
}
