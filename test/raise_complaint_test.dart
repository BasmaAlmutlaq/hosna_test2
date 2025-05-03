import 'package:flutter_test/flutter_test.dart';
import 'package:hosna/services/ComplaintService.dart';

class MockComplaintService extends ComplaintService {
  MockComplaintService()
      : super(
          rpcUrl: 'https://test.rpc.url', // dummy URL for testing
          contractAddress: '0xTestContractAddress', // dummy address for testing
        );

  @override
  Future<bool> sendComplaint({
    required String title,
    required String description,
    required String targetCharityAddress,
  }) async {
    if (title.isEmpty || description.isEmpty) {
      return false;
    }
    if (targetCharityAddress.isEmpty) {
      return false;
    }
    return true;
  }
}

void main() {
  group('ComplaintService Tests', () {
    late MockComplaintService complaintService;

    setUp(() {
      complaintService = MockComplaintService();
    });

    test('sendComplaint with empty title should return false', () async {
      final result = await complaintService.sendComplaint(
        title: '',
        description: 'Valid description',
        targetCharityAddress: '0x123',
      );

      expect(result, false);
    });

    test('sendComplaint with valid parameters should return true', () async {
      final result = await complaintService.sendComplaint(
        title: 'Valid title',
        description: 'Valid description',
        targetCharityAddress: '0x123',
      );

      expect(result, true);
    });
  });
}
