class AppConstants{
  static const String appName = "TrovExx";
  static const String appVersion = "1.0";

  //User data
  static const String userLocation= "";
  static const String passwor = "";

  //Endpoints
  static const String appBaseUrl = "http://10.136.50.155:8000/api/";

  static const String token = "";
  static const String registration = "auth/register";
  static const String login = "auth/login";

  //App State
  static const String HAS_RUN = "has_run";

  static const List<String> conditionList = [
    'Brand New',
    'Fairly Used'
  ];

  static const List<String> paymentList = [
    'assets/images/visa.png',
    'assets/images/mastercard.png',
    'assets/images/paypal.png',
  ];

  static const List<String> catList = [
    'Gadgets',
    'Mobile Phone/Tablets',
    'Fashion',
    'Grocery',
    'Farm Product',
    'Services',
    'Vehicle',
    'Household Items'
  ];


  static const List<String> subGadgetList = [
    'Camera',
    'Mobile Phone',
        'Tablets',
    'Laptops',
    'Power Bank',
    'Headphones',
  ];

  static const List schoolList = [  "University of Port Harcourt - Port Harcourt",
    "University of Ibadan - Ibadan",
    "University of Lagos - Lagos",
    "Covenant University - Ota",
    "Obafemi Awolowo University - Ile-Ife",
    "Federal University of Agriculture, Abeokuta - Abeokuta",
    "University of Abuja - Abuja",
    "University of Nigeria - Nsukka",
    "Lagos State University - Ojo",
    "Olabisi Onabanjo University - Ago Iwoye",
    "Federal University of Technology, Minna - Minna",
    "Federal University of Technology, Akure - Akure",
    "Ahmadu Bello University - Zaria",
    "Adekunle Ajasin University - Akungba Akoko",
    "Ladoke Akintola University of Technology - Ogbomoso",
    "University of Ilorin - Ilorin",
    "Afe Babalola University - Ado-Ekiti",
    "Godfrey Okoye University - Ugwuomu-Nike",
    "Babcock University - Ilishan-Remo",
    "Usmanu Danfodio University - Sokoto",
    "Federal University, Oye-Ekiti - Oye-Ekiti",
    "Nile University of Nigeria - Abuja",
    "Alex Ekwueme Federal University, Ndufu-Alike - Ikwo",
    "Rivers State University - Port Harcourt",
    "Kwara State University - Ilorin",
    "University of Jos - Jos",
    "Bayero University Kano - Kano",
    "Federal University of Technology, Owerri - Owerri",
    "University of Benin - Benin City",
    "Bowen University - Iwo",
    "Nnamdi Azikiwe University - Awka",
    "Redeemer's University - Ede",
    "American University of Nigeria - Yola",
    "Landmark University - Omu-Aran",
    "Ebonyi State University - Abakaliki",
    "Federal University, Lokoja - Lokoja",
    "Nasarawa State University - Keffi",
    "Ibrahim Badamasi Babangida University - Lapai",
    "Skyline University Nigeria - Kano",
    "Abia State University - Uturu",
    "University of Uyo - Uyo",
    "University of Calabar - Calabar",
    "Ekiti State University, Ado Ekiti - Ado-Ekiti",
    "Taraba State University - Jalingo",
    "Federal University, Lafia - Lafia",
    "Osun State University - Oshogbo",
    "Veritas University - Abuja",
    "Yusuf Maitama Sule University Kano - Kano",
    "Baze University - Abuja",
    "Pan-Atlantic University - Lagos",
    "African University of Science and Technology - Abuja",
    "University of Maiduguri - Maiduguri",
    "Lead City University - Ibadan",
    "Abubakar Tafawa Balewa University - Bauchi",
    "Delta State University, Abraka - Abraka",
    "Federal University of Petroleum Resources - Effurun",
    "Federal University, Dutsin-Ma - Dutsin-Ma",
    "Enugu State University of Science and Technology - Enugu",
    "Caleb University - Imota",
    "Benue State University - Makurdi",
    "Tai Solarin University of Education - Ijebu-Ode",
    "Imo State University - Owerri",
    "Al-Hikmah University - Ilorin",
    "Michael Okpara University of Agriculture - Umuahia",
    "Kaduna State University - Kaduna",
    "University of Agriculture, Makurdi - Makurdi",
    "Umaru Musa Yar'Adua University - Katsina",
    "Niger Delta University - Wilberforce Island",
    "Bingham University - Auta Balifi",
    "Ignatius Ajuru University of Education - Port Harcourt",
    "Ambrose Alli University - Ekpoma",
    "Edo University - Iyamho",
    "Elizade University - Ilara-Mokin",
    "Federal University, Birnin Kebbi - Birnin Kebbi",
    "Chukwuemeka Odumegwu Ojukwu University - Uli",
    "Federal University, Otuoke - Otuoke",
    "Gombe State University - Gombe",
    "Benson Idahosa University - Benin City",
    "University of Cross River State - Calabar",
    "The Technical University - Ibadan",
    "Rhema University - Aba",
    "Kogi State University - Anyigba",
    "Federal University, Dutse - Dutse",
    "Modibbo Adama University of Technology - Yola",
    "Igbinedion University Okada - Okada",
    "Anchor University, Lagos - Lagos",
    "Adeleke University - Ede",
    "Bells University of Technology - Ota",
    "Ajayi Crowther University - Oyo Town",
    "Gregory University, Uturu - Uturu",
    "Moshood Abiola Polytechnic, Abeokuta - Abeokuta",
    "Akwa Ibom State University - Ikot Akpad",
    "University of Medical Sciences - Ondo City",
    "Kano University of Science and Technology - Wudil",
    "Joseph Ayo Babalola University - Ikeji-Arakeji",
    "Augustine University - Ilara",
    "Mountain Top University - Makogi Oba",
    "Madonna University, Nigeria - Elele",
    "Chrisland University - Abeokuta",
    "Kings University - Odeomu",
    "Federal University, Kashere - Kashere",
    "Fountain University, Osogbo - Oshogbo",
    "Bauchi State University - Gadau",
    "Novena University - Ogume",
    "Achievers University, Owo - Owo",
    "Summit University Offa - Offa",
    "Crawford University - Faith City",
    "Coal City University - Enugu",
    "Al-Qalam University, Katsina - Katsina",
    "Admiralty University of Nigeria - Ibusa",
    "Paul University - Awka"
  ];



  static const String hasSeenOnboarding = "HasSeenOnboarding";
  static const String HAS_LOGIN = "HAS_LOGIN";

}