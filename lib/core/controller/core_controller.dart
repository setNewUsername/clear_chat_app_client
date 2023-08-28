abstract class CoreController{
  Function? notifyViewFunctionPtr;

  CoreController();

  set viewNotifyMethod(Function newMethod){
    notifyViewFunctionPtr = newMethod;
  }

  void notifyView(Enum signal){
    if (notifyViewFunctionPtr != null){
      notifyViewFunctionPtr!.call(signal);
    }
  }

  void interControllerDataTransitionMethod(Object dataObject);
}