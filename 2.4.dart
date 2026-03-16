import 'dart:math';

class BankAccount {
  String accountNumber;
  double balance = 0;
  String ownerName;

  BankAccount(this.ownerName) : accountNumber = _generateNumber();

  static String _generateNumber() {
    // Генерация случайного номера счета
    var rand =
        Random(); //пытался использовать и другие типы данных,но выдавало какую то ошибку при генерации решил везде использовать var
    String number = '';
    for (int i = 0; i < 10; i++) {
      number += rand.nextInt(10).toString();
    }
    return number;
  }

  void deposit(double amount) {
    // Пополнение счета
    if (amount > 0) {
      balance += amount;
      print('Пополнено: $amount. Баланс: $balance');
    } else {
      print('Нельзя пополнить отрицательной суммой.');
    }
  }

  void withdraw(double amount) {
    // Снятие денег
    if (amount > balance) {
      print('Недостаточно денег.');
    } else {
      balance -= amount;
      print('Снято: $amount. Остаток: $balance');
    }
  }
}

class Bank {
  List<BankAccount> accounts = [];

  void addAccount(String ownerName) {
    // Создаем новый счет
    var account = (BankAccount);
    accounts.add(account);
    print('Создан счет: ${account.accountNumber} для $ownerName');
  }

  BankAccount? findAc(String accountNumber) {
    // Ищем счет по номеру
    for (var acc in accounts) {
      if (acc.accountNumber == accountNumber) {
        return acc;
      }
    }
    return null;
  }

  void transfer(String fromNumber, String toNumber, double amount) {
    // Перевод между счетами
    var fromAcc = findAc(fromNumber);
    var toAcc = findAc(toNumber);

    if (fromAcc == null || toAcc == null) {
      print('Один из счетов не найден.');
      return;
    }

    if (fromAcc.balance < amount) {
      print('Недостаточно денег для перевода.');
      return;
    }

    fromAcc.withdraw(amount);
    toAcc.deposit(amount);
    print('Перевод завершен.');
  }
}

void main() {
  var bank = Bank();

  bank.addAccount('Иван');
  bank.addAccount('Мария');

  var ivanAccount = bank.accounts[0];
  var mariaAccount = bank.accounts[1];

  ivanAccount.deposit(100);
  bank.transfer(ivanAccount.accountNumber, mariaAccount.accountNumber, 50);
}
