function makeList(camping) {
  $('#camping_list').prepend('<div class="col-md-4 ftco-animate" id="camp_2"></div>');
  $('#camp_2').prepend('<div class="project-wrap" id="camp_3"></div>');
  $('#camp_3').prepend(
	 `<a href="#" class="img" style="background-image: url(${camping.firstImageUrl });">` +
	 '<span class="price">$550/person</span>' +
	 '</a>'
	);
  $('#camp_3').append('<div class="text p-4" id="camp_4"></div>');
  $('#camp_4').append(
	 '<span class="days">8 Days Tour</span>' +
	 `<h3><a href="./TempCampInfo?contentId=${camping.contentId }">${camping.facltNm }</a></h3>` +
	 `<p class="location"><span class="fa fa-map-marker"></span> ${camping.addr1 }</p>`
    );
}

/*
 
		<div class="col-md-4 ftco-animate">
		  <div class="project-wrap">
		     <a href="#" class="img" style="background-image: url(${list.firstImageUrl });">
		        <span class="price">$550/person</span>
		    </a>
		    <div class="text p-4">
		        <span class="days">8 Days Tour</span>
		        <h3><a href="./TempCampInfo?contentId=${list.contentId }">${list.facltNm }</a></h3>
		        <p class="location"><span class="fa fa-map-marker"></span> ${list.addr1 }</p>
		        <ul>
		           <li><span class="flaticon-shower"></span>2</li>
		           <li><span class="flaticon-king-size"></span>3</li>
		           <li><span class="flaticon-sun-umbrella"></span>Near Beach</li>
		       </ul>
		   	</div>
		  </div>
		</div>
*/