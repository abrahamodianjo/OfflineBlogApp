final String blogTable = 'blogmodel';

//create the blog fields for the table
// these include the id, number, title, descrption of the blog, then the time. while is important
class BlogFields {
  static final List<String> values =[
    id, isImportant, number, title, description, time
  ];

  static final String id = 'id';
  static final String isImportant = 'isImportant';
  static final String number = 'number';
  static final String title = 'title';
  static final String description = 'description';
  static final String time = 'time';

}

// now we create the blog model to accept the types and attributes
class Blog{

    // set the type of input
    final int? id;
    final bool isImportant;
    final int number;
    final String title;
    final String description;
    final DateTime createdTime;

  //next is to initialise the blog
    const Blog ({
      this.id,
      required this.isImportant,
      required this.number,
      required this.title,
      required this.description,
      required this.createdTime

})



}