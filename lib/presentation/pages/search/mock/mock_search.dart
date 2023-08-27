class SearchModel {
  const SearchModel({required this.avatar, required this.name});

  final String avatar;
  final String name;
}

class MockSearch {
  static List<SearchModel> listSearch = [
    SearchModel(
        avatar: "https://i.ytimg.com/vi/5V-FF-xY0Po/movieposter_en.jpg",
        name: "Art. Movie."),
    SearchModel(
        avatar:
            "https://d17fnq9dkz9hgj.cloudfront.net/uploads/2012/11/hamster-facts-about-small-mammals-as-pets-thinkstock-155233157.jpg",
        name: "Animals. Pets"),
    SearchModel(
        avatar:
            "https://d17fnq9dkz9hgj.cloudfront.net/uploads/2012/11/hamster-facts-about-small-mammals-as-pets-thinkstock-155233157.jpg",
        name: "Architecture"),
    SearchModel(
        avatar:
            "https://media.gq.com/photos/62aa07a3e380fdb2ee9dfe58/master/pass/GQ0622_MetaverseFashion_01%20site.jpg",
        name: "Fashion"),
    SearchModel(
        avatar:
            "https://d17fnq9dkz9hgj.cloudfront.net/uploads/2012/11/hamster-facts-about-small-mammals-as-pets-thinkstock-155233157.jpg",
        name: "Animals. Pets"),
    SearchModel(
        avatar: "https://cdn-icons-png.flaticon.com/512/147/147144.png",
        name: "Animals. Pets"),
    SearchModel(
        avatar:
            "https://d17fnq9dkz9hgj.cloudfront.net/uploads/2012/11/hamster-facts-about-small-mammals-as-pets-thinkstock-155233157.jpg",
        name: "Architecture"),
    SearchModel(
        avatar: "https://cdn-icons-png.flaticon.com/512/147/147144.png",
        name: "Animals. Pets"),
    SearchModel(
        avatar:
            "https://media.gq.com/photos/62aa07a3e380fdb2ee9dfe58/master/pass/GQ0622_MetaverseFashion_01%20site.jpg",
        name: "Fashion"),
    SearchModel(
        avatar: "https://cdn-icons-png.flaticon.com/512/147/147144.png",
        name: "Animals. Pets"),
  ];
}
