abstract class NewsState {}

class NewsInitial extends NewsState {}

class GetAllNewsLoadingState extends NewsState {}
class GetAllNewsSuccessfulState extends NewsState {}
class GetAllNewsErrorState extends NewsState {}
