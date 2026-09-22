// 1. Check Balance
void checkBalance({
  required String name,
  required double balance,
}) =>
    print('User: $name, Available balance: $balance ₸');

// 2. Deposit
double deposit({
  required double currentBalance,
  double? amount,
}) {
  double depositAmount = amount ?? 0.0;

  double newBalance = currentBalance + depositAmount;

  print('Deposit: $depositAmount ₸');
  print('New balance: $newBalance ₸');

  return newBalance;
}

// 3. Withdraw
double withdraw({
  required String name,
  required double currentBalance,
  double? amount,
  int? pinCode,
}) {
  int pin = pinCode ?? 0000;
  double withdrawAmount = amount ?? 0.0;

  if (pin != 1234) {
    print('Error: Incorrect PIN. Transaction declined.');
    return currentBalance;
  }

  if (withdrawAmount > currentBalance) {
    print('Error: Insufficient funds. Transaction declined.');
    return currentBalance;
  }

  double newBalance = currentBalance - withdrawAmount;

  print('User: $name');
  print('Withdraw: $withdrawAmount ₸');
  print('Transaction successful.');
  print('New balance: $newBalance ₸');

  return newBalance;
}

// Main
void main() {
  checkBalance(
    name: 'Mayra',
    balance: 50000,
  );

  double balance = deposit(
    currentBalance: 50000,
    amount: 10000,
  );

  balance = withdraw(
    name: 'Mayra',
    currentBalance: balance,
    amount: 5000,
    pinCode: 1234,
  );

  print('Final balance: $balance ₸');
}