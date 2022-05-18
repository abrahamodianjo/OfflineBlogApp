//call the table
final String blogTable = 'blogmodel';

//create the blog fields for the table
// these include the id, number, title, description of the blog, then the time. while is important
class BlogFields {
  static final List<String> values =[
    id, isImportant, number, title, description, time, image
  ];

  static final String id = '_id';
  static final String isImportant = 'isImportant';
  static final String number = 'number';
  static final String title = 'title';
  static final String image = 'image';
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
    final String image;
    final String description;
    final DateTime createdTime;

  //next is to initialise the blog
    const Blog ({
      this.id,
      required this.isImportant,
      required this.number,
      required this.title,
      required this.image,
      required this.description,
      required this.createdTime

});
    Blog copy({
      int? id,
      String? title,
      bool? isImportant,
      String? image,
      String? description,
      DateTime? createdTime,
}) =>
        Blog(
      id: id ?? this.id,
      title: title ?? this.title,
      isImportant: isImportant ?? this.isImportant,
      image: image ?? this.image,
      description: description ?? this.description,
      createdTime: createdTime ?? this.createdTime,

    );

    static Blog fromJson(Map<String, Object?> json) => Blog(
      id: json[BlogFields.id] as int?,
      title: json[BlogFields.title] as String,    
    );


    // create a map string object we get to jOSN
    Map<String, Object?> toJson() =>{
      BlogFields.id:id,
      BlogFields.title:title,
      BlogFields.isImportant:isImportant?1:0, //remember isImportant is a boolean so its to make it either true or false
      BlogFields.number:number,
      BlogFields.image:image,
      BlogFields.description:description,
      BlogFields.time:createdTime.toIso8601String(),
    };
}

