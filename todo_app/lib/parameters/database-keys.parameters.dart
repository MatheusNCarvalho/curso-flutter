


const String DATABASE_NAME = "todo.db";
const String TABLE_NAME = "tasks";
const String ID_COLUMN = "id";
const String NAME_COLUMN = "name";
const String DESCRIPTION_COLUMN = "description";
const String STATUS_COLUMN = "status";
const String IMAGE_COLUMN = "imageUrl";

const String CREATE_TABLE_TASKS_TABLE = "CREATE TABLE " +
    "$TABLE_NAME($ID_COLUMN INTEGER PRIMARY KEY, $NAME_COLUMN TEXT, $DESCRIPTION_COLUMN TEXT, $STATUS_COLUMN INTEGER, $IMAGE_COLUMN TEXT)";