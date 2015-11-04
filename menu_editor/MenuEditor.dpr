program MenuEditor;

uses
  Vcl.Forms,
  main in 'src\main.pas' {fmMain},
  SaleShot in 'SaleShot.pas' {fmSaleShot},
  db_comps_additional in 'db_comps_additional.pas',
  Vcl.Themes,
  Vcl.Styles,
  MenuEdit in 'MenuEdit.pas' {fmMenuEditor},
  DBMenu in 'DBMenu.pas',
  fmGoodEdit in 'fmGoodEdit.pas' {fmGoodEditor},
  MenuDesigner in 'MenuDesigner.pas' {fmMenuDesigner},
  AmountInput in 'AmountInput.pas' {fmAmount},
  common_functions in 'common_functions.pas',
  vars in '..\vars.pas',
  Office_TLB in 'src\Office_TLB.pas',
  PlatformSizes in '..\PlatformSizes.pas',
  goodCard in 'goodCard.pas' {fmGoodCard},
  Good in 'src\models\Good.pas',
  GoodRepository in 'src\models\GoodRepository.pas',
  Session in 'src\models\Session.pas',
  SessionRepository in 'src\models\SessionRepository.pas',
  fmDiscountEdit in 'fmDiscountEdit.pas' {fmDiscountEditor},
  Discount in 'src\models\Discount.pas',
  DiscountRepository in 'src\models\DiscountRepository.pas',
  DiscountCard in 'DiscountCard.pas' {fmDiscountCard},
  Ingredients in 'src\forms\Ingredients.pas' {fmIngredients},
  Ingredient in 'src\models\Ingredient.pas',
  Measure in 'src\models\Measure.pas',
  MeasureRepository in 'src\models\MeasureRepository.pas',
  RecipeCard in 'src\forms\RecipeCard.pas' {fmRecipeCard},
  ValInput in '..\ValInput.pas' {fmInputQuery},
  MeasureCard in 'src\forms\MeasureCard.pas' {fmMeasureCard},
  Measures in 'src\forms\Measures.pas' {fmMeasures},
  IngredientRepository in 'src\models\IngredientRepository.pas',
  Recipe in 'src\models\Recipe.pas',
  RecipeRepository in 'src\models\RecipeRepository.pas',
  IngredientCard in 'src\forms\IngredientCard.pas' {fmIngredientCard},
  SalesHistory in 'src\forms\SalesHistory.pas' {fmSalesHistory},
  PricedGood in 'src\models\PricedGood.pas',
  PricedGoodRepository in 'src\models\PricedGoodRepository.pas',
  SessionPicker in 'src\forms\SessionPicker.pas' {fmSessionPicker},
  IngredientHistory in 'src\forms\IngredientHistory.pas' {fmIngredientHistory},
  IngredientRecipe in 'src\models\IngredientRecipe.pas',
  IngredientRecipeRepository in 'src\models\IngredientRecipeRepository.pas',
  History in 'src\forms\History.pas' {fmHistory},
  Sale in 'src\models\Sale.pas',
  SaleRepository in 'src\models\SaleRepository.pas',
  SaleGood in 'src\models\SaleGood.pas',
  SaleGoodRepository in 'src\models\SaleGoodRepository.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfmMain, fmMain);
  Application.CreateForm(TfmGoodCard, fmGoodCard);
  Application.CreateForm(TfmDiscountEditor, fmDiscountEditor);
  Application.CreateForm(TfmDiscountCard, fmDiscountCard);
  Application.CreateForm(TfmIngredients, fmIngredients);
  Application.CreateForm(TfmRecipeCard, fmRecipeCard);
  Application.CreateForm(TfmInputQuery, fmInputQuery);
  Application.CreateForm(TfmMeasureCard, fmMeasureCard);
  Application.CreateForm(TfmMeasures, fmMeasures);
  Application.CreateForm(TfmIngredientCard, fmIngredientCard);
  Application.CreateForm(TfmSalesHistory, fmSalesHistory);
  Application.CreateForm(TfmSessionPicker, fmSessionPicker);
  Application.CreateForm(TfmIngredientHistory, fmIngredientHistory);
  Application.CreateForm(TfmHistory, fmHistory);
  Application.Run;
end.
