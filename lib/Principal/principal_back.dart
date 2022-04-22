
import 'package:mobx/mobx.dart';
part 'principal_back.g.dart';

class PrincipalBack = _PrincipalBack with _$PrincipalBack;

abstract class _PrincipalBack  with Store{

  @observable
  int contador = 0;

  @observable
  String dropdownValue = "One";

  @observable
  List <String> spinnerItems = [
    'One',
    'Two',
    'Three',
    'Four',
    'Five'
  ].asObservable() ;

  
  @action
  addList(String item){
     spinnerItems.add(item);
  }

  @action
  incremet(){
    contador++;
  }

  @action
  dropdownSelecionado(String value){
    dropdownValue = value;
  }


}