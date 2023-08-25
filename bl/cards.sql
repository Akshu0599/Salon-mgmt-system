

CREATE TABLE `cards` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `website` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `facebook` varchar(255) NOT NULL,
  `gplus` varchar(255) NOT NULL,
  `twitter` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cards`
--

INSERT INTO `cards` (`id`, `name`, `address`, `description`, `website`, `image`, `facebook`, `gplus`, `twitter`) VALUES
(1, 'Laeeq Khan', 'Delhi, India', 'Web Developer, Blogger', 'http://phpzag.com', 'http://2.gravatar.com/avatar/b48bdfd003e219f94ac2079f9a96347f', 'https://www.facebook.com/Phpzag-203097989797749/', 'https://plus.google.com/112450781644946967938/posts', 'https://twitter.com/phpzag');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cards`
--
ALTER TABLE `cards`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cards`
--
ALTER TABLE `cards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
