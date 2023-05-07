import 'package:mcontrol/financial/domain/entities/financial_category.dart';
import 'package:mcontrol/financial/domain/entities/financial_document.dart';

enum PaymentForm { debit, credit }

class FinancialMoviment {
  late FinancialDocument financialDocument;
  late String account;
  late String comments;
  late DateTime dueDate;
  late double movimentValue;
  late double originalValue;
  late int installment;
  late bool isPaid;
  late PaymentForm paymentForm;
  late FinancialStatus movimentStatus;

  FinancialMoviment({
    required this.financialDocument,
    required this.account,
    required this.comments,
    required this.dueDate,
    required this.movimentValue,
    required this.originalValue,
    required this.installment,
    required this.isPaid,
    required this.paymentForm,
    required this.movimentStatus,
  });

  FinancialMoviment.empty();

  List<FinancialMoviment> get getMoviments => _getMoviments();
}

List<FinancialMoviment> _getMoviments() {
  FinancialCategory category =
      FinancialCategory(structure: '1.1.1', name: 'Receitas Administrativas');
  FinancialDocument document = FinancialDocument(
      category: category,
      description: '',
      documentStatus: FinancialStatus.open,
      documentType: DocumentType.expense,
      documentValue: 159.65,
      installmentsNumber: 1,
      totalValue: 159.65);
  List<FinancialMoviment> moviments = [];
  FinancialMoviment moviment = FinancialMoviment(
      financialDocument: document,
      account: '',
      comments: '',
      dueDate: DateTime.now(),
      installment: 1,
      isPaid: false,
      movimentStatus: FinancialStatus.open,
      movimentValue: 159.65,
      originalValue: 159.65,
      paymentForm: PaymentForm.debit);
  moviments.add(moviment);
  return moviments;
}
