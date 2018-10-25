package edu.neu.regist.resources;

public class Topics {
	public static String searchTopic(String topic) {
		String content = "";
		switch(topic){
		case "weather" : content = weather;break;
		case "news" : content = news;break;
		case "sports" : content = sports;break;
		case "games" : content = games;break;
		case "technology" : content = technology;break;
		case "education" : content = education;break;
		default : content = topic;break;
		}
		return content;
	}
	
	private static final String weather =
			"<h1>Here\'s where, and how much, snow will fall in Massachusetts on Thursday</h1>"
			+ "<p>\"Welcome to the second half of April and it\'s snowing/sleeting.\"</p>"
			+ "<p>You might be ready for spring, but the weather has other ideas.</p>"
			+ "<p>It\'s snowing in Massachusetts on Thursday.</p>"
			+ "<p>The National Weather Service is predicting that parts of the state could see a coating of up to 2 inches with most of the accumulation occurring on grassy surfaces.</p>"
			+ "<p>\"Welcome to the second half of April and it\'s snowing/sleeting,\" service forecasters said.</p>"
			+ "<p>Boston is expected to see little to no accumulation. According to the service\'s seven-day forecast for the city, rain and sleet will turn to all rain after noon.</p>"
			+ "<p>The service\'s map predicting where snow will fall in the rest of the state.</p>";
	
	private static final String news =
			"<h1>\"I\'m hoping to walk again\": Boston community rallies to help teacher Chris Wiley after sudden paralysis</h1>"
			+ "<p>The 29-year-old high school math teacher is paralyzed from the waist down after suffering a stroke following a surgery.</p>"
			+ "<p>On April 9, Chris Wiley wasn\'t feeling well, but he decided to go to work anyway, to Jeremiah E. Burke High School in Dorchester where he teaches math.</p>"
			+ "<p>Once there, though, his principal noticed he wasn\'t well and suggested he go home and take care of himself. The 29-year-old decided to go straight to the doctor.</p>"
			+ "<p>At the doctor, Wiley\'s vitals were all \"going wacky,\" according to his mother, Lynda Johnson.</p>"
			+ "<p>He was rushed to Boston Medical Center.</p>"
			+ "<p>\"He was in pretty bad shape,\" his mother said. \"He was pretty sick.\"</p>"
			+ "<p>At BMC, doctors found that Wiley had an infection on the back of his head that needed to be removed surgically. They did an MRI afterward, Johnson said, just to make sure things looked alright.</p>";
	
	private static final String sports =
			"<h1>Bucks starting center John Henson out for Game 3</h1>"
			+ "<p>MILWAUKEE (AP) - Milwaukee Bucks starting center John Henson will miss the playoff game Friday night against the Boston Celtics with a sore back.</p>"
			+ "<p>Seven-footer Tyler Zeller, who used to play for Boston, is listed as the probable starter. The Bucks trail Boston 2-0 in their best-of-seven, first-round Eastern Conference playoff series.</p>"
			+ "<p>Coach Joe Prunty has also listed Malcolm Brogdon as the probable starter over Tony Snell at guard alongside Eric Bledsoe. The Bucks\' starting backcourt has been outscored 96-25 in the first two games by Boston\'s starting guard duo of Terry Rozier and Jaylen Brown.</p>"
			+ "<p>Henson was second on the team in rebounding, averaging 6.8 per game. The Celtics have decisive edges in offensive rebounding (20-12) and second-chance points (42-13) going into Game 3.</p>";
	private static final String technology =
			"<h1>Tech Tent: Fake videos stir distrust</h1>"
			+ "<p>On Tech Tent this week we look at the advances in technology which allow you to get anybody to say anything, and explore their implications.</p>"
			+ "<p>It was a video featuring Barack Obama talking about a character from the hit movie Black Panther, and then making a crude remark about Donald Trump, which raised new concerns about this subject. It was not of course genuine - the actor Jordan Peele's voice had been synced to the lips of the former US president.</p>"
			+ "<p>The video was created by Buzzfeed using software called FakeApp, a freely available tool which has also been used to superimpose the faces of celebrities into porn videos. The exercise was designed to get people thinking about the threat posed by these techniques,</p>"
			+ "<p>Prof Dame Wendy Hall, one of the authors of a UK government report on artificial intelligence, explains what is making this fakery possible: \"It's what's happening generally with AI - the development of new techniques, deep learning algorithm techniques that can learn from data, in this case video data.\" She says this is \"quite scary\".</p>"
			+ "<p>Lots of companies are working on this kind of technology including the Canadian start-up Lyrebird which says it can create a digital copy of anyone's voice from just a minute-long sample of their speech.</p>";
	
	private static final String games =
			"<h1>Omega Labyrinth Z anime game banned in the UK</h1>"
			+ "<p>PlayStation game Omega Labyrinth Z has been banned from sale in the UK because it \"promotes the sexualisation of children\".</p>"
			+ "<p>The Video Standards Council said the \"likely harm\" it would do to the young people it was aimed at meant it would not get an age rating.</p>"
			+ "<p>Without a rating it is illegal to sell the game in the UK.</p>"
			+ "<p>In a tweet, distributor PQube said its appeal against the decision had been rejected.</p>"
			+ "<p>\"This is a really rare occurrence, with only four games in the past 20-plus years having been refused ratings before to my knowledge,\" commented Ian Morris, editor of the Everybody Plays video game news site.</p>";
	
	private static final String education =
			"<h1>UK teacher wins global best teacher prize</h1>"
			+ "<p>A teacher from north London has been announced as winner of a competition to find the world's best teacher.</p>"
			+ "<p>Andria Zafirakou, who teaches art and textiles in a Brent secondary school, has won a prize worth $1m (£720,000).</p>"
			+ "<p>She has spoken of the hardship and overcrowded housing conditions facing many of her pupils.</p>"
			+ "<p>But in accepting the prize, she called for more support for the \"power of the arts\" in school, particularly for the \"poorest communities\".</p>"
			+ "<p>The prize, launched in 2015 by an education charity, the Varkey Foundation, was created to give more status to the teaching profession, with an Oscars-style awards ceremony in Dubai.</p>";
	
	
	
}
