import 'package:mcontrol/financial/domain/entities/financial_bank.dart';
import 'package:dartz/dartz.dart';
import 'package:mcontrol/financial/domain/repositories/i_bank_repository.dart';
import 'package:mcontrol/financial/domain/usecases/i_bank_usecase.dart';

class BankUseCase implements IBankUseCase {
  final IBankRepository _repository;

  BankUseCase(this._repository);

  @override
  Future<Either<Exception, FinancialBank>> delete(FinancialBank entity) {
    final results = _repository.delete(entity);
    return results;
  }

  @override
  Future<Either<Exception, List>> get() async {
    final results = _repository.get();
    return results;
  }

  @override
  Future<Either<Exception, FinancialBank>> patch(FinancialBank entity) async {
    final results = _repository.patch(entity);
    return results;
  }

  @override
  Future<Either<Exception, FinancialBank>> post(FinancialBank entity) {
    final results = _repository.post(entity);
    return results;
  }

  @override
  Future<Either<Exception, FinancialBank>> put(FinancialBank entity) {
    final results = _repository.put(entity);
    return results;
  }
}
