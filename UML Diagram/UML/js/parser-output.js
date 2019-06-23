var entities = [{
  "id": 1,
  "typeString": "class",
  "properties": [
    {
  "name": "var application: XCUIApplication!",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "setUp()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "tearDown()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "testTableViewCount()",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "WeatherUITests",
  "superClass": 102
},{
  "id": 2,
  "typeString": "class",
  "properties": [
    {
  "name": "var dashboardWorker : DashboardWorker?",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "setUp()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "tearDown()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "testPerformanceWeatherApi()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "testCurrentWeatherApi()",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "WeatherTests",
  "superClass": 102
},{
  "id": 3,
  "typeString": "enum",
  "cases": [
    {
  "name": "unknown"
},
    {
  "name": "png"
},
    {
  "name": "jpeg"
}
  ],
  "name": "ImageFormat"
},{
  "id": 4,
  "typeString": "class",
  "properties": [
    {
  "name": "let cacheDirectoryPrefix",
  "type": "type",
  "accessLevel": "internal"
},
    {
  "name": "let ioQueuePrefix",
  "type": "type",
  "accessLevel": "internal"
},
    {
  "name": "let defaultMaxCachePeriodInSecond: TimeInterval",
  "type": "type",
  "accessLevel": "internal"
},
    {
  "name": "var instance",
  "type": "type",
  "accessLevel": "public"
},
    {
  "name": "var cachePath: String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let memCache",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let ioQueue: DispatchQueue",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let fileManager: FileManager",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var name: String",
  "type": "instance",
  "accessLevel": "open"
},
    {
  "name": "var maxCachePeriodInSecond",
  "type": "instance",
  "accessLevel": "open"
},
    {
  "name": "var maxDiskCacheSize: UInt",
  "type": "instance",
  "accessLevel": "open"
}
  ],
  "methods": [
    {
  "name": "init(name: String, path: String? = nil)",
  "type": "instance",
  "accessLevel": "public"
}
  ],
  "name": "DataCache",
  "extensions": [
    5,
    6,
    7,
    8
  ]
},{
  "id": 9,
  "typeString": "protocol",
  "properties": [
    {
  "name": "var message: Array<UInt8>",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "prepare(_ len: Int) -> Array<UInt8>",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "HashProtocol",
  "extensions": [
    16
  ]
},{
  "id": 10,
  "typeString": "struct",
  "properties": [
    {
  "name": "let chunkSize: Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let data: [UInt8]",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var offset",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "next() -> ArraySlice<UInt8>?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "init(chunkSize: Int, data: [UInt8])",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "BytesIterator",
  "superClass": 103
},{
  "id": 11,
  "typeString": "struct",
  "properties": [
    {
  "name": "let chunkSize: Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let data: [UInt8]",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "makeIterator() -> BytesIterator",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "BytesSequence",
  "superClass": 104
},{
  "id": 12,
  "typeString": "class",
  "properties": [
    {
  "name": "let size",
  "type": "type",
  "accessLevel": "internal"
},
    {
  "name": "let message: [UInt8]",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let shifts: [UInt32]",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "let sines: [UInt32]",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "let hashes: [UInt32]",
  "type": "instance",
  "accessLevel": "private"
}
  ],
  "methods": [
    {
  "name": "calculate() -> [UInt8]",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "init (_ message: [UInt8])",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "protocols": [
    9
  ],
  "name": "MD5"
},{
  "id": 18,
  "typeString": "class",
  "properties": [
    {
  "name": "var city: UILabel!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var wind: UILabel!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var temprature: UILabel!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var updateDate: UILabel!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var shortDescription: UILabel!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var condition: UILabel!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var conditionImage: UIImageView!",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "awakeFromNib()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "setSelected(_ selected: Bool, animated: Bool)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "WeatherCell",
  "superClass": 105
},{
  "id": 19,
  "typeString": "protocol",
  "methods": [
    {
  "name": "currentWeather(request: Weather.Request)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "DashboardBusinessLogic"
},{
  "id": 20,
  "typeString": "protocol",
  "name": "DashboardDataStore"
},{
  "id": 21,
  "typeString": "class",
  "properties": [
    {
  "name": "var presenter: DashboardPresentationLogic?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var worker: DashboardWorker?",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "currentWeather(request: Weather.Request)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "protocols": [
    19
  ],
  "name": "DashboardInteractor"
},{
  "id": 22,
  "typeString": "protocol",
  "properties": [
    {
  "name": "var currentTheme: Setting.Theme",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "display(error: Constant.Error)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "display(weather: Weather.View)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "refreshWeather()",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "DashboardDisplayLogic",
  "superClass": 106
},{
  "id": 23,
  "typeString": "class",
  "properties": [
    {
  "name": "var weatherDetailList: UITableView!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var weatherDetailListHeader: UIView!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var weather: Weather.View!",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "var interactor: DashboardBusinessLogic?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var router: (NSObjectProtocol & DashboardRoutingLogic & DashboardDataPassing)? required",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "setup()",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "prepare(for segue: UIStoryboardSegue, sender: Any?)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "viewDidLoad()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "viewWillAppear(_ animated: Bool)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "reloadView()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "init?(coder aDecoder: NSCoder)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "DashboardViewController",
  "superClass": 107,
  "extensions": [
    24,
    25,
    26
  ]
},{
  "id": 28,
  "typeString": "protocol",
  "methods": [
    {
  "name": "presentWeather(result: APIResult<Weather.Result?, APIError>)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "DashboardPresentationLogic"
},{
  "id": 29,
  "typeString": "class",
  "properties": [
    {
  "name": "var viewController: DashboardDisplayLogic?",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "presentWeather(result: APIResult<Weather.Result?, APIError>)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "protocols": [
    28
  ],
  "name": "DashboardPresenter",
  "extensions": [
    30
  ]
},{
  "id": 32,
  "typeString": "struct",
  "properties": [
    {
  "name": "var city: String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var temprature: String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var wind: String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var weatherConditionShort: String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var weatherCondition: String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var updateTime: String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var imageUrl: URL?",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "View",
  "superClass": 108
},{
  "id": 33,
  "typeString": "struct",
  "properties": [
    {
  "name": "let cityName: String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let country: String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let appid : String",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "queryParameter() -> [URLQueryItem]",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "Request",
  "superClass": 108
},{
  "id": 34,
  "typeString": "struct",
  "properties": [
    {
  "name": "let coord: Coord",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let weather: [Climate]",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let base: String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let main: Main",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let visibility: Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let wind: Wind",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let clouds: Clouds",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let dt: Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let sys: Sys",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let id: Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let name: String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let cod: Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var updateTime: String?",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "Result",
  "superClass": 108
},{
  "id": 35,
  "typeString": "struct",
  "properties": [
    {
  "name": "let all: Int",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "Clouds",
  "superClass": 108
},{
  "id": 36,
  "typeString": "struct",
  "properties": [
    {
  "name": "let lon, lat: Double",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "Coord",
  "superClass": 108
},{
  "id": 37,
  "typeString": "enum",
  "protocols": [
    110
  ],
  "cases": [
    {
  "name": "temp"
},
    {
  "name": "pressure"
},
    {
  "name": "humidity case tempMin"
},
    {
  "name": "tempMax"
}
  ],
  "name": "CodingKeys",
  "superClass": 109
},{
  "id": 38,
  "typeString": "struct",
  "properties": [
    {
  "name": "let temp: Double",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let pressure, humidity: Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let tempMin, tempMax: Double",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "Main",
  "superClass": 108,
  "containedEntities": [
    37
  ]
},{
  "id": 39,
  "typeString": "struct",
  "properties": [
    {
  "name": "let type, id: Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let message: Double",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let country: String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let sunrise, sunset: Int",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "Sys",
  "superClass": 108
},{
  "id": 40,
  "typeString": "enum",
  "cases": [
    {
  "name": "id"
},
    {
  "name": "main case weatherDescription"
},
    {
  "name": "icon"
}
  ],
  "name": "CodingKeys",
  "superClass": 109
},{
  "id": 41,
  "typeString": "struct",
  "properties": [
    {
  "name": "let id: Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let main, weatherDescription, icon: String",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "Climate",
  "superClass": 108,
  "containedEntities": [
    40
  ]
},{
  "id": 42,
  "typeString": "struct",
  "properties": [
    {
  "name": "let speed: Double",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let deg: Int",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "Wind",
  "superClass": 108
},{
  "id": 43,
  "typeString": "struct",
  "properties": [
    {
  "name": "var name: String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var info: String",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "Data",
  "superClass": 108
},{
  "id": 44,
  "typeString": "enum",
  "name": "Weather",
  "containedEntities": [
    32,
    33,
    34,
    35,
    36,
    37,
    38,
    39,
    40,
    41,
    42,
    43
  ]
},{
  "id": 45,
  "typeString": "class",
  "methods": [
    {
  "name": "currentWeather(request: Weather.Request,_ completionHandler: @escaping (APIResult<Weather.Result?, APIError>) -> Void)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "DashboardWorker",
  "superClass": 86
},{
  "id": 46,
  "typeString": "protocol",
  "methods": [
    {
  "name": "routeToSetting(segue: UIStoryboardSegue?)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "DashboardRoutingLogic"
},{
  "id": 47,
  "typeString": "protocol",
  "properties": [
    {
  "name": "var dataStore: DashboardDataStore?",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "refreshWeather()",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "DashboardDataPassing"
},{
  "id": 48,
  "typeString": "class",
  "properties": [
    {
  "name": "var viewController: DashboardViewController?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var dataStore: DashboardDataStore?",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "refreshWeather()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "routeToSetting(segue: UIStoryboardSegue?)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "protocols": [
    46
  ],
  "name": "DashboardRouter",
  "superClass": 111
},{
  "id": 49,
  "typeString": "protocol",
  "methods": [
    {
  "name": "numberOfSections() -> Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "numberOfRowsInSection( section: Int) -> Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "titleForRowAt( indexPath: IndexPath) -> (String, UITableViewCell.AccessoryType)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "didSelectRowAt( indexPath: IndexPath)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "SelectionPresentationLogic"
},{
  "id": 50,
  "typeString": "class",
  "properties": [
    {
  "name": "var presentationLogic: SelectionPresentationLogic?",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "viewDidLoad()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "viewWillAppear(_ animated: Bool)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "numberOfSections(in tableView: UITableView) -> Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "prefferedSize(maxSize: CGSize) -> CGSize",
  "type": "instance",
  "accessLevel": "public"
}
  ],
  "name": "SelectionViewController",
  "superClass": 112
},{
  "id": 51,
  "typeString": "class",
  "properties": [
    {
  "name": "var name: UILabel!",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "SelectionCell",
  "superClass": 105
},{
  "id": 52,
  "typeString": "class",
  "properties": [
    {
  "name": "var window: UIWindow?",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "applicationWillResignActive(_ application: UIApplication)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "applicationDidEnterBackground(_ application: UIApplication)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "applicationWillEnterForeground(_ application: UIApplication)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "applicationDidBecomeActive(_ application: UIApplication)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "applicationWillTerminate(_ application: UIApplication)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "protocols": [
    114
  ],
  "name": "AppDelegate",
  "superClass": 113
},{
  "id": 53,
  "typeString": "protocol",
  "name": "SettingDisplayLogic",
  "superClass": 106
},{
  "id": 54,
  "typeString": "class",
  "properties": [
    {
  "name": "var cityName: UITextField!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var rightView: UIView!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var windSegment: UISegmentedControl!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var tempratureSegment: UISegmentedControl!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var cityDaSource: Setting.Selection!",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "var citySelectionController: SelectionViewController!",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "var interactor: SettingBusinessLogic?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var router: (NSObjectProtocol & SettingRoutingLogic & SettingDataPassing)?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var dashboard: DashboardDataPassing? required",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "setup()",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "prepare(for segue: UIStoryboardSegue, sender: Any?)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "viewDidLoad()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "viewWillAppear(_ animated: Bool)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "tempratureChange(_ sender: UISegmentedControl)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "windChange(_ sender: UISegmentedControl)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "back(_ sender: Any)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "init?(coder aDecoder: NSCoder)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "SettingViewController",
  "superClass": 112,
  "extensions": [
    55,
    56,
    57
  ]
},{
  "id": 58,
  "typeString": "struct",
  "properties": [
    {
  "name": "let cities : [City]",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var selected: City",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "Selection"
},{
  "id": 59,
  "typeString": "struct",
  "properties": [
    {
  "name": "let name: String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let country: String",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "== (lhs:City, rhs: City) -> Bool",
  "type": "type",
  "accessLevel": "internal"
}
  ],
  "name": "City",
  "superClass": 108
},{
  "id": 60,
  "typeString": "struct",
  "properties": [
    {
  "name": "var type: ThemeType!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var city: City!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var temprature: TempratureUnit!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var wind: WindUnit!",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "Theme",
  "superClass": 108
},{
  "id": 61,
  "typeString": "enum",
  "cases": [
    {
  "name": "kilometerPerHour"
},
    {
  "name": "milesPerHour"
}
  ],
  "name": "WindUnit",
  "superClass": 108
},{
  "id": 62,
  "typeString": "enum",
  "cases": [
    {
  "name": "celcius"
},
    {
  "name": "fahrenheit"
}
  ],
  "name": "TempratureUnit",
  "superClass": 115
},{
  "id": 63,
  "typeString": "enum",
  "cases": [
    {
  "name": "dark"
},
    {
  "name": "light"
}
  ],
  "name": "ThemeType",
  "superClass": 115
},{
  "id": 64,
  "typeString": "enum",
  "name": "Setting",
  "containedEntities": [
    58,
    59,
    60,
    61,
    62,
    63
  ]
},{
  "id": 65,
  "typeString": "class",
  "name": "SettingWorker"
},{
  "id": 66,
  "typeString": "protocol",
  "name": "SettingRoutingLogic"
},{
  "id": 67,
  "typeString": "protocol",
  "properties": [
    {
  "name": "var dataStore: SettingDataStore?",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "SettingDataPassing"
},{
  "id": 68,
  "typeString": "class",
  "properties": [
    {
  "name": "var viewController: SettingViewController?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var dataStore: SettingDataStore?",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "SettingRouter",
  "superClass": 111
},{
  "id": 69,
  "typeString": "protocol",
  "name": "SettingPresentationLogic"
},{
  "id": 70,
  "typeString": "class",
  "properties": [
    {
  "name": "var viewController: SettingDisplayLogic?",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "protocols": [
    69
  ],
  "name": "SettingPresenter"
},{
  "id": 71,
  "typeString": "protocol",
  "name": "SettingBusinessLogic"
},{
  "id": 72,
  "typeString": "protocol",
  "name": "SettingDataStore"
},{
  "id": 73,
  "typeString": "class",
  "properties": [
    {
  "name": "var presenter: SettingPresentationLogic?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var worker: SettingWorker?",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "protocols": [
    71
  ],
  "name": "SettingInteractor"
},{
  "id": 74,
  "typeString": "struct",
  "properties": [
    {
  "name": "let weatherEndPoint",
  "type": "type",
  "accessLevel": "internal"
},
    {
  "name": "let imageEndPoint",
  "type": "type",
  "accessLevel": "internal"
}
  ],
  "name": "API"
},{
  "id": 75,
  "typeString": "struct",
  "properties": [
    {
  "name": "var isNetworkIssue: Bool",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var info: String",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "Error"
},{
  "id": 76,
  "typeString": "struct",
  "properties": [
    {
  "name": "let POST",
  "type": "type",
  "accessLevel": "internal"
},
    {
  "name": "let GET",
  "type": "type",
  "accessLevel": "internal"
},
    {
  "name": "let CONTENT_TYPE",
  "type": "type",
  "accessLevel": "internal"
},
    {
  "name": "let AUTHENTICATION_CONTENT_TYPE",
  "type": "type",
  "accessLevel": "internal"
},
    {
  "name": "let CONTENT_TYPE_VALUE",
  "type": "type",
  "accessLevel": "internal"
},
    {
  "name": "let apiKey",
  "type": "type",
  "accessLevel": "internal"
}
  ],
  "name": "Constant",
  "containedEntities": [
    74,
    75
  ]
},{
  "id": 77,
  "typeString": "struct",
  "properties": [
    {
  "name": "let Alert",
  "type": "type",
  "accessLevel": "internal"
},
    {
  "name": "let Okay",
  "type": "type",
  "accessLevel": "internal"
},
    {
  "name": "let Yes",
  "type": "type",
  "accessLevel": "internal"
},
    {
  "name": "let No",
  "type": "type",
  "accessLevel": "internal"
},
    {
  "name": "let somethingWrong",
  "type": "type",
  "accessLevel": "internal"
},
    {
  "name": "let jsonFailure",
  "type": "type",
  "accessLevel": "internal"
},
    {
  "name": "let jsonParsing",
  "type": "type",
  "accessLevel": "internal"
},
    {
  "name": "let responseNull",
  "type": "type",
  "accessLevel": "internal"
}
  ],
  "name": "Localisable",
  "extensions": [
    27,
    31,
    85,
    94
  ]
},{
  "id": 78,
  "typeString": "enum",
  "cases": [
    {
  "name": "success"
},
    {
  "name": "failure"
}
  ],
  "name": "APIResult",
  "superClass": 116
},{
  "id": 79,
  "typeString": "struct",
  "properties": [
    {
  "name": "var message:String?",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "ErrorResponse",
  "superClass": 108
},{
  "id": 80,
  "typeString": "enum",
  "properties": [
    {
  "name": "var localizedDescription: String",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "cases": [
    {
  "name": "requestFailed case jsonConversionFailure case invalidData case responseUnsuccessful"
},
    {
  "name": "noNetwork case jsonParsingFailure case notFound"
},
    {
  "name": "let"
},
    {
  "name": "let"
}
  ],
  "name": "APIError",
  "containedEntities": [
    79
  ]
},{
  "id": 81,
  "typeString": "struct",
  "properties": [
    {
  "name": "var message : String?",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "Result",
  "superClass": 108
},{
  "id": 82,
  "typeString": "enum",
  "name": "GenericResponse",
  "containedEntities": [
    81
  ]
},{
  "id": 83,
  "typeString": "protocol",
  "properties": [
    {
  "name": "var session: URLSession",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "fetch<T: Decodable>(with request: URLRequest, decode: @escaping (Decodable) -> T?, completion: @escaping (APIResult<T?, APIError>) -> Void)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "APIClient",
  "extensions": [
    84
  ]
},{
  "id": 86,
  "typeString": "class",
  "properties": [
    {
  "name": "let sharedInstance",
  "type": "type",
  "accessLevel": "internal"
},
    {
  "name": "var session: URLSession convenience",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "init(configuration: URLSessionConfiguration)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "init()",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "protocols": [
    83
  ],
  "name": "Client"
},{
  "id": 87,
  "typeString": "protocol",
  "properties": [
    {
  "name": "var base: String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var path: String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var queryParams: [URLQueryItem]",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "Endpoint",
  "extensions": [
    90
  ]
},{
  "id": 88,
  "typeString": "enum",
  "cases": [
    {
  "name": "weather case weatherIcon"
}
  ],
  "name": "Calls",
  "extensions": [
    91
  ]
},{
  "id": 89,
  "typeString": "struct",
  "properties": [
    {
  "name": "var _queryParams:[URLQueryItem]",
  "type": "type",
  "accessLevel": "internal"
}
  ],
  "name": "Keeper"
},{
  "id": 100,
  "typeString": "struct",
  "properties": [
    {
  "name": "var refreshControlTarget : RefreshControlTarget",
  "type": "type",
  "accessLevel": "internal"
},
    {
  "name": "var refreshcontrol: UIRefreshControl",
  "type": "type",
  "accessLevel": "internal"
}
  ],
  "name": "Extension"
},{
  "id": 102,
  "typeString": "class",
  "name": "XCTestCase"
},{
  "id": 103,
  "typeString": "class",
  "name": "IteratorProtocol"
},{
  "id": 104,
  "typeString": "class",
  "name": "Sequence"
},{
  "id": 105,
  "typeString": "class",
  "name": "UITableViewCell"
},{
  "id": 106,
  "typeString": "class",
  "name": "class"
},{
  "id": 107,
  "typeString": "class",
  "name": "UIViewController",
  "extensions": [
    93
  ]
},{
  "id": 108,
  "typeString": "class",
  "name": "Codable"
},{
  "id": 109,
  "typeString": "class",
  "name": "String",
  "extensions": [
    13,
    95
  ]
},{
  "id": 110,
  "typeString": "protocol",
  "name": "CodingKey"
},{
  "id": 111,
  "typeString": "class",
  "name": "NSObject",
  "extensions": [
    96
  ]
},{
  "id": 112,
  "typeString": "class",
  "name": "UITableViewController"
},{
  "id": 113,
  "typeString": "class",
  "name": "UIResponder"
},{
  "id": 114,
  "typeString": "protocol",
  "name": "UIApplicationDelegate"
},{
  "id": 115,
  "typeString": "class",
  "name": "Int",
  "extensions": [
    14
  ]
},{
  "id": 116,
  "typeString": "class",
  "name": "whereUError"
},{
  "id": 117,
  "typeString": "class",
  "name": "NSMutableData",
  "extensions": [
    15
  ]
},{
  "id": 118,
  "typeString": "class",
  "name": "Dictionary",
  "extensions": [
    17
  ]
},{
  "id": 119,
  "typeString": "protocol",
  "name": "UITableViewDelegate"
},{
  "id": 120,
  "typeString": "protocol",
  "name": "UITableViewDataSource"
},{
  "id": 121,
  "typeString": "protocol",
  "name": "UITextFieldDelegate"
},{
  "id": 122,
  "typeString": "protocol",
  "name": "UIPopoverPresentationControllerDelegate"
},{
  "id": 123,
  "typeString": "class",
  "name": "Date",
  "extensions": [
    92
  ]
},{
  "id": 124,
  "typeString": "class",
  "name": "UserDefaults",
  "extensions": [
    97
  ]
},{
  "id": 125,
  "typeString": "class",
  "name": "Double",
  "extensions": [
    98
  ]
},{
  "id": 126,
  "typeString": "class",
  "name": "UIImageView",
  "extensions": [
    99
  ]
},{
  "id": 127,
  "typeString": "class",
  "name": "UITableView",
  "extensions": [
    101
  ]
},{
  "id": 5,
  "typeString": "extension",
  "methods": [
    {
  "name": "write(data: Data, forKey key: String)",
  "type": "instance",
  "accessLevel": "public"
},
    {
  "name": "writeDataToDisk(data: Data, key: String)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "readData(forKey key:String) -> Data?",
  "type": "instance",
  "accessLevel": "public"
},
    {
  "name": "readDataFromDisk(forKey key: String) -> Data?",
  "type": "instance",
  "accessLevel": "public"
},
    {
  "name": "write(object: NSCoding, forKey key: String)",
  "type": "instance",
  "accessLevel": "public"
},
    {
  "name": "write(string: String, forKey key: String)",
  "type": "instance",
  "accessLevel": "public"
},
    {
  "name": "write(dictionary: Dictionary<AnyHashable, Any>, forKey key: String)",
  "type": "instance",
  "accessLevel": "public"
},
    {
  "name": "write(array: Array<Any>, forKey key: String)",
  "type": "instance",
  "accessLevel": "public"
},
    {
  "name": "readObject(forKey key: String) -> NSObject?",
  "type": "instance",
  "accessLevel": "public"
},
    {
  "name": "readString(forKey key: String) -> String?",
  "type": "instance",
  "accessLevel": "public"
},
    {
  "name": "readArray(forKey key: String) -> Array<Any>?",
  "type": "instance",
  "accessLevel": "public"
},
    {
  "name": "readDictionary(forKey key: String) -> Dictionary<AnyHashable, Any>?",
  "type": "instance",
  "accessLevel": "public"
},
    {
  "name": "write(image: UIImage, forKey key: String, format: ImageFormat? = nil)",
  "type": "instance",
  "accessLevel": "public"
},
    {
  "name": "readImageForKey(key: String) -> UIImage?",
  "type": "instance",
  "accessLevel": "public"
}
  ]
},{
  "id": 6,
  "typeString": "extension",
  "methods": [
    {
  "name": "hasDataOnDisk(forKey key: String) -> Bool",
  "type": "instance",
  "accessLevel": "public"
},
    {
  "name": "hasDataOnMem(forKey key: String) -> Bool",
  "type": "instance",
  "accessLevel": "public"
}
  ]
},{
  "id": 7,
  "typeString": "extension",
  "methods": [
    {
  "name": "cleanAll()",
  "type": "instance",
  "accessLevel": "public"
},
    {
  "name": "clean(byKey key: String)",
  "type": "instance",
  "accessLevel": "public"
},
    {
  "name": "cleanMemCache()",
  "type": "instance",
  "accessLevel": "public"
},
    {
  "name": "cleanDiskCache()",
  "type": "instance",
  "accessLevel": "public"
},
    {
  "name": "cleanExpiredDiskCache()",
  "type": "instance",
  "accessLevel": "public"
},
    {
  "name": "cleanExpiredDiskCache(completion handler: (()->())? = nil)",
  "type": "instance",
  "accessLevel": "open"
}
  ]
},{
  "id": 8,
  "typeString": "extension",
  "methods": [
    {
  "name": "travelCachedFiles(onlyForCacheSize: Bool) -> (urlsToDelete: [URL], diskCacheSize: UInt, cachedFiles: [URL: URLResourceValues])",
  "type": "instance",
  "accessLevel": "fileprivate"
},
    {
  "name": "cachePath(forKey key: String) -> String",
  "type": "instance",
  "accessLevel": "internal"
}
  ]
},{
  "id": 13,
  "typeString": "extension",
  "properties": [
    {
  "name": "var md5: String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let data",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let message",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let MD5Calculator",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let MD5Data",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let MD5String",
  "type": "instance",
  "accessLevel": "internal"
}
  ]
},{
  "id": 14,
  "typeString": "extension",
  "methods": [
    {
  "name": "bytes(_ totalBytes: Int = MemoryLayout<Int>.size) -> [UInt8]",
  "type": "instance",
  "accessLevel": "internal"
}
  ]
},{
  "id": 15,
  "typeString": "extension",
  "methods": [
    {
  "name": "appendBytes(_ arrayOfBytes: [UInt8])",
  "type": "instance",
  "accessLevel": "internal"
}
  ]
},{
  "id": 16,
  "typeString": "extension",
  "methods": [
    {
  "name": "prepare(_ len: Int) -> Array<UInt8>",
  "type": "instance",
  "accessLevel": "internal"
}
  ]
},{
  "id": 17,
  "typeString": "extension",
  "methods": [
    {
  "name": "keysSortedByValue(_ isOrderedBefore: (Value, Value) -> Bool) -> [Key]",
  "type": "instance",
  "accessLevel": "internal"
}
  ]
},{
  "id": 24,
  "typeString": "extension",
  "protocols": [
    119
  ]
},{
  "id": 25,
  "typeString": "extension",
  "methods": [
    {
  "name": "numberOfSections(in tableView: UITableView) -> Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "protocols": [
    120
  ]
},{
  "id": 26,
  "typeString": "extension",
  "properties": [
    {
  "name": "var currentTheme: Setting.Theme",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "display(error: Constant.Error)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "display(weather: Weather.View)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "refreshWeather()",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "protocols": [
    22
  ]
},{
  "id": 27,
  "typeString": "extension",
  "properties": [
    {
  "name": "let refreshMessage",
  "type": "type",
  "accessLevel": "internal"
}
  ]
},{
  "id": 30,
  "typeString": "extension",
  "methods": [
    {
  "name": "sendError(error:Constant.Error = Constant.Error())",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "parse(weather: Weather.Result) -> Weather.View",
  "type": "instance",
  "accessLevel": "private"
}
  ]
},{
  "id": 31,
  "typeString": "extension",
  "properties": [
    {
  "name": "let city",
  "type": "type",
  "accessLevel": "internal"
},
    {
  "name": "let updatedTime",
  "type": "type",
  "accessLevel": "internal"
},
    {
  "name": "let weather",
  "type": "type",
  "accessLevel": "internal"
},
    {
  "name": "let temperature",
  "type": "type",
  "accessLevel": "internal"
},
    {
  "name": "let wind",
  "type": "type",
  "accessLevel": "internal"
},
    {
  "name": "let weatherDetail",
  "type": "type",
  "accessLevel": "internal"
},
    {
  "name": "let sydney",
  "type": "type",
  "accessLevel": "internal"
},
    {
  "name": "let melbourne",
  "type": "type",
  "accessLevel": "internal"
},
    {
  "name": "let wollongong",
  "type": "type",
  "accessLevel": "internal"
}
  ]
},{
  "id": 55,
  "typeString": "extension",
  "methods": [
    {
  "name": "textFieldShouldBeginEditing(_ textField: UITextField) -> Bool",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "showCitySelection()",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "protocols": [
    121
  ]
},{
  "id": 56,
  "typeString": "extension",
  "methods": [
    {
  "name": "numberOfSections() -> Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "numberOfRowsInSection(section: Int) -> Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "titleForRowAt( indexPath: IndexPath) -> (String, UITableViewCell.AccessoryType)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "didSelectRowAt(indexPath: IndexPath)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "protocols": [
    49
  ]
},{
  "id": 57,
  "typeString": "extension",
  "methods": [
    {
  "name": "adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle",
  "type": "instance",
  "accessLevel": "public"
}
  ],
  "protocols": [
    122
  ]
},{
  "id": 84,
  "typeString": "extension",
  "methods": [
    {
  "name": "onConsole(url: String? , response: String? )",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "decodingTask<T: Decodable>(with request: URLRequest, decodingType: T.Type, completionHandler completion: @escaping JSONTaskCompletionHandler) -> URLSessionDataTask",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "fetch<T: Decodable>(with request: URLRequest, decode: @escaping (Decodable) -> T?, completion: @escaping (APIResult<T?, APIError>) -> Void)",
  "type": "instance",
  "accessLevel": "internal"
}
  ]
},{
  "id": 85,
  "typeString": "extension",
  "properties": [
    {
  "name": "let unauthorizedAccess",
  "type": "type",
  "accessLevel": "internal"
},
    {
  "name": "let unauthorizedAccessTitle",
  "type": "type",
  "accessLevel": "internal"
}
  ]
},{
  "id": 90,
  "typeString": "extension",
  "properties": [
    {
  "name": "var urlComponents: URLComponents",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var components",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var urlRequest: URLRequest",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let url",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var request",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let headers",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var imageUrl: URL?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var components",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var hosname: String",
  "type": "instance",
  "accessLevel": "internal"
}
  ]
},{
  "id": 91,
  "typeString": "extension",
  "properties": [
    {
  "name": "var _queryParams:[URLQueryItem]",
  "type": "type",
  "accessLevel": "internal"
},
    {
  "name": "var queryParams: [URLQueryItem]",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var base: String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let env",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var path: String",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "protocols": [
    87
  ]
},{
  "id": 92,
  "typeString": "extension",
  "methods": [
    {
  "name": "string( format:String) -> String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "weatherDate() -> String",
  "type": "instance",
  "accessLevel": "internal"
}
  ]
},{
  "id": 93,
  "typeString": "extension",
  "methods": [
    {
  "name": "present(error: Constant.Error, completion: ( ()-> Void)? )",
  "type": "instance",
  "accessLevel": "internal"
}
  ]
},{
  "id": 94,
  "typeString": "extension",
  "properties": [
    {
  "name": "let error",
  "type": "type",
  "accessLevel": "internal"
}
  ]
},{
  "id": 95,
  "typeString": "extension",
  "methods": [
    {
  "name": "localized(comment: String = ) -> String",
  "type": "instance",
  "accessLevel": "internal"
}
  ]
},{
  "id": 96,
  "typeString": "extension",
  "properties": [
    {
  "name": "var theme: Setting.Theme",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let theme",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let createTheme",
  "type": "instance",
  "accessLevel": "internal"
}
  ]
},{
  "id": 97,
  "typeString": "extension",
  "methods": [
    {
  "name": "saveTheme<T: Codable>(_ value: T?)",
  "type": "instance",
  "accessLevel": "open"
},
    {
  "name": "retrieveTheme<T>(_ type: T.Type) -> T? where T : Decodable",
  "type": "instance",
  "accessLevel": "open"
}
  ]
},{
  "id": 98,
  "typeString": "extension",
  "methods": [
    {
  "name": "clean() -> String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "celcius() -> String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "fahrenheit() -> String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "kmPerHr() -> String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "milesPerHr() -> String",
  "type": "instance",
  "accessLevel": "internal"
}
  ]
},{
  "id": 99,
  "typeString": "extension",
  "methods": [
    {
  "name": "image( url: URL, completion:@escaping (Data?) -> Void )",
  "type": "instance",
  "accessLevel": "internal"
}
  ]
},{
  "id": 101,
  "typeString": "extension",
  "properties": [
    {
  "name": "var refreshControlTarget : RefreshControlTarget",
  "type": "type",
  "accessLevel": "internal"
},
    {
  "name": "var refreshcontrol: UIRefreshControl",
  "type": "type",
  "accessLevel": "internal"
},
    {
  "name": "var refreshControlTarget: Extension.RefreshControlTarget",
  "type": "instance",
  "accessLevel": "private"
}
  ],
  "methods": [
    {
  "name": "addRefreshControl(title: String, _ completion: Extension.RefreshControlTarget)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "refreshTarget(sender:Any)",
  "type": "instance",
  "accessLevel": "internal"
}
  ]
}] 