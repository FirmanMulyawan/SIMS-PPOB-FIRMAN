abstract class TransactionBalanceState {}

class TransactionBalanceLoading extends TransactionBalanceState {}

class TransactionBalanceIdle extends TransactionBalanceState {}

class TransactionBalanceError extends TransactionBalanceState {}

class TransactionBalanceSuccess extends TransactionBalanceState {}

class TransactionBalanceEmpty extends TransactionBalanceState {}

abstract class TransactionState {}

class TransactionLoading extends TransactionState {}

class TransactionIdle extends TransactionState {}

class TransactionError extends TransactionState {}

class TransactionSuccess extends TransactionState {}

class TransactionEmpty extends TransactionState {}
