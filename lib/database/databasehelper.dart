import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'my_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE KhachHang (
        maKH INTEGER PRIMARY KEY AUTOINCREMENT,
        tenKH TEXT NOT NULL,
        soDT TEXT NOT NULL,
        username TEXT NOT NULL UNIQUE,
        password TEXT NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE TaiXe (
        maTX INTEGER PRIMARY KEY AUTOINCREMENT,
        tenTX TEXT NOT NULL,
        soDT TEXT NOT NULL,
        username TEXT NOT NULL UNIQUE,
        password TEXT NOT NULL,
        soXe TEXT NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE LichSuChuyenXe (
        maCX INTEGER PRIMARY KEY AUTOINCREMENT,
        maKH INTEGER,
        tenKH TEXT,
        maTX INTEGER,
        tenTX TEXT,
        soXe TEXT,
        loaiXe TEXT,
        maDG INTEGER,
        danhGia TEXT,
        ngay TEXT,
        FOREIGN KEY(maKH) REFERENCES KhachHang(maKH),
        FOREIGN KEY(maTX) REFERENCES TaiXe(maTX),
        FOREIGN KEY(soXe) REFERENCES Xe(soXe),
        FOREIGN KEY(maDG) REFERENCES DanhGia(maDG)
      )
    ''');

    await db.execute('''
      CREATE TABLE Xe (
        soXe TEXT PRIMARY KEY,
        loaiXe TEXT NOT NULL,
        maTX INTEGER,
        tenTX TEXT,
        FOREIGN KEY(maTX) REFERENCES TaiXe(maTX)
      )
    ''');

    await db.execute('''
      CREATE TABLE DanhGia (
        maDG INTEGER PRIMARY KEY AUTOINCREMENT,
        danhGia TEXT NOT NULL,
        maKH INTEGER,
        maTX INTEGER,
        FOREIGN KEY(maKH) REFERENCES KhachHang(maKH),
        FOREIGN KEY(maTX) REFERENCES TaiXe(maTX)
      )
    ''');
  }

  Future<int> registerKhachHang(String tenKH, String soDT, String username, String password) async {
    Database db = await database;
    return await db.insert(
      'KhachHang',
      {'tenKH': tenKH, 'soDT': soDT, 'username': username, 'password': password},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<int> registerTaiXe(String tenTX, String soDT, String username, String password, String soXe) async {
    Database db = await database;
    return await db.insert(
      'TaiXe',
      {'tenTX': tenTX, 'soDT': soDT, 'username': username, 'password': password, 'soXe': soXe},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<int> addLichSuChuyenXe(int maKH, String tenKH, int maTX, String tenTX, String soXe, String loaiXe, int maDG, String danhGia, String ngay) async {
    Database db = await database;
    return await db.insert(
      'LichSuChuyenXe',
      {
        'maKH': maKH,
        'tenKH': tenKH,
        'maTX': maTX,
        'tenTX': tenTX,
        'soXe': soXe,
        'loaiXe': loaiXe,
        'maDG': maDG,
        'danhGia': danhGia,
        'ngay': ngay,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<int> addXe(String soXe, String loaiXe, int maTX, String tenTX) async {
    Database db = await database;
    return await db.insert(
      'Xe',
      {
        'soXe': soXe,
        'loaiXe': loaiXe,
        'maTX': maTX,
        'tenTX': tenTX,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<int> addDanhGia(String danhGia, int maKH, int maTX) async {
    Database db = await database;
    return await db.insert(
      'DanhGia',
      {
        'danhGia': danhGia,
        'maKH': maKH,
        'maTX': maTX,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<Map<String, dynamic>?> loginUser(String username, String password) async {
    Database db = await database;
    List<Map<String, dynamic>> result = await db.query(
      'KhachHang',
      where: 'username = ? AND password = ?',
      whereArgs: [username, password],
    );
    if (result.isNotEmpty) {
      return result.first;
    }
    return null;
  }

  Future<void> close() async {
    Database db = await database;
    db.close();
  }
}
