import 'package:ball/ball.dart';
import 'package:pub_semver/pub_semver.dart';
import 'package:test/test.dart';

import 'custom_showcase/_exports.dart';

void main() {
  final repository = BallRepository();
  repository.add(MyFunctionsProvider());

  setUp(() => repository.init());

  group("myFunctions", () {
    test('Add3', () async {
      final uri = createBallUri(
          MyFunctionsProvider.kMyFunctions, MyFunctionsProvider.kAdd3);
      final defVersion = Version(0, 1, 0);
      final output = await repository.callFunctionByDef(
        functionUri: uri,
        versionConstraint: defVersion,
        inputs: {
          MyFunctionsProvider.kAdd3_x1: 5,
          MyFunctionsProvider.kAdd3_x2: 2,
          MyFunctionsProvider.kAdd3_x3: 6,
        },
      );
      expect(output.handled, true);
      expect(output.result[MyFunctionsProvider.kAdd3Output], 13);
      expect(output.handledBy, MyFunctionsProvider.kAdd3);
      expect(output.callContext?.def.version, defVersion);
      expect(output.handlerVersion, Version(0, 0, 1));
    });

    test('Sum', () async {
      //Sum
      final uri = createBallUri(
        MyFunctionsProvider.kMyFunctions,
        MyFunctionsProvider.kSum,
      );
      final defVersion = Version(0, 0, 1);
      final output = await repository.callFunctionByDef(
        functionUri: uri,
        versionConstraint: defVersion,
        inputs: {
          MyFunctionsProvider.kSumInputItems: [5, 2, 6],
        },
      );
      expect(output.handled, true);
      expect(output.result[MyFunctionsProvider.kSumOutputResult], 13);
      expect(output.handledBy, MyFunctionsProvider.kSum);
      expect(output.callContext?.def.version, defVersion);
      expect(output.handlerVersion, Version(0, 1, 0));
    });
  });
}
