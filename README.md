# Bat Connect Demo v1.4.0 — Firebase configurado

Versão de teste com fluxo compartilhado Empresa <-> Batedor, GPS e Firebase/Cloud Firestore habilitado por padrão.

## Firebase

O projeto já contém `android/app/google-services.json` e usa o pacote Android `com.batconnect.app`, correspondente ao app registrado no Firebase.

Não é mais necessário passar API key ou outros `--dart-define` para o build normal.

## Rodar

```bash
flutter pub get
flutter run
```

## Gerar APK

```bash
flutter pub get
flutter build apk --release
```

APK esperado:
`build/app/outputs/flutter-apk/app-release.apk`

## Testar sincronização

1. Instale o mesmo APK em dois aparelhos.
2. Em um aparelho, entre como Empresa e confirme a equipe.
3. No outro, entre como Batedor, fique ONLINE e aceite.
4. O estado deve ser compartilhado por `demoOperations/shared_demo`.

## Firestore

Antes do teste conectado, confirme que o Cloud Firestore foi criado no Console Firebase e publique o arquivo `firestore.rules`. As regras incluídas liberam a coleção da demo sem autenticação e são somente para teste.

## GPS Android

As permissões de internet e localização já estão no `AndroidManifest.xml`. O app solicita a permissão durante o fluxo e envia posição aproximadamente a cada 15 m de deslocamento.

## Ainda não implementado nesta demo

- Firebase Authentication/perfis reais.
- Google Maps real/polylines.
- Firebase Storage para selfie e comprovante.
- FCM/push notifications.
- Bat Collect com PIX/boleto reais.
- Regras de segurança de produção.

## Forçar modo local

Se precisar testar sem Firebase:

```bash
flutter run --dart-define=USE_FIREBASE=false
```

## Firebase real - v1.4 revisada

O Android usa o pacote `com.batconnect.app` e o arquivo `android/app/google-services.json` do projeto Firebase `bat-connect-7172d`.

Ao iniciar, o app agora testa uma leitura real do Cloud Firestore. Se o Firestore não estiver criado, estiver bloqueado por regras ou houver falha de conexão, a demo informa o erro e continua em modo local.

Para publicar somente as regras temporárias da demo:

```bash
bash scripts/deploy_demo_firestore_rules.sh
```

Para preparar o Gradle Wrapper compatível com o Flutter instalado e gerar APK debug:

```bash
bash scripts/build_debug_apk.sh
```

O APK esperado fica em `build/app/outputs/flutter-apk/app-debug.apk`.

> As regras atuais permitem acesso público apenas ao documento `demoOperations/shared_demo` para o teste em dois aparelhos. Não usar em produção.
