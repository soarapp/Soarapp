////////////////////////////////////
//****GLOBALLYUSEDVARIABLES****//
///////////////////////////////////

//Thesevariablestellthecurrentstateofwhetherasongisplayingornotandwhichone
bool favSongCurrentlyPlaying = false;
bool aSongCurrentlyPlaying = false;
bool songIsOrWasPlaying = true;

//Thevaluesoftheindicesofthisarrayindicatewhetherornotadesiredmoodwaschosen(1=chosen,0=not)
//theindicescorrespondtothephysicallocationsofthebuttonslikethis:
//04
//15
//26
//37
var moodNowButtonArray = [0, 0, 0, 0, 0, 0, 0, 0];
var moodDesiredButtonArray = [0, 0, 0, 0, 0, 0, 0, 0];

//Thisintisthedesiredplaylistlengthchosenbytheuserfortheirnewplaylist
//0=select,1=15mins,2=30mins,3=45mins,4=1hour....
int playlistTimeChosen = 0;

//Thisindicatedwhichtypeofplaylisttheuserchosefromeither'mymusic'orfrom'discovernewmusic'
//0being'mymusic'frommoodpage,1being'discovernewmusic'
int musicTypeChosen = 0;

//////////////////////////////
//IMAGESANDICONSBYPAGE://
/////////////////////////////

//homepage
List<String> playlistNamesList = [
  playlistName1,
  playlistName2,
  playlistName3,
  playlistName4,
  playlistName5
];
List<String> playlistImagesList = [
  'album1',
  'album2',
  'album1',
  'album4',
  'album2'
];
String imagePath = 'assets/images/songs/';
String homeBackgroundImg = "assets/images/backgrounds/homepageBackground.png";
String myMusic = 'My Music';
String currSong = 'Lies We Told';
String currSongArtist = 'Fallen Roses';
String playIcon = 'assets/images/icons/playIcon.png';
String pauseIcon = 'assets/images/icons/pauseIcon.png';
String skipIcon = 'assets/images/icons/skipIcon.png';
String favSongImg = 'assets/images/songs/favSong.jpg';
String jpg = '.jpg';
String forwardSlash = '/';
String currFavSong = 'Current Favorite Song';
String favSongName = 'Take Care';
String favSongArtist = 'Beach House';
String myPlaylists = 'My Playlists';

//moodpages
String moodQuizBackground = 'assets/images/backgrounds/moodQuizBackground.png';
String fourDots = 'assets/images/icons/fourDotsIcon1.jpg';
String fourDots2 = 'assets/images/icons/fourDotsIcon2.png';
String fourDots3 = 'assets/images/icons/fourDotsIcon3.png';
String blackQuestionIcon = 'assets/images/icons/whiteQuestionIcon.png';
String whiteQuestionIcon = 'assets/images/icons/blackQuestionIcon.png';
String moodNowButton0 = 'Stressed';
String moodNowButton1 = 'Anxious';
String moodNowButton2 = 'Happy';
String moodNowButton3 = 'Frustrated';
String moodNowButton4 = 'Tired';
String moodNowButton5 = 'Down';
String moodNowButton6 = 'Excited';
String moodNowButton7 = 'Upbeat';
String moodSoonButton0 = 'Relaxed';
String moodSoonButton1 = 'Lighthearted';
String moodSoonButton2 = 'Sleepy';
String moodSoonButton3 = 'Creative';
String moodSoonButton4 = 'Upbeat';
String moodSoonButton5 = 'Energetic';
String moodSoonButton6 = 'Cheerful';
String moodSoonButton7 = 'Excited';
String next = 'NEXT';
String feelNow = 'How do you feel \nright now?';
String rn = 'right now?';
String feelSoon = 'How would you like to feel?';
String noneDescribe = 'None of these describe how I\'m feeling';
String noDesire = 'I do\'nt want to feel a specific way';

//resourcepages
String resourcesBackground =
    'assets/images/backgrounds/resourcesBackground.png';
List<String> information = [
  'Mental Health',
  'Cancer and Oncology',
  'Music Therapy'
];
List<String> questions = [
  'What is music therapy?',
  'What do music therapists do?',
  'Who can benefit from music therapy?',
  'Is there research to support music therapy?',
  'What are some misconceptions about music therapy?',
  'What\'s the most common type of music in music therapy?'
];
List<String> answers = [
  'Music Therapy is the clinical and evidence based use of music interventions to accomplish individualized goals within a therapeutic relationship by a credentialed professional who has completed an approved music therapy program.',
  '',
  '',
  '',
  '',
  '',
  ''
];
List<String> mentalHealthResources = [
  'American Institute for Cancer Research',
  'National Institute of Mental Health',
  'National Alliance on Mental Illness',
  'National Council for Behavioral Health'
];
List<String> mentalHealthResourcesDetails = [
  'The American Institute for Cancer Research promotes research and education on diet and cancer prevention. When you call or email the Nutrition Hotline, your question will be taken, and your call will be returned within three business days by a registered dietitian(RD).',
  '',
  '',
  ''
];
List<String> mentalHealthResourcesNumbers = ['800-843-8114', '', '', ''];
List<String> mentalHealthResourcesLinks = ['https://www.aicr.org/', '', '', ''];
List<String> cancerResources = [
  'American Institute for Cancer Research',
  'Cancer Care',
  'Cancer Hope Network'
];
List<String> cancerResourcesDetails = [
  'The American Institute for Cancer Research promotes research and educationon diet and cancer prevention. When you call or email the Nutrition Hotline, your question will be taken, and your call will be returned within three business days by a registered dietitian(RD).',
  '',
  ''
];
List<String> cancerResourcesNumbers = ['800-843-8114', '', ''];
List<String> cancerResourcesLinks = ['https://www.aicr.org/', '', ''];
String questionQuoteIcon = 'assets/images/icons/questionQuoteIcon.png';
String callIcon = 'assets/images/icons/callIcon.png';
String bluePlusIcon = 'assets/images/icons/bluePlusIcon.png';
String bluePhoneIcon = 'assets/images/icons/bluePhoneIcon.png';
String bluePaperclipIcon = 'assets/images/icons/bluePaperclipIcon.png';
String upArrow = 'assets/images/icons/upArrowIcon.png';
String downArrow = 'assets/images/icons/downArrowIcon.png';

//bottomiconbar
String chatIcon = 'assets/images/icons/chatIconGrey.png';
String calendarIcon = 'assets/images/icons/calendarIconGrey.png';
String musicIcon = 'assets/images/icons/musicIconGrey.png';
String questionIcon = 'assets/images/icons/questionIconGrey.png';
String userIcon = 'assets/images/icons/userIconGrey.png';
String chatIconB = 'assets/images/icons/chatIconBlack.png';
String calendarIconB = 'assets/images/icons/calendarIconBlack.png';
String musicIconB = 'assets/images/icons/musicIconBlack.png';
String questionIconB = 'assets/images/icons/questionIconBlack.png';
String userIconB = 'assets/images/icons/userIconGrey.png';

//playlistpage
String playlistName1 = 'Restless to Sleepy';
String playlistName2 = 'Down to Lighthearted';
String playlistName3 = 'Tired to Upbeat';
String playlistName4 = 'Human to SuperHero';
String playlistName5 = 'Stress to Relaxation';
