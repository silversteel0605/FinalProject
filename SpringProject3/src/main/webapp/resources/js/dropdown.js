$('nav .dropdown').hover(function(){
	var $this = $(this);
	// 	 timer;
	// clearTimeout(timer);
	$this.addClass('show');
	$this.find('> a').attr('aria-expanded', true);
	// $this.find('.dropdown-menu').addClass('animated-fast fadeInUp show');
	$this.find('.dropdown-menu').addClass('show');
}, function(){
	var $this = $(this);
		// timer;
	// timer = setTimeout(function(){
		$this.removeClass('show');
		$this.find('> a').attr('aria-expanded', false);
		// $this.find('.dropdown-menu').removeClass('animated-fast fadeInUp show');
		$this.find('.dropdown-menu').removeClass('show');
	// }, 100);
});