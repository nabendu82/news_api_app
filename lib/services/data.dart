import 'package:news_api_app/model/categoryModel.dart';


List<CategoryModels> getCategories() {
  List<CategoryModels> category = <CategoryModels>[];
  CategoryModels categoryModels = new CategoryModels();
//1
  categoryModels.categoryName = "Bussiness";
  categoryModels.imageUrl =
      "https://media.istockphoto.com/photos/businessman-trading-online-stock-market-on-teblet-screen-digital-picture-id1311598658?s=612x612";
  category.add(categoryModels);

//2
  categoryModels = new CategoryModels();
  categoryModels.categoryName = "Entertainment";
  categoryModels.imageUrl =
      "https://media.istockphoto.com/photos/popcorn-and-clapperboard-picture-id1191001701";
  category.add(categoryModels);

//3
  categoryModels = new CategoryModels();
  categoryModels.categoryName = "Sports";
  categoryModels.imageUrl =
      "https://media.istockphoto.com/photos/soccer-field-with-illumination-green-grass-and-cloudy-sky-background-picture-id1293105095";
  category.add(categoryModels);
//4
  categoryModels = new CategoryModels();
  categoryModels.categoryName = "Movies";
  categoryModels.imageUrl =
      "https://media.istockphoto.com/photos/35mm-film-strip-gradient-background-picture-id1299279536";
  category.add(categoryModels);

  return category;
}
