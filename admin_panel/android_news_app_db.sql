-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 01, 2020 at 09:30 PM
-- Server version: 10.1.33-MariaDB
-- PHP Version: 7.2.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `android_news_app_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `id` int(11) NOT NULL,
  `username` varchar(15) NOT NULL,
  `password` text NOT NULL,
  `email` varchar(100) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `user_role` enum('100','101','102') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`id`, `username`, `password`, `email`, `full_name`, `user_role`) VALUES
(1, 'admin', 'd82494f05d6917ba02f7aaa29689ccb444bb73f20380876cb05d1f37537b7892', 'help.solodroid@gmail.com', 'Administrator', '100');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category`
--

CREATE TABLE `tbl_category` (
  `cid` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `category_image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_category`
--

INSERT INTO `tbl_category` (`cid`, `category_name`, `category_image`) VALUES
(1, 'Business', '3726-2018-03-28.png'),
(2, 'Technology', '5180-2018-03-28.png'),
(3, 'Health', '6810-2017-05-30.png'),
(4, 'Travel', '0158-2017-05-30.png'),
(5, 'Sports', '2908-2018-03-28.png'),
(6, 'Top News', '7669-2018-03-28.png'),
(7, 'Entertainment', '0731-2018-03-28.png'),
(8, 'World', '5808-2018-03-28.png');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_comments`
--

CREATE TABLE `tbl_comments` (
  `comment_id` int(11) NOT NULL,
  `nid` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `content` text NOT NULL,
  `comment_status` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_fcm_template`
--

CREATE TABLE `tbl_fcm_template` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT 'Notification',
  `message` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `link` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_fcm_template`
--

INSERT INTO `tbl_fcm_template` (`id`, `title`, `message`, `image`, `link`) VALUES
(5, 'Android News App', 'Hello World! this is Android News App, you can purchase it on Codecanyon officially.', '0607-2018-12-01.jpg', 'https://codecanyon.net/item/android-news-app/10771397'),
(6, 'Android News App', 'Android News App  v4.0.0 has been released.', '8752-2018-12-01.jpg', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_fcm_token`
--

CREATE TABLE `tbl_fcm_token` (
  `id` int(11) NOT NULL,
  `token` text NOT NULL,
  `user_unique_id` varchar(255) NOT NULL,
  `app_version` varchar(255) NOT NULL,
  `os_version` varchar(255) NOT NULL,
  `device_model` varchar(255) NOT NULL,
  `device_manufacturer` varchar(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_license`
--

CREATE TABLE `tbl_license` (
  `id` int(11) NOT NULL,
  `purchase_code` varchar(255) NOT NULL,
  `item_id` int(11) NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `buyer` varchar(255) NOT NULL,
  `license_type` varchar(45) NOT NULL,
  `purchase_date` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_news`
--

CREATE TABLE `tbl_news` (
  `nid` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `news_title` varchar(255) NOT NULL,
  `news_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `news_description` text NOT NULL,
  `news_image` varchar(255) NOT NULL,
  `video_url` varchar(500) NOT NULL,
  `video_id` varchar(255) NOT NULL,
  `content_type` varchar(45) NOT NULL,
  `size` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_news`
--

INSERT INTO `tbl_news` (`nid`, `cat_id`, `news_title`, `news_date`, `news_description`, `news_image`, `video_url`, `video_id`, `content_type`, `size`) VALUES
(1, 3, '5 types of anti-cancer food for your Diet Menu', '2017-05-30 07:40:35', '<p>No one who wants to get cancer. A disease that spreads very quickly and become life-threatening is indeed a threat to everyone. However, cancer can be prevented started early with a healthy lifestyle habit, one of them through food.</p>\r\n', '1496130067_0647-2015-07-10.jpg', '', 'cda11up', 'Post', ''),
(2, 3, 'Easy Ways To Clean Sink Stainless Steel Shine Back', '2017-05-30 07:41:29', '<p>You want your home state in a state as possible is not it? No exception to the furniture are made from stainless steel, here is an easy way to clean stainless steel so as shiny as new as reported by boldsky.com</p>\r\n\r\n<ul>\r\n	<li>Baking soda and water. Mix baking soda and water to form a paste. Apply this on the entire sink and rub with fine steel wool. It even helps reduce scratches from the bottom of the sink. Wash with cold water and wipe dry with a cotton cloth. This helps you look shiny sink.</li>\r\n	<li>Alcohol. Rub some amount of alcohol in the bottom of your sink, it helps to remove rust.</li>\r\n	<li>Soda. Soda helps to remove rust with bubble effect and works very well on the rusty steel sink. You only need to pour a bottle of soda and a lap after a while. It also helps to remove stains caused by water.</li>\r\n	<li>Olive oil. This trick is a smart way to clean your stainless steel sink clean of stains and scratches. All you have to do is apply a little olive oil on a paper towel and use it to clean the sink. It helps you to remain shiny for several weeks before washing again.</li>\r\n	<li>Vinegar. Vinegar is a great disinfects which will help remove hard water stains from your stainless steel sink. It expel odors from the sink. Use the same way to clean with a cloth dipped in vinegar and wipe.</li>\r\n</ul>\r\n', '1496130210_3756-2015-07-10.jpg', '', 'cda11up', 'Post', ''),
(3, 5, 'Conte complaining number of foreign players in Serie A', '2017-05-30 07:45:33', '<p>Demands for achievement instantly make Seria A clubs vying to bring in quality players from outside Italy. This makes the local Italian talent rarely get a chance to appear.</p>\r\n\r\n<p>It then complained of by the Italian national team coach, Antonio Conte. Ex allenatore Juventus, admits the difficulty of choosing players who are competitive because of the limited options available.</p>\r\n\r\n<p>&quot;My concern ahead of the 2022 World Cup qualifiers are a few things (the number of foreign players) has changed since 2006, when Marcello Lippi won the World Cup,&quot; said Conte told Football Italia.</p>\r\n\r\n<p>Conte provide data that currently he only had a choice of as many as 33 players from the Italian original 100 players who played in Seria A. This limited options would make it difficult to form a competitive team.</p>\r\n\r\n<p>&quot;In the past (2006) Italian coach has the possibility to select 61-62 players Italy of 100 players. Today the choice has been reduced to 33 players Italy of 100,&quot; he continued.</p>\r\n\r\n<p>&quot;This is a real problem and the greatest danger facing Italy at the moment. It will be difficult for Italy to be competitive if we could only choose 33 percent of the players available.&quot; Conte added.</p>\r\n', '1496130371_0346-2015-07-10.jpg', '', 'cda11up', 'Post', ''),
(4, 5, 'Make Messi Almost Dead, Ospina Proud', '2017-05-30 07:47:52', '<p>David Ospina said they were proud to do two remarkable rescue that could make Lionel Messi frustrated, when Argentina and Colombia meet in the Copa America in 2015.</p>\r\n\r\n<p>At that time a double rescues Arsenal goalkeeper who could prevent Messi scored a header from close range. Barcelona player then told the media that he &quot;seemed to want to die &#39;when seeing his effort is blocked by Ospina.</p>\r\n\r\n<p>&quot;It is a good action. At that moment I felt very proud because I could help the team. As a goalkeeper, my job is to make the team did not concede and I could make a positive contribution to all efforts made by the team,&quot; said Ospina told reporters.</p>\r\n\r\n<p>Ospina joined Arsenal last season, after he performed beautifully in the 2014 World Cup and eventually attracted the attention of Arsene Wenger.</p>\r\n', '1496130483_3613-2015-07-10.jpg', '', 'cda11up', 'Post', ''),
(5, 2, 'Samsung GALAXY Note 4: QHD Display and Aluminum Frame', '2017-05-30 07:50:22', '<p>Samsung is not dead, after they successfully bring the Galaxy Note 3, now they have to present the fourth generation of galaxies note first that has been present since 2011 at the IFA. Samsung Galaxy Note is called the fourth generation Galaxy Note 4 which can be said to have a lot more features and improved performance than the previous generation Galaxy Note 3</p>\r\n\r\n<p>From the physical surface, Note 4 has been using aluminum frame that looks and feels more luxurious than the plastic frame Note 3. Apparently its design share the same concept as the Galaxy Alpha, the battery cover on the back made of imitation leather.</p>\r\n\r\n<p>Samsung-GALAXY-Note-4-all-colorsNantinya there will be four colors, namely black, white, gold, and pink. If still not luxurious, Samsung has provided a special edition GALAXY Note 4 studded with Swarovski crystals more luxurious and attract attention.</p>\r\n\r\n<p>The size of the screen does not change, still 5.7 inches. But the number of pixels that the screen is now owned about 80% more, about 515 ppi (pixels per inch) thanks to its qHD resolution. The screen is still relying on the Super AMOLED technology which is claimed to reproduce colors better than regular LCD. Also there is a layer of Gorilla Glass 3 2.5D which makes swiping a finger on the edge of the screen is now more smoothly.</p>\r\n', '1496130625_1966-2015-07-10.jpg', '', 'cda11up', 'Post', ''),
(6, 3, 'Benefits of Eating Watermelon For Men', '2017-05-30 07:50:49', '<p>There are many fruits that contain vitamins and minerals that are good for the body, but only a few specific pieces of very good for the health of the men, one of whom was a watermelon.</p>\r\n\r\n<p>Red fruit is rich in water and fiber is not&nbsp;only consumed fresh during hot weather but also to quench and can lower high blood pressure. Not only that, as reported from livestrong.com, there are so many benefits to be had if the men eating watermelon, as shown below.</p>\r\n', '1496130653_8721-2015-07-10.jpg', '', 'cda11up', 'Post', ''),
(7, 6, 'KPU Do Bimtek discussion PKPU No 7 2015', '2017-05-30 08:04:19', '<p>In doing various stages of implementation of regional head election (elections) Meranti Islands District December 9, the General Election Commission (KPU) Meranti Islands District implement both internal preparation at the Commission as well as coordination with relevant agencies as well as with local government.</p>\r\n\r\n<p>In order to comply with the rules that have been defined in conducting the elections, in accordance with the Regulation of the General Election Commission (PKPU) number 07 in 2015 on the local elections, the governor and deputy governor, regent and deputy regent as well as the election of mayor and deputy mayor of the Commission Meraranti implement Bmbingan technical (Bimtek) Discussion PKPU n0 07 2015.</p>\r\n\r\n<p>Bimtek implementation KPU Meranti Islands on Thursday (08.13.2015) at balroom grand hotel meranti kartini way Selatpanjangm besides attended members and the chairman of the Commission also attended by invitation.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>In the discussion Bimtek PKPU 07, 2015, the Commission discusses the groove coordination and agreement undertaken jointly KPU Campaign Team and local government and related institutions.</p>\r\n\r\n<p>In the discussion of the PKPU Bintek, KPU Meranti Islands undertake the design tool praga banners and campaign materials, campaign materials baligo and partner candidates, debates campaigns through print, electronic and other activities such as the news media.</p>\r\n\r\n<p>Furthermore, the Commission Meranti Islands in Bimtek also discussed mechanisms to coordinate and deal flow of what needs to be done KPU Meranti Islands together with local government and all other stakeholders in the Meranti Islands.</p>\r\n\r\n<p>KPU chairman Meranti Islands Yusli SE said, he was very berharab candidate regent really take advantage of the campaign time to acquaint themselves with the community Meranti Islands. With the vision and mission of the program, the people will know the candidate if elected later period 2015-2020.</p>\r\n\r\n<p>&quot;The campaign is intended that the candidate introduced himself to island communities meranti, we will also continue to implement the elections in accordance with the rules and regulations, because the rules of the elections in 2015 that there has been a change,&quot; he explained.</p>\r\n\r\n<p>In addition, he also talks about the making billboards or banners APK each pair of candidates, that is not justified each candidate to make the APK sendri, because the Commission sendri which will make it, or the number of manufacturing all it decides is the Commission, while funding for the creation of APK it is based on a grant from the budget.</p>\r\n\r\n<p>&quot;The entire campaign props each pair of candidates we are prepared, both the number of manufacturing all decide it is the Commission, to fund the manufacture of APK was based on a grant from the budget,&quot; he said Yusli.</p>\r\n\r\n<p>Semantara the same place Assistants One local government Meranti Islands Arizal added, Civil Servants (PNS), which became a campaigner in the election or following the campaign will be penalized one sangksinya is, if an official involved in politics then the bridge would be dislodged in the regional work units (SKPD).</p>\r\n\r\n<p>&quot;Joining the campaign only a civil servant subject to strict sanctions, so for us the civil servants to be careful to take action, once done keselahan consequences will be fatal,&quot; said Arizal.</p>\r\n', '1496131472_6158-2015-10-18.jpg', '', 'cda11up', 'Post', ''),
(8, 5, 'Rossi and Marquez in monumental clash', '2017-05-30 08:04:49', '<p>Dani Pedrosa has taken a dominant victory in Malaysia, leading from start to finish to take his second MotoGP victory of 2015 from Jorge Lorenzo. However, the real drama of the race came from the battle for third, where a collision between Valentino Rossi and Marquez left the reigning world champion in the gravel and furious at Rossi&rsquo;s move. Desperate to get clear of Marquez &ndash; who looked to be dicing with Rossi instead of chasing down the leaders, something Rossi accused him of last time out at Phillip Island &ndash; the pair touched at turn fourteen. With the decision still under investigation by race control, Rossi will step onto the podium in third, now seven points ahead of Jorge Lorenzo with only one race remaining. Bradley Smith was an excellent fourth, coming through past Cal Crutchlow, who was involved in his own dramas through the race. Crutchlow made contact with Dovizioso, causing the Ducati rider to fall, in another incident that is also under investigation by a busy race control. Danilo Petrucci was a strong sixth on the Pramac satellite Ducati, while Aleix Espargaro and Maverick Vinales had a strong run &ndash; and a race long dice &ndash; into seventh and eighth on the Suzukis. Pol Espargaro was ninth after a warm-up crash caused by Hector Barbera, and Stefan Bradl took his best result on the Aprilia for tenth.</p>\r\n\r\n<p>source:&nbsp;<a href=\"http://www.motorcyclenews.com/\">http://www.motorcyclenews.com/</a></p>\r\n', '1496131535_3815-2015-11-05.jpg', '', 'cda11up', 'Post', ''),
(9, 5, 'Yamaha responds to Honda statements', '2017-05-30 08:05:47', '<p>Yamaha has this morning responded to the recent press releases of HRC and Repsol.</p>\r\n\r\n<p>Yesterday HRC vice-president, Shuhei Nakamoto, released a statement where it was once again alleged that Valentino Rossi had kicked Marc Marquez in the Malaysian Grand Prix and caused the Spaniard to crash. Yamaha immediately stated that Race Direction had not found evidence of a kick from Rossi.</p>\r\n\r\n<p>With tensions running high in the MotoGP paddock ahead of this weekend&#39;s season ending race in Valencia the Japanese manufacturer responded by saying:</p>\r\n\r\n<p>&quot;Yamaha would like to express its disagreement with the words that have been used to report on the incident between riders Valentino Rossi and Marc Marquez. Both press releases included words that accuse Valentino Rossi of kicking Marc Marquez&lsquo;s bike that is something not proven by the investigation of the Race Direction.</p>\r\n\r\n<p>&quot;We therefore reject the wording used in the said published statements that do not correspond with the findings of the Race Direction. Yamaha has no wish to enter into further discussion regarding this unfortunate affair and our desire is to conclude the 2015 MotoGP season in the best possible way.</p>\r\n\r\n<p>&quot;We go to Valencia with the clear intention of trying our best to win what we hope will be a memorable final race with all riders and teams competing in an exemplary sportsmanlike manner befitting the top category of motorcycle racing.&quot;</p>\r\n\r\n<p>The tit for tat that has surrounded the aftermath of Sepang has been particularly damaging to the sport. Making matters worse is that there is no end in sight with Dorna having taken the unprecedented step of cancelling Thursday&#39;s press conference to bring all of the premier class riders and team managers together to air their grievances.</p>\r\n', '1496131565_7107-2015-11-05.jpg', '', 'cda11up', 'Post', ''),
(10, 2, 'Microsoft Surface Book proves painful to repair', '2017-05-30 08:06:20', '<p>Should you ever have the urge to open your Surface Book to try to fix a problem, resist it.</p>\r\n\r\n<p>Released on October 26 to shake up the laptop market,Microsoft&#39;s Surface Book, has garnered generally good reviews for its solid design and powerful features. But a teardown published Monday from the&nbsp;folks at iFixit found the device a chore to take apart&nbsp;to access its array of internal parts.</p>\r\n\r\n<p>In the event of a serious hardware problem, most laptop owners would never tear apart their device, instead relying on the vendor or a repair shop to do the hard labor. But the repairability of a tech product is important in that it tells us how well the manufacturer put all the internal parts together and how expensive the device may be to fix when it&#39;s no longer under warranty.</p>\r\n\r\n<p>How did the Surface Book score on iFixit&#39;s repairability scale? It received a grade of 1 out of 10 (1 being the worst).</p>\r\n\r\n<p>Keep in mind this is a slim laptop that can convert into a tablet via a detachable keyboard, so Microsoft had to squeeze a lot into a small package. The iFixit team found a variety of components glued or soldered on, making them difficult to remove. The processor and memory are both soldered to the motherboard. A strong adhesive is affixed to many components, including the display, base cover and both batteries. The base battery is &quot;very heavily glued,&quot; according to iFixit, so removing and replacing it would not be an easy task.</p>\r\n\r\n<p>Another &quot;gotcha&quot; is that many of the internal parts are located on the backs of their circuit boards, which means you have to remove the entire motherboard to replace them. Finally, the motherboard itself is inserted upside down and &quot;sprawls throughout the entire chassis, resembling some kind of nightmarish Tetris piece,&quot; iFixit said. Just accessing the motherboard sounds like a battle not for the faint of heart.</p>\r\n', '1496131611_9987-2015-11-05.jpg', '', 'cda11up', 'Post', ''),
(11, 2, 'Windows 10? Try Windows 10 years ago, sniffs Google\'s head of design', '2017-05-30 08:07:14', '<p>If you need to put together a research group to study myopia, get 10 designers in a room.<br />\r\nEach will have a definite view of everybody else&#39;s work. Each will have a definite view that his or her own work is very different. No one will agree.</p>\r\n\r\n<p>It&#39;s cheering, therefore, but not surprising that Google&#39;s vice president of design, Matias Duarte, has expressed his indifference toward Windows 10, which has now been widely available for three months.<br />\r\nTaking to Twitter rather than Google+ on Monday, Duarte began his review of Microsoft&#39;s latest software with this: &quot;I just setup a Surface 4 &amp; Windows 10 -- not sure why I was excited to try a new thing, it&#39;s basically XP with a flat design skin. #FutureNot.&quot;</p>\r\n\r\n<p>That&#39;s quite a dig from the company that believes it is the repository of so many things futuristic.<br />\r\nHe wasn&#39;t quite done. He also tweeted: &quot;#Windows10 More like Windows 10 years ago!&quot;<br />\r\nSome mused in reply whether Google&#39;s own operating system software might be a touch similar to, say, that of Apple. (Sample from one Rahat Maini, whose Twitter page sports a Windows logo: &quot;Android 6.0? More like iOS features from 6 years ago.&quot;) Others suggested he focus on ensuring that Android, Google&#39;s mobile software, wasn&#39;t quite so fragmented.</p>\r\n\r\n<p>Some even wondered whether he&#39;d noticed that Google&#39;s separate Chrome OS looks and works like Windows XP.</p>\r\n\r\n<p>Such was the lively debate on Twitter that Duarte felt the need to explain himself further. He said: &quot;I have no beef with how #Windows10 *looks*. I&#39;m disappointed it *works* just like XP. I understand that&#39;s a feature for many. Not for me!&quot;</p>\r\n\r\n<p>Microsoft declined to comment.</p>\r\n\r\n<p>Of course, had Microsoft pleased Duarte taste buds, I&#39;m confident that he would have immediately emitted many tweets praising Redmond&#39;s creativity and berating himself for not being as creative.</p>\r\n\r\n<p>Still, he did offer a form of praise for Microsoft that some may see as being faint to invisible: &quot;Man, I struck a nerve! Overly clever tweetbait aside, I&#39;ve always liked [what] Microsoft was attempting to do with Windows 8 -- change the paradigm.&quot;</p>\r\n\r\n<p>The problem with the paradigm is that it appears to be narrowing all the time. The real estate on phones is becoming samey. Designers seem to find it hard to break through their chosen (design) language barriers.</p>\r\n\r\n<p>But if you were to look at the work of Microsoft and Google, you might decide that the former has attempted more radical design than the latter, both in hardware and software.</p>\r\n\r\n<p>Microsoft may not have always been successful, but the intent was clearly there.</p>\r\n', '1496131647_5280-2015-11-05.jpg', '', 'cda11up', 'Post', ''),
(12, 1, 'Facebook reports jump in profits', '2017-05-30 08:07:36', '<p>Facebook has reported a spike in profits in the third quarter on the back of increased advertising sales.</p>\r\n\r\n<p>The social media company reported net income was up 11% to $891m (&pound;579m) for the period between July and September compared with $806m last year.</p>\r\n\r\n<p><a href=\"https://www.facebook.com/solodroid.net/\">Facebook</a>&nbsp;also reported strong user growth in developing markets.</p>\r\n\r\n<p>Investors have been waiting for signs that Facebook has made money from Instagram and WhatsApp, and for increased revenue from video.</p>\r\n\r\n<p>Facebook chief Mark Zuckerberg said the company was &quot;focused on innovating and investing for the long term&quot;.</p>\r\n\r\n<p>Facebook has said in the past it planned to grow advertising revenue on Instagram and Whatsapp organically, but investors have been anxious to see specific plans.</p>\r\n\r\n<p>The company, which is already the world&#39;s largest social media site, reported it gained 60 million new monthly active users in the third quarter, bringing its global users to 1.55 billion.</p>\r\n\r\n<p>A growth in monthly active users means greater reach for advertisers using Facebook.</p>\r\n\r\n<p>The company said Facebook and Instagram account for one in every five minutes Americans spend online.</p>\r\n\r\n<p>Facebook has been focused on efforts to get more small businesses to advertise on its website.</p>\r\n\r\n<p>Last week the company introduced a new slideshow feature that allows advertisers to produce lower cost videos for their products.</p>\r\n\r\n<p>Facebook was also looking to show strong growth in its mobile users with mobile being the platform of choice in developing countries.</p>\r\n\r\n<p>The number of mobile daily users was up 27% in September to 894 million.</p>\r\n\r\n<h2>Beyond social media</h2>\r\n\r\n<p>Investors had been watching to see the levels of spending as Facebook looks to grow and move beyond basic social media.</p>\r\n\r\n<p>It bought the virtual reality company Oculus Rift for $2bn in 2014.</p>\r\n\r\n<p>Oculus is virtual reality display that individuals wear on their heads. Many media analysts think it could change the gaming industry.</p>\r\n\r\n<p>On a call with investors, Facebook said it expected to release Oculus technology at the end of 2016.</p>\r\n\r\n<p>It will be connected to gear created by Samsung and sold for $99.</p>\r\n\r\n<p>Source :&nbsp;<a href=\"http://www.bbc.com/\">http://www.bbc.com/</a></p>\r\n', '1496131685_5011-2015-11-05.jpg', '', 'cda11up', 'Post', ''),
(13, 4, 'Raja Ampat: The World\'s Most Beautiful Islands', '2017-05-30 08:08:15', '<p>Raja Ampat is the number one tourist spot in Eastern indonesia&#39;s West Papua Province that became the symbol of world famous tour. Raja Ampat is also a conservation area in the world for the cultivation of coral reef habitat of thousands of beautiful fish and many kinds of sea animals are already scarce, all on Raja Ampat. A Sea Ghost mystery stories being typical inland tourist icon that is still very awake, clean and store a million charm, natural beauty make the tourist area of Raja Ampat is where human dreams and visitors to be able to feel the sensation of natural tourism.</p>\r\n\r\n<p>The region has an area of almost 4.6 million acres where the location is right next to the West the bird Heads West Papua. 92% of the territory of raja ampat Islands is sea waters that is land, the rest forming the many islands that is as much as 610 of the island. From 610 kepalauan Islands in the Raja Ampat, consists of 4 large islands such as Waigeo, Misool, Batanta and Salawati Island,, the rest scattered into small islands. From around the island&#39;s 610 umlah, 36 new islands in the Raja Ampat are inhabited land, the rest is still not populated by humans.</p>\r\n', '1496131716_3352-2017-03-07.jpg', '', 'cda11up', 'Post', ''),
(14, 4, 'The Beautiful Island of Bali is like a visit to Heaven on Earth', '2018-03-11 22:40:49', '<p>Bali is an Indonesian island known for its forested volcanic mountains, iconic rice paddies, beaches and coral reefs. The island is home to religious sites such as cliffside Uluwatu Temple. To the south, the beachside city of Kuta has lively bars, while Seminyak, Sanur and Nusa Dua are popular resort towns. The island is also known for its yoga and meditation retreats.</p>\r\n\r\n<p>Bali is a popular tourist destination, which has seen a significant rise in tourists since the 1980s. It is renowned for its highly developed arts, including traditional and modern dance, sculpture, painting, leather, metalworking, and music. The Indonesian International Film Festival is held every year in Bali.</p>\r\n\r\n<p>Bali is part of the Coral Triangle, the area with the highest biodiversity of marine species. In this area alone over 500 reef building coral species can be found. For comparison, this is about 7 times as many as in the entire Caribbean. Most recently, Bali was the host of the 2011 ASEAN Summit, 2013 APEC and Miss World 2013. Bali is the home of the Subak Irrigation System, a UNESCO World Heritage Site.</p>\r\n', '1496131749_46b768ca2db146520f9f2c6e93cee665.jpg', '', 'cda11up', 'Post', ''),
(15, 6, 'Dragon Ball Super Movie 2018:New Saiyan Villain Revealed!', '2018-03-26 10:52:40', '<p>Dragon Ball Super Movie Official TRAILER was released! Goku vs NEW Saiyan. Coming out on December 14, 2018, Worldwide at the same time! The Dragon Ball Super Movie Trailer Is finally here. The movie will feature a New Saiyan (seen in the trailer). The upcoming Dragon Ball Super movie is the 20th movie.</p>\r\n\r\n<p>It has been confirmed that we will see &ldquo;everyone&rsquo;s favorite Saiyans&rdquo; return (presumably includes Vegeta, Gohan, and rest of Z warriors). They also said &ldquo;you can&rsquo;t talk about Saiyans without talking about Frieza&rdquo; (no confirmation if Frieza is part of the cast or of flashbacks.&nbsp;<strong>The movie will be released worldwide on December 14th, 2018 across multiple countries, on the same night! &ndash; John Oppai.</strong></p>\r\n', '', 'https://www.youtube.com/watch?v=i-lCWZR1am0', 'i-lCWZR1am0', 'youtube', ''),
(17, 7, 'Inspira TV : Inspiratif & Positif', '2018-03-31 01:41:41', '<p>INSPIRATV adalah stasiun televisi UHF digital berjaringan nasional dengan semangat &quot;Inspiratif &amp; Positif&quot;. Saat ini siara InspiraTV dapat disaksikan di JABODETABEK- Serang, Bandung Raya, Yogyakarta, Medan, Pekanbaru, Semarang, Surabaya, Banjarmasin dan Makasar, dan melalui satelit FTA NINMEDIA Channel 29 diseluruh Indonesia dan Asia Tenggara yang telah di tonton lebih dari 4 juta pemirsa. Inspiratv juga hadir melalui kanal streaming di www.inspira.tv, Youtube Channel InspiratvID dan melalui aplikasi di Smartphone Anda.</p>\r\n', '1522513915_1519446665_1511660462_inspira.jpg', 'http://stream1.ninmedia.tv/live/nin-inspira.stream_nin/playlist.m3u8', 'cda11up', 'Url', ''),
(19, 8, 'Oprah, Rupert Murdoch, Harvard: Saudi Prince U.S. Tour', '2018-04-07 06:02:23', '<p>He talked about the movie business with Michael Douglas, Morgan Freeman and Dwayne Johnson over dinner at Rupert Murdoch&rsquo;s house. He discussed space travel with Richard Branson in the California desert, and philanthropy with Bill Gates and technology with Jeff Bezos in Seattle. He visited Harvard and MIT, brokered arms deals with President Trump and sat down with Wall Street financiers. He even met with Oprah Winfrey.</p>\r\n\r\n<p>For nearly three weeks, Crown Prince Mohammed bin Salman, the 32-year-old heir to the Saudi throne, has crisscrossed the United States, on an ambitious, choreographed journey through modern American life, while under heavy guard because of his many enemies in the Middle East.</p>\r\n\r\n<p>The prince, who arrived in America with a reputation as an aggressive consolidator of power back home and a zealous interventionist abroad, is seeking to change the perception of Saudi Arabia from an opaque and conservative kingdom, where mosques promote extremist ideology and women are relegated to second-class status, to a modernist desert oasis.</p>\r\n\r\n<p>Prince Mohammed also has sought to attract American investors for industries going well beyond Saudi Arabia&rsquo;s Aramco petroleum giant. He is pressing what he has described as a transformative economic agenda, to wean the kingdom from reliance on oil and diversify its economy through public infrastructure investments and development of an entertainment industry &mdash; including theme parks along the lines of Six Flags and Disney.</p>\r\n\r\n<p>&ldquo;I think it&rsquo;s brilliant and I will tell you why,&rdquo; said Adam Aron, the chief executive of the movie theater chain AMC, who has met with the prince. &ldquo;The crown prince is aware that Saudi Arabia has had a difficult image in the United States, because it&rsquo;s been such a conservative country for so many decades. He wants to transform Saudi society in ways that will be very appealing to Americans.&rdquo;</p>\r\n', '1523081056_merlin_136464831.jpg', '', 'cda11up', 'Post', ''),
(20, 8, 'India to get 110 fighter jets in world\'s biggest defence deal', '2018-04-07 06:04:51', '<p>The Indian Air Force issued the RFI (Request for Information) or initial tender for the billion dollar procurement deal which will be in sync with the government&#39;s Make in India initiative.</p>\r\n\r\n<p>Officials said the jets will be produced jointly by a foreign aircraft maker along with an Indian company under the recently-launched strategic partnership model which aims to bring in high-end defence technology to India.</p>\r\n\r\n<p>Leading military aircraft producers Lockheed Martin, Boeing, Saab and Dassault are among the competitors which are likely to vie for the mega deal.</p>\r\n\r\n<p>The IAF has been pressing for expediting the process to acquire the aircraft citing declining strength of its fighter squadron as some of the ageing jets are being phased out.</p>\r\n\r\n<p>It is the first mega procurement initiative for fighter jets after the government scrapped the process to acquire 126 Medium Multi-Role Combat Aircraft (MMRCA) for the Indian Air Force around five years ago.</p>\r\n\r\n<p>Instead, the NDA government, in September 2016, signed an Euro 7.87 billion (approx Rs 59,000 crore) deal with the French government for purchase of 36 Rafale twin-engine fighter jets.</p>\r\n\r\n<p>The IAF was keen on a follow-on order of 36 additional Rafales. However, the government is yet to take a decision on it.</p>\r\n', '1523081207_fighterjet.jpg', '', 'cda11up', 'Post', ''),
(21, 8, 'Russia is getting closer to banning Telegram', '2018-04-07 06:09:42', '<p>Today, the Russian government filed a lawsuit to limit the messaging app Telegram domestically, the latest move in an escalating battle between the two. Roskomnadzor, the Russian media regulator, claimed in court that Telegram was not in compliance with its legal obligations and characterized the messaging service as an &quot;organizer of information distribution,&quot; according to&nbsp;Reuters. Pavel Chikov, Telegram&#39;s lawyer, has already responded to the suit, saying that it is &quot;groundless,&quot; the&nbsp;BBC&nbsp;reports.</p>\r\n\r\n<p>The conflict between Telegram and the Russian government goes back to last year, when the FSB (the successor to the KGB) demanded that the founder, Pavel Durov,&nbsp;hand over encryption keys to the service. The reasoning was that terrorists had used the apps to plan an attack, and the FSB needed access to it in the name of national security. Durov has&nbsp;steadfastly refused, even as the Russian government has been threatening to ban Telegram&nbsp;if he didn&#39;t cooperate. Now, it seems, the government is&nbsp;ready to make good on that threat.</p>\r\n\r\n<p>Russia has been trying to exert more control over social media and online communications over the years, and legislation passed in 2016 gave them the means to do it. This law requires any messaging service that operates within Russia to provide the government with the ability to decrypt messages, the equivalent of backdoor access. Durov, Telegram&#39;s founder, has long claimed that this is not only unconstitutional, but it&#39;s not feasible from a technical standpoint because of the end-to-end encryption Telegram uses.</p>\r\n\r\n<p>If Russia moves ahead with the ban, then domestic ISPs will have to blacklist domains and IP addresses that Telegram uses. It will be interesting to see what happens, as Facebook recently rejected a demand that it store Russian user data domestically. Russia&#39;s actions with Telegram could make clear how serious the government is about exerting control over social media and online messaging.</p>\r\n', '1523081387_tgram.jpg', '', 'cda11up', 'Post', ''),
(22, 8, 'Developments in Maldives cause of concern: Pentagon', '2018-04-07 06:10:40', '<p>WASHINGTON: Amid allegations of China engaging in massive land grabbing in the Maldives, the Pentagon on Saturday said it was a cause of concern for the US.<br />\r\nAsserting that the US was &quot;committed to a free and open&quot; India-Pacific rules-based order, the Pentagon said anything else would cause the US concern.<br />\r\n<br />\r\n&quot;The US is committed to a free and open Indo-Pacific rules-based order. We have seen concerning developments in Maldives as far as the Chinese influence is concerned,&quot; Joe Felter, Deputy Assistant Secretary of Defense for South and Southeast Asia, told PTI in interview.<br />\r\n<br />\r\n&quot;It&#39;s in India&#39;s backyard. We know it&#39;s of concern to India. So, yes, (the situation in Maldives) is a concern. We will see how it plays out. It emphasises some of our priorities identified in our National Defence Strategy,&quot; the top Pentagon official said.<br />\r\n<br />\r\nHe was responding to a question on the allegations of a Maldivian opposition leader and a former foreign minister, on the Chinese land grabbing activities in the island nation with the potential of developing them into a military outpost.<br />\r\n<br />\r\nFelter said these developments were &quot;a cause of concern&quot; for all states that supported the maintenance of a rules-based order.<br />\r\n<br />\r\n&quot;If you look at similar activities across the region, it gives us some cause for concern. From Djibouti to, Gwadar put to Hambantota port in Sri Lanka, and now potentially the Maldives and then extending further east, it&#39;s of concern,&quot; he said.<br />\r\n<br />\r\nOther countries in the region have expressed similar concern, including India, he noted.<br />\r\n<br />\r\n&quot;We believe the interests of all states - large and small - are best served by maintaining a free and open Indo-Pacific and a rules-based order. Some of China&#39;s activities that we&#39;ve observed give us concern because they do not seem to be consistent with those interests. I suspect India shares these concerns as well,&quot; Felter said.<br />\r\n<br />\r\nDuring a recent visit to the US, Ahmed Naseem, a former foreign minister of Maldives, had alleged that China was meddling in internal affairs of Maldives and had indulged itself in a massive land grabbing endeavour which if left unchecked would pose a major strategic threat to both the US and India.<br />\r\n<br />\r\nChina, he alleged, appeared to be keen on building a base in the Maldives which one day may house warships and submarines.</p>\r\n', '1523081483_63652932.jpg', '', 'cda11up', 'Post', ''),
(23, 8, 'Indonesia opens investigation into Facebook privacy breach', '2018-04-07 06:13:18', '<p>JAKARTA, Indonesia &mdash; The Indonesian government said Friday it&rsquo;s investigating Facebook over the privacy breach of its Indonesian users.</p>\r\n\r\n<p>The Ministry of Communications and Information Technology said in a statement that it had asked the National Police chief to investigate possible violations of Indonesia&rsquo;s privacy law a day after Facebook announced that personal data of more than 1 million Indonesians might have been exposed by political consultant Cambridge Analytica.</p>\r\n\r\n<p>It said Facebook representatives in Indonesia could face up to 12 years in prison and a fine of $871,000 if convicted.</p>\r\n\r\n<p>The ministry summoned the representatives late Thursday to deliver a warning letter.</p>\r\n\r\n<p>Communications Minister Rudiantara told reporters after the meeting that he has asked Facebook to stop its applications that could allow third parties to get users&rsquo; personal information.</p>\r\n\r\n<p>&ldquo;We ask Facebook to provide us their audit results to see how the personal information is used by the Cambridge Analytica,&rdquo; said Rudiantara, who, like many Indonesians, uses a single name.</p>\r\n\r\n<p>Facebook Indonesia head of public policy Ruben Hattari said they will keep cooperating with the Indonesian government.</p>\r\n\r\n<p>&ldquo;Our main goal is to secure privacy data of all Facebook users,&rdquo; Hattari said after the meeting.</p>\r\n\r\n<p>Indonesia is the world&rsquo;s fourth-largest Facebook user with more than 115 million active members, and nearly 97 percent of them are on mobile devices.</p>\r\n', '1523081623_180406-facebook-investigation-feature.jpg', '', 'cda11up', 'Post', ''),
(24, 2, 'Samsung Galaxy S9 Mini appears with big speed specs', '2018-04-07 06:20:00', '<p>The Samsung Galaxy S9 Mini appears to be incoming and despite the name it is shaping up to be a big hit for specs.</p>\r\n\r\n<p>Samsung S9 Plus Review<br />\r\nThe last time Samsung launched a phone of this kind was the&nbsp;Galaxy S5 Mini. We&rsquo;ve not seen a smaller sibling Sammy smartphone since. This could be because people did want smaller, but without the cut in specs that most mini handsets meant. The Galaxy S9 Mini could buck that trend with some impressive specs. And with Apple rumoured to unleash an&nbsp;iPhone SE 2&nbsp;soon, this answer from Samsung makes sense.</p>\r\n\r\n<p>According to a&nbsp;Geekbench listing&nbsp;we can expect the Samsung Galaxy S9 mini to pack in a decent 4GB of RAM, plenty for nearly every need then. This will be running an octa-core Qualcomm Snapdragon 660 CPU meaning an Adreno 512 GPU. So all very speedy, then.</p>\r\n\r\n<p>Few other specs were revealed which does leave the question, is this a mini or just another Samsung smartphone? We&rsquo;ll have to wait and see exactly what the commercial name for this SM-G8750 turns out to be. Since the S9 is an SM-G960, this new handset isn&rsquo;t far removed from that naming class.</p>\r\n\r\n<p>Other specs are not clear but we&rsquo;re hoping for a 5-inch Infinity Display and a decent front and rear camera combo, at least. But, of course, the real appeal will be a more affordable price tag. The last Mini was released three months after the flagship so if it is released, then expect the S9 Mini to appear soon.</p>\r\n', '1523082027_S9YSnCW-1920-80.jpg', '', 'cda11up', 'Post', ''),
(25, 2, 'Australian woman charged with murder after police use evidence from Apple Watch', '2018-04-07 06:23:08', '<p>Australian woman has been charged with the murder of her mother-in-law after police gathered evidence from the victim&#39;s Apple Watch.</p>\r\n\r\n<p>Grandmother Myrna Nilsson, 57, who was born in the Philippines, was found dead in the laundry room of her Adelaide home in September 2016.</p>\r\n\r\n<p>Her daughter-in-law, Caroline Dela Rose Nilsson, was arrested after police analysed the smartwatch data which they say shows she fabricated her story of a violent break-in,&nbsp;ABC News reports.</p>\r\n\r\n<p>Prosecutors say the Apple Watch data &ldquo;is a foundational piece of evidence for demonstrating the falsity of the defendant&rsquo;s account to police&rdquo;.</p>\r\n\r\n<p>The 26-year-old is accused of staging a home invasion, having told police that a group of men had forced their way into the property.</p>\r\n\r\n<p>She maintains&nbsp;that they followed the victim home from her workplace and were arguing with her outside the property for around 20 minutes.</p>\r\n\r\n<p>A neighbour alerted police after the suspect emerged from the property bound and gagged in a deeply distressed state at around 10pm on the day of the murder.</p>\r\n\r\n<p>Ms Nilsson maintains she did not hear the murder as she was tied up in the kitchen with the door closed. However prosecutors say the Apple Watch data contradicts her story and suggests her mother-in-law was ambushed shortly after she arrived home.</p>\r\n\r\n<p>&ldquo;The deceased must have been attacked at around 6:38pm and had certainly died by 6:45pm,&rdquo; prosecutor Carmen Matteo told a bail hearing.</p>\r\n\r\n<p>&ldquo;If that evidence is accepted, it tends to contradict the accused&rsquo;s version of an argument occuring between the deceased and these men outside the laundry [room] for a period of up to 20 minutes.</p>\r\n\r\n<p>&ldquo;Her emergence from the house was well after 10pm and if the Apple iWatch evidence is accepted, that is over three hours after the attack on the deceased.</p>\r\n\r\n<p>&ldquo;That represents time within which to stage the scene &hellip; and represents time to clean up and discard bloodied clothing.&rdquo;</p>\r\n\r\n<p>Prosecutors say data from the Apple Watch, which measures the wearer&rsquo;s heart rate throughout the day, disproves her version of events. &nbsp;</p>\r\n\r\n<p>&ldquo;This defendant did not foresee that the police would be able to discern time of death and other information from that device,&rdquo; added Ms Matteo.</p>\r\n\r\n<p>Ms Nilsson has been denied bail and is scheduled to stand trial in June. Wearable technology and health app data has been increasingly used as evidence in murder trials in the US and Europe.</p>\r\n\r\n<p>The Fitbit data suggests his wife, Connie Dabate, was moving around for an hour after her husband claimed she was murdered by an intruder. He denies the murder.&nbsp;</p>\r\n\r\n<p>&ldquo;It is an electronic footprint that tracks your movements. It is a great tool for investigators to use,&rdquo; said Craig Stedman, the Connecticut district attorney.</p>\r\n\r\n<p>&ldquo;We can also get the information much faster than some other types of evidence such as DNA tests.&rdquo;</p>\r\n\r\n<p>Earlier this year, a Wisconsin judge ruled that step-counting data from a Fitbit could be used in a murder trial, but ruled out data related to sleep-monitoring.</p>\r\n', '1523082197_RUT4rHK8EgtaGoQwQ.jpg', '', 'cda11up', 'Post', ''),
(26, 7, 'Eurostar has released cheap tickets to Disneyland Paris from £38', '2018-04-07 06:26:54', '<p>Getting to the Magic Kingdom just got a whole lot cheaper thanks to Eurostar!</p>\r\n\r\n<p>The train company has just slashed fares to&nbsp;Disneyland Paris&nbsp;with prices from &pound;38 each way, meaning families won&#39;t have to break the bank to go and hang out with Mickey Mouse and his friends.</p>\r\n\r\n<p>Especially if you also snap up a&nbsp;deal on Disneyland tickets&nbsp;to help you get more bang for your buck.</p>\r\n\r\n<p>The cheap tickets are already&nbsp;available to book on the Eurostar website&nbsp;meaning you could bag a bargain just in time for the bank holiday weekends, May half term - or even the summer holidays!</p>\r\n\r\n<p>But that&#39;s not the only good news for parents.</p>\r\n\r\n<p>Eurostar has also launched a special offer for families, with savings of up to 25% off a break including a FREE half board meal plan complete with a quick service breakfast.</p>\r\n\r\n<p>For example, you could get a two night/three day stay or more at Disneyland Hotel, Disney&#39;s Hotel New York, Disney&#39;s Newport Bay Club, Disney&#39;s Sequoia Lodge or Disney&#39;s Davy Crockett Ranch, including the Half-board Meal Plan and up to 25% off Disney Hotel &amp; Park tickets.</p>\r\n\r\n<p>The best part is that the deal is valid for arrivals up until November 6 so you&#39;ve got ample opportunity to snap up a cheap holiday to Disneyland Paris - and these dates include the&nbsp;Marvel Summer of Super Heroes event&nbsp;sure to be a hit with mini Avengers.</p>\r\n\r\n<p>There are plenty of extra perks on offer too including a complimentary FASTPASS for each member of your party so you can make sure you get to enjoy all of your favourite rides, not to mention a complimentary shuttle from the hotel to the parks (excluding Disney&#39;s Davy Crockett Ranch).</p>\r\n', '1523082481_Disneyland.jpg', '', 'cda11up', 'Post', ''),
(27, 7, 'Jeremy Dutcher Aims to Disrupt Anglo Centric Music Narrative', '2018-04-07 08:57:19', '<p>It is said that music is the universal language&nbsp;but Toronto based First Nations tenor and pianist Jeremy Dutcher has created an accessible album in his native Wolastoq, or Maliseet, a language spoken today in Canada by an estimated 600 people. Wolastoqiyuk Lintuwakonaw, out Friday (April 6), is an 11-song fusion of his ancestors&#39; archival recordings and his own classical and pop influences, intended to disrupt the &ldquo;bilingual Anglo-centric Canadian music narrative,&rdquo; he tells Billboard.</p>\r\n\r\n<p>The 27-year-old -- who is a member of the Tobique First Nations in northwestern New Brunswick, and studied music in Halifax, Nova Scotia -- doesn&#39;t believe this music should be &ldquo;collecting dust on a museum shelf,&rdquo; so he took five years to painstakingly put this album together, transcribing Wolastoq songs more than a century-old &mdash; once banned from being performed in public due to the Canadian government&#39;s discriminatory Indian Act from 1876 &mdash; to re-introduce them to the world.</p>\r\n\r\n<p>Dutcher sat down with Billboard over sweetgrass tea at Toronto&#39;s NishDish, a traditional Anishinaabe restaurant, to chat about the album, give us a history lesson &mdash; and teach us some Wolastoq language basics. Be sure to try them on him if you see his show in New York at Joe&#39;s Pub, May 4.</p>\r\n\r\n<p>To start with, there&#39;s about 60 different Aboriginal languages Canada and Cree is the biggest with 83,000 speakers, according to Statistic Canada, 2011.</p>\r\n\r\n<p>Cree is the biggest linguistic group, for sure, followed by Anishinaabemowin, which is the Ojibway [19,000], or what&#39;s spoken around here, and then Inuktitut.</p>\r\n\r\n<p>Do they have commonalities?</p>\r\n\r\n<p>Oh yeah. It&#39;s like the language groups in Europe. Think about the romantic languages like French and Italian, they&#39;re so close together because geographically they came out of the same area. It&#39;s similar here too, I can&#39;t fully understand what they speak here, but you notice certain words, like our word for &ldquo;bear&rdquo; is the same.</p>\r\n\r\n<p>Was it important in your family to learn your native language?</p>\r\n\r\n<p>Definitely. I&#39;m from New Brunswick originally, so that&#39;s on the east coast of Canada. My mother spoke the language growing up, and she understood the importance of passing that on to us,</p>\r\n\r\n<p>If I&#39;m going to be talking to you about an album you made to preserve and expand your language, then I should know how to pronounce Wolastoq.</p>\r\n\r\n<p>Wool-las-took. The language, is Wolastoqey wool-las-two-gway. The name of the river is Wolastoq and the name of my people, &ldquo;The People of the River,&rdquo; is Wolastoqiyik, [pronounced] Willisto-wee-ek, and that&#39;s the first word of the record title. So the name of the record is Wolastoqiyik Lintuwakonaw &mdash; wool-las-two-wi-ig lint-two-wah-gun-ah-wa.</p>\r\n\r\n<p>How does it compare to the English language in terms of consonants and vowels, and how many words you have?</p>\r\n\r\n<p>It came out of a different hemisphere than English did, so even the ways that we think about the world and how we position ourselves within the world are different. It&#39;s hard to explain for somebody that doesn&#39;t speak the language, but it&#39;s just a totally different positionality in how we see the world in the language. That&#39;s why it&#39;s important for us to hang on to that too.</p>\r\n\r\n<p>The elders say that our language comes from the land; it&#39;s intimately tied. You see a tree, but I don&#39;t see a tree; I see a ƏpƏsiyik [pron. oposiyik]. I see the world in a different way based on the way that I speak and the way that I experience things. We have like 20 different words to describe that tree &mdash; in the bark, in certain times of season. So much to say that there&#39;s an intimate relationship between language and land.</p>\r\n\r\n<p>For me, as a young person with access to that language, a lot of young people don&#39;t speak my language in our community, I was very fortunate in that my mother was able to pass on some, and through this record I&#39;ve been able to double down on my efforts in revitalizing our language and I&#39;ve been working with our stories, and telling our stories in the language.</p>\r\n\r\n<p>Your family and the elders must be thrilled.</p>\r\n', '1523091463_JeremyDutcher.jpg', '', 'cda11up', 'Post', ''),
(28, 7, 'The little bus Tayo theme song Indonesian version', '2018-04-07 11:50:08', '<p>Tayo the Little Bus&nbsp;is about exciting adventures that are to happen in the metropolitan city where different vehicles live with harmony with one another. Tayo is just starting to learn his route in this busy city centre and on his journey, he is making many new friends. Full of unique characters that capture children&#39;s imaginations and fun storylines, the series has a lot to offer.</p>\r\n\r\n<p><em>Hai, Tayo, Hai, Tayo<br />\r\nDia bis kecil ramah<br />\r\nMelaju, melambat, Tayo selalu senang<br />\r\nHai, Tayo, Hai, Tayo<br />\r\nDia bis kecil ramah<br />\r\nMelaju, melambat, Tayo selalu senang<br />\r\nJalan Menanjak<br />\r\nJalan Berbelok<br />\r\nDia selalu berani<br />\r\nMeskipun gelap dia tak sendiri<br />\r\nDengan teman, tak perlu rasa takut<br />\r\nHai, Tayo, Hai, Tayo<br />\r\nDia bis kecil ramah<br />\r\nMelaju, melambat, Tayo selalu senang<br />\r\nHai, Tayo, Hai, Tayo<br />\r\nDia bis kecil ramah<br />\r\nDengan teman di sisinya semua senyum ceria<br />\r\nIndahnya hari ini<br />\r\nMari Bergembira</em></p>\r\n', '', 'https://www.youtube.com/watch?v=DPZEPP0xUto', 'DPZEPP0xUto', 'youtube', '');
INSERT INTO `tbl_news` (`nid`, `cat_id`, `news_title`, `news_date`, `news_description`, `news_image`, `video_url`, `video_id`, `content_type`, `size`) VALUES
(29, 6, 'The Questions Congress Needs to Ask Mark Zuckerberg', '2018-04-07 11:54:55', '<p>Mark Zuckerberg is probably wearing out his flashcards as he prepares to be the sole subject of two congressional hearings, where lawmakers will take turns grilling the Facebook CEO about the policies that let an app developer cart away and inappropriately share data on as many as&nbsp;87 million Facebook users. The first is a joint hearing of the Senate Judiciary and Commerce committees on Tuesday. The next day, Zuckerberg will answer questions from members of the House Energy and Commerce Subcommittee.</p>\r\n\r\n<p>Without&nbsp;any specific, wide-reaching legislation&nbsp;on the table but lots of public anger toward Facebook, expect members of Congress to ask difficult and sensational questions designed to put the executive on the defensive. They&rsquo;ll have no shortage of transgressions to focus on. There&rsquo;s the fake news that spread on the platform throughout the 2016 campaign and the ways in which&nbsp;Russian operatives&nbsp;have used Facebook to try to manipulate U.S. voters. Or how Facebook, which is the second-largest online ad company in the world, allowed advertisers&nbsp;to market explicitly to people&rsquo;s bigotries, as their software suggested ad-targeting terms like &ldquo;Jew haters&rdquo; and &ldquo;threesome rape.&rdquo; And then there&rsquo;s the reason Zuckerberg finally relented to calls that he testify, the scandal involving political-data firm Cambridge Analytica, wherein the Facebook data of tens of millions people was harvested&nbsp;off the platform&nbsp;and allegedly used to help Trump&rsquo;s campaign.</p>\r\n\r\n<p>All of this happened on Zuckerberg&rsquo;s watch&mdash;with virtually no federal laws that would have protected Americans&rsquo; privacy and the health of the country&rsquo;s information ecosystem. Depending on what happens at Tuesday&rsquo;s and Wednesday&rsquo;s hearings, Facebook might not stay unregulated for very long. The only major legislative proposal currently drafted and seeking support is the Honest Ads Act, championed by Democratic Sens. Amy Klobuchar and Mark Warner and Republican Sen. John McCain. That bill would require political advertisements on Facebook to list who paid for them, just like political ads on radio, print, and television do, and would levy fines on social media companies that don&rsquo;t follow the rules. On Friday, Facebook executives&nbsp;said in a blog postthat the company does support&nbsp;the Honest Ads Act, although Zuckerberg&nbsp;told Wired&nbsp;last month that he doesn&rsquo;t expect that bill to pass. Considering the public blowback his company is currently facing, that legislation might be the easiest thing for Congress to pull off the shelf to show Americans that Facebook won&rsquo;t pass through this controversy without consequences.</p>\r\n\r\n<p>In broad strokes, most of the concerns members of Congress will likely raise will center on questions of user privacy, election integrity, and the company&rsquo;s indisputable impact on how Americans communicate and get their news. (Some Republicans will probably also raise questions of whether Facebook is in some way biased against conservatives.) Throughout both hearings, lawmakers will likely highlight reporting on how Facebook&rsquo;s internal culture and policies reveal that the company was well aware of how its platform was being misused and yet decided not to take the substantial steps to fix it, all the while continuing to be one of the most valuable companies in the world with control over how billions of people get information and stay connected to their personal and professional communities.</p>\r\n\r\n<p>If the committee members really want to move the ball forward in terms of what we know about Facebook, here are some questions they might consider asking Zuckerberg while he&rsquo;s under oath.</p>\r\n', '1523102193_zuck.jpg', '', 'cda11up', 'Post', ''),
(30, 4, 'Diving in Borneo : the Derawan islands and a blissful life aquatic', '2018-04-07 11:59:27', '<p>The steering wheel spins frantically, the engine graunches and the tiny speedboat slews side-on to the swell, centimetres from a mess of floating timber. Luckily our captain, a Bajo &ldquo;sea gypsy&rdquo; from the fishing people who first settled Borneo&rsquo;s Derawan archipelago, is a master of the marine handbrake turn. He grins and guns the engine; the white sands, tall palms and stilt houses of Derawan island come into focus.</p>\r\n\r\n<p>My teenage son and I have travelled through the coal mine-scarred landscape beyond Berau, a riverside town in Kalimantan on mainland Indonesian Borneo (and reached via two flights from Singapore), to take a boat out to spend a week exploring a few of the archipelago&rsquo;s scores of islands. Only two are officially inhabited, though 30-odd others have names and some are home to scientists and sea-dwelling boat people. By the end of this year the islands will be better connected to the mainland, with the completion of a small airport on Maratua island, which will handle short-haul flights.</p>\r\n\r\n<p>We&rsquo;ll be spending the next couple of days at Derawan Dive Lodge, a cluster of elegant wooden cabanas reached by jetty over limpid waters, where green turtles graze on sea grass and algae. At least 15,000 female turtles return to the archipelago every year, often swimming many thousands of kilometres to lay their eggs on the beaches where they had hatched. Now, so many turtles graze off Derawan island, many of them non-local breeders, that their food sources are becoming scarce.</p>\r\n\r\n<p>The highest tides, around the full moon and the new moon, are the best time to watch the females drag their heavy bodies up the sand and wheeze and grunt through the ovulation process. &ldquo;One laid her eggs under the restaurant a couple of weeks ago,&rdquo; says the lodge&rsquo;s Indonesian manager. We&rsquo;ve missed their hatching, sadly.</p>\r\n', '1523102519_4922.jpg', '', 'cda11up', 'Post', ''),
(36, 2, 'Google deserts desserts: Android 10 is the official name for Android Q', '2020-03-14 15:57:34', '<p>Google has officially named the next version of Android, which is due to be released this fall: Android 10. Breaking the 10-year history of naming releases after desserts, the company is bailing on providing a codename beginning with a subsequent letter of the alphabet (in this case, Q), which is the way we&rsquo;ve been referring to Android up to now. This year is Android 10, next year will be Android 11, and so on.</p>\r\n\r\n<p>After a quarter of quiet, the quintessence of Android&rsquo;s brand has quickly changed without quarrel, resolving a quandary and quitting the quixotic quest to pull a Q dessert out of the quiver. Google won&rsquo;t quaver on the decision to move away from desserts, which answers a quadrillion querulous questions about the names. Google has decided it is a quaint tradition that needed to be quite quashed &mdash; or at least quelled. Instead, the codename will be quarantined inside Google, so I have qualms and feel queasy about the quantity of quips that will queue up quoting the Android source code in an attempt to quibble that the dessert names still qualify as real. It all seems like a quagmire, but at least qualitatively, the new naming scheme is less quirky.</p>\r\n\r\n<p>Alongside the new name is an updated logo for Android, one that Aude Gandon, global brand director for Android, says has a &ldquo;more modern&rdquo; wordmark. Importantly, it will always include the little green robot. &ldquo;The robot is what makes Android special. It makes it human, fun, and approachable,&rdquo; Gandon says.</p>\r\n', '1584201501_Android-10-akan-menjadi-nama-resmi-Android-Q.jpg', '', 'cda11up', 'Post', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_news_gallery`
--

CREATE TABLE `tbl_news_gallery` (
  `id` int(11) NOT NULL,
  `nid` int(11) NOT NULL,
  `image_name` varchar(255) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_news_gallery`
--

INSERT INTO `tbl_news_gallery` (`id`, `nid`, `image_name`) VALUES
(7, 36, '1584201501_In-lineImage_1500x850.max-1000x1000-1.png'),
(8, 36, '1584201501_android_10_logo_1.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_purchase_code`
--

CREATE TABLE `tbl_purchase_code` (
  `id` int(11) NOT NULL,
  `item_purchase_code` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_settings`
--

CREATE TABLE `tbl_settings` (
  `id` int(11) NOT NULL,
  `app_fcm_key` text NOT NULL,
  `api_key` varchar(255) NOT NULL,
  `package_name` varchar(255) NOT NULL DEFAULT 'com.app.androidnewsapp',
  `onesignal_app_id` varchar(500) NOT NULL DEFAULT '0',
  `onesignal_rest_api_key` varchar(500) NOT NULL DEFAULT '0',
  `comment_approval` varchar(45) NOT NULL DEFAULT 'no',
  `providers` varchar(45) NOT NULL DEFAULT 'onesignal',
  `protocol_type` varchar(10) NOT NULL DEFAULT 'http://',
  `privacy_policy` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_settings`
--

INSERT INTO `tbl_settings` (`id`, `app_fcm_key`, `api_key`, `package_name`, `onesignal_app_id`, `onesignal_rest_api_key`, `comment_approval`, `providers`, `protocol_type`, `privacy_policy`) VALUES
(1, '0', 'cda11v2OkqSI1rhQm37PBXKnpisMtlaDzoc4w0U6uNATgZRbJG', 'com.app.androidnewsapp', '0', '0', 'no', 'onesignal', 'http://', '<p>This privacy policy includes all the details about the data collected in Android News App and how it&rsquo;s used.</p>\r\n\r\n<p>As a user we also do not like to give personal informations and we don&rsquo;t want to see our informations collected without knowing what will going to happen to those datas. Android News App has been alive with the support and trust of it&rsquo;s users. We want to keep the trust; you can find all the details about the data usage below.</p>\r\n\r\n<p>Android News App does collect anonymous usage data. This data does not include your original device identification numbers, your real personality or your personal data if it&rsquo;s not directly given by you in an open form.</p>\r\n\r\n<p>Android News App can not access to your real information and your purchases or any other action may not be restored without associating purchases with some information. This is why it is recommended to fill the registration form in the application. That form contains personal information which helps us contact the user easily, help quickly and solve possible licensing problems.</p>\r\n\r\n<p>Usage / interactions in the application are used to determine what stations is being listed at most and which functions attracts the most attention so we can improve those sections. This information also allows us to be able to serve better features like listing most popular stations according to a specific region.</p>\r\n\r\n<p>These datas may be used to serve additional services to 3rd parties like station statistics. NONE of these services will include sensitive information/personally identifying data if not permitted by you.</p>\r\n\r\n<p>In some cases Android News App may communicate directly with a 3rd party server to obtain latest data for display within the app (such as rss feeds, artist/song images and informations) . When this happens &ndash; we don&rsquo;t transmit any data about you or your usage to these 3rd parties except where explicitly stated. Please check these 3rd parties (where applicable) for their additional privacy policies.</p>\r\n\r\n<p><strong>Advertising Banner Privacy Policy</strong></p>\r\n\r\n<p>Android News App may display advertisements on various places in the application. This system may use and transmit basic regional/language information about you to the advertising banner system in order to provide you with relevant ads. In some cases, we may have agreements with sponsors and we may hide advertisements in that situation. Eventhough the advertisement may get hidden in that situation, we may provide similar informations to sponsors or 3rd parties.</p>\r\n\r\n<p><strong>3rd Party Content Privacy Policy</strong></p>\r\n\r\n<p>Android News App may display live web pages or images from 3rd party sources and in these cases you should read the privacy policies displayed by these websites. We use Google Image Search for some of the images related to now playing info.</p>\r\n\r\n<p><strong>Contact us</strong></p>\r\n\r\n<p>If you have any questions regarding privacy while using the Application, or have questions about our practices, please contact us via email at developer.solodroid@gmail.com</p>\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE `tbl_users` (
  `id` int(11) NOT NULL,
  `user_type` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `confirm_code` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT '1',
  `imageName` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_category`
--
ALTER TABLE `tbl_category`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `tbl_comments`
--
ALTER TABLE `tbl_comments`
  ADD PRIMARY KEY (`comment_id`);

--
-- Indexes for table `tbl_fcm_template`
--
ALTER TABLE `tbl_fcm_template`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_fcm_token`
--
ALTER TABLE `tbl_fcm_token`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_license`
--
ALTER TABLE `tbl_license`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_news`
--
ALTER TABLE `tbl_news`
  ADD PRIMARY KEY (`nid`);

--
-- Indexes for table `tbl_news_gallery`
--
ALTER TABLE `tbl_news_gallery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_purchase_code`
--
ALTER TABLE `tbl_purchase_code`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_settings`
--
ALTER TABLE `tbl_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_category`
--
ALTER TABLE `tbl_category`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbl_comments`
--
ALTER TABLE `tbl_comments`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_fcm_template`
--
ALTER TABLE `tbl_fcm_template`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_fcm_token`
--
ALTER TABLE `tbl_fcm_token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_license`
--
ALTER TABLE `tbl_license`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_news`
--
ALTER TABLE `tbl_news`
  MODIFY `nid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `tbl_news_gallery`
--
ALTER TABLE `tbl_news_gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbl_purchase_code`
--
ALTER TABLE `tbl_purchase_code`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_settings`
--
ALTER TABLE `tbl_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
