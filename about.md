---
title: About
subtitle: The humans behind this project
team:
  - name: Khaled Hussain
    img: ../assets/img/about/IMG-2705.JPG
    desc: Two excellent rescue hounds who bring much joy to our family.
    url: https://www.aspca.org/adopt-pet/adoptable-dogs-your-local-shelter
    website: https://www.aspca.org/adopt-pet/adoptable-dogs-your-local-shelter
    github: https://github.com/cenuno
    twitter: https://twitter.com/cenuno_
  - name: Rachael Nicely
    img: ../assets/img/about/avatar-icon.png
    desc: Rachael is currently completing her M.S. in Program Evaluation and Data Analytics at Arizona State University.
    url: https://www.linkedin.com/in/rachael-nicely
    website: https://www.linkedin.com/in/rachael-nicely
    github: https://github.com/RachNicely
    twitter: 
  - name: Nick Rea
    img: ../assets/img/about/romi_and_phoebe.jpg
    desc: Two excellent rescue hounds who bring much joy to our family.
    url: https://www.aspca.org/adopt-pet/adoptable-dogs-your-local-shelter
    website: https://www.aspca.org/adopt-pet/adoptable-dogs-your-local-shelter
    github: https://github.com/cenuno
    twitter: https://twitter.com/cenuno_
  - name: Asia Woods
    img: ../assets/img/about/A_Woods_Headshot.JPG
    desc: Asia Woods is completing a Master of Science degree in Program Evaluation and Data Analytics. Her anticipated graduation is December of 2021. 
    url: 
    website: 
    github: https://github.com/aawoods97
    twitter: 
---

## Meet the team

These people worked together to create this website.

{% include list-circles.html items=page.team %}

## Website design source

The Jekyll website design was adapted from Niklas Buschmann's [contrast theme](https://github.com/niklasbuschmann/contrast).

## GitHub Repo

You can find the source code that powers this website [on this GitHub repo](https://github.com/R-Class/cpp-528-template).

<!--- CSS for Circles --->

<style>

/* now starting CSS for circles down below */
.list-circles {
  text-align: center;

}

.list-circles-item {
  display: inline-block;
  width: 240px;
  vertical-align: top;
  margin: 0;
  padding: 20px;
}

/* make the background a bit brighter than the current dark gray (#282828) */
.list-circles-item:hover {
  background: #5e5e5e;
}

.list-circles-item .item-img {
  max-width: 200px;
  height: 200px;
  -webkit-border-radius: 50%;
  -moz-border-radius: 50%;
  border-radius: 50%;
  border: 1px solid #777;
}

.list-circles-item .item-desc {
  font-size: 16px;
}

.list-circles-item .item-links {
  margin-top: 5px;
}

.list-circles-item .item-link {
  margin:0 3px;
  color: #FFFFFF;
  text-decoration: none !important;
}

.list-circles-item .item-link:hover {
  color: #000000;
}

</style>
