<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" doctype-system="about:legacy-compat" encoding="utf-8" indent="yes" />

	<xsl:template match="/cv">
        <html lang="en">
            <head>
                <meta charset="utf-8" />
                <meta name="keywords" content="{people/person[@self='true']/name} personal page homepage resume bio" />
                <meta name="description" content="{people/person[@self='true']/name} personal page" />
                <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
                <title><xsl:value-of select="people/person[@self='true']/name" /></title>
                <!--<link rel="shortcut icon" href="favicon.ico" />-->
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha256-L/W5Wfqfa0sdBNIKN9cG6QA5F2qx4qICmU2VgLruv9Y=" crossorigin="anonymous" />
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha256-eZrrJcwDc/3uDhsdt61sL2oOBY362qM3lon1gyExkL0=" crossorigin="anonymous" />
                <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.1/umd/popper.js" integrity="sha256-/MqPdltDqe7iSoqjNkMb7+w1uk5FJdOpIS7YErWktBQ=" crossorigin="anonymous"></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha256-WqU1JavFxSAMcLP2WIOI+GB2zWmShMI82mTpLDcqFUg=" crossorigin="anonymous"></script>
                <style type="text/css"><![CDATA[
                ul {
                    margin: 0;
                }
                @media screen and (max-width: 600px) {
                    ul.multicolumn {
                        columns: 1;
                    }
                }
                @media screen and (max-width: 800px) {
                    ul.multicolumn {
                        columns: 2;
                    }
                }
                @media screen and (min-width: 800px) {
                    ul.multicolumn {
                        columns: 3;
                    }
                    #main {
                        dispay: flex;
                    }
                    #sidebar {
                        width: 250px;
                        /*width: 30%;*/
                        position: fixed;
                        top: 0;
                        left: 0;
                        height: 100vh;
                        z-index: 999;
                        /*background: #eee;*/
                        /*color: #fff;*/
                        transition: all 0.3s;
                    }
                    #content {
                        width: calc(100% - 80px - 250px);
                        min-height: 100vh;
                        transition: all 0.3s;
                        position: absolute;
                        top: 0;
                        right: 20px;
                    }
                }
                #timeline-wrap {
                    min-height: 50px;
                    opacity: 0;
                    transition: opacity 0.5s ease-in-out;
                }
                #timeline {
                    display: inline-block;
                    position: relative;
                    bottom: 0;
                    width: 100%;
                    border-top: 2px solid black;
                    margin-top: 22px;
                }
                #timeline .tracks {
                    position: absolute;
                    left: 10%;
                    right: 10%;
                    bottom: 0;
                    margin-bottom: 12px;
                    height: 45px;
                }
                #timeline .track {
                    position: relative;
                    height: 10px;
                    margin-top: 4px;
                    width: 100%;
                }
                #timeline .range {
                    position: absolute;
                    height: 10px;
                    border: 1px solid rgba(0,0,0,0.2);
                }
                #timeline .range.hover {
                    z-index: 100;
                }
                #timeline .range-red, #timeline .range-green, #timeline .range-blue {
                    background-color: rgba(222,222,222,0.6);
                }
                #timeline .range-red.hover {
                    background-color: rgba(255,0,0,0.6);
                }
                #timeline .range-green.hover {
                    background-color: rgba(0,255,0,0.6);
                }
                #timeline .range-blue.hover {
                    background-color: rgba(100,100,255,0.6);
                }
                #timeline .point {
                }
                #timeline .point:after {
                    content: "";
                    position: absolute;
                    display: inline-block;
                    width: 10px;
                    height: 10px;
                    border-radius: 50%;
                    left: -5px;
                    top: -6px;
                    background-color: black;
                }
                #timeline .point-label {
                    position: relative;
                    left: -50%;
                    margin-top: 10%;
                    font-size: 80%;
                }
                #content .section {
                    padding-top: 1em;
                    margin-bottom: 8em;
                }
                #content .section > .title {
                    border-top: 1px solid black;
                    border-bottom: 1px solid black;
                    text-align: center;
                    margin-top: 2em;
                    margin-bottom: 2em;
                }
                #content .section .item {
                    margin-left: 45px;
                    margin-bottom: 2em;
                    font-size: 80%;
                }
                #content .section .item > .title {
                    font-weight: bolder;
                }
                #content .section .item > .fa {
                    position: absolute;
                    left: 34px;
                }
                #content {
                    background-color: rgba(255,255,255,0.85);
                    padding: 30px;
                    padding-bottom: 90px;
                }
                #content.searching .section {
                    padding-top: 0;
                    margin-bottom: 0;
                }
                #content.searching .section > .title {
                    display: none;
                }
                #searchInfo {
                    text-align: center;
                    font-size: 120%;
                    margin-bottom: 3em;
                }
                #content:not(.searching) #searchInfo {
                    display: none;
                }
                a.tag {
                    background-color: #eee !important;
                    color: #666 !important;
                }
                .close {
                    line-height: 0.6 !important;
                    margin-left: 0.3rem;
                    font-size: 1.2rem;
                }
                @media print {
                    .collapse {
                        display: block !important;
                        height: auto !important;
                    }
                    [data-toggle="collapse"] {
                        display: none;
                    }
                    #projects {
                        display: none;
                    }
                    #timeline-wrap {
                        display: none;
                    }
                }
                ]]></style>
            </head>
            <body>
                <div id="timeline-wrap" class="fixed-bottom w-100 bg-white align-items-center justify-content-center text-center">
                    <div id="timeline">
                        <xsl:variable name="my" select="2004" />
                        <xsl:variable name="My" select="2020" />
                        <div class="point" style="position: absolute; left: 10%;"><div class="point-label">2004</div></div>
                        <div class="point" style="position: absolute; left: 30%;"><div class="point-label">2008</div></div>
                        <div class="point" style="position: absolute; left: 50%;"><div class="point-label">2012</div></div>
                        <div class="point" style="position: absolute; left: 70%;"><div class="point-label">2016</div></div>
                        <div class="point" style="position: absolute; left: 90%;"><div class="point-label">2020</div></div>
                        <div id="tracks" class="tracks bg-white">
                            <xsl:if test="false">
                            <div id="track1" class="track">
                                <div class="range range-blue" style="left: 60%; width: 15%;"></div>
                            </div>
                            <div id="track2" class="track">
                                <div class="range range-blue" style="left: 0%; width: 12%;"></div>
                                <div class="range range-blue" style="left: 16%; width: 16%;"></div>
                                <div class="range range-blue" style="left: 40%; width: 20%;"></div>
                                <div class="range range-blue" style="left: 70%; width: 30%;"></div>
                            </div>
                            <div id="track3" class="track">
                                <div class="range range-green" style="left: 20%; width: 60%;"></div>
                            </div>
                            </xsl:if>
                        </div>
                        <script>
                            <![CDATA[
                            Date.prototype.isLeapYear = function() {
                                var year = this.getFullYear();
                                if((year & 3) != 0) return false;
                                return ((year % 100) != 0 || (year % 400) == 0);
                            };

                            function Y(s) {
                                var d = s != '' ? new Date(s) : new Date()
                                var d0 = new Date(d.getFullYear(), 0, 1)
                                var diff = d - d0
                                var days = Math.floor(diff / (1000 * 60 * 60 * 24))
                                return d.getFullYear() + days / (d.isLeapYear() ? 366 : 365)
                            }
                            ]]>
                            let dmin = Y('<xsl:value-of select="$my" />-01-01')
                            let dmax = Y('<xsl:value-of select="$My" />-01-01')
                            let d = [
                            <xsl:for-each select="education/item/dates">
                                {t: 'green', s: Y('<xsl:value-of select="start" />'), e: Y('<xsl:value-of select="end" />'), k: '<xsl:value-of select="start" />-<xsl:value-of select="end" />'},
                            </xsl:for-each>
                            <xsl:for-each select="work-experience/item/dates">
                                {t: 'blue', s: Y('<xsl:value-of select="start" />'), e: Y('<xsl:value-of select="end" />'), k: '<xsl:value-of select="start" />-<xsl:value-of select="end" />'},
                            </xsl:for-each>
                            <xsl:for-each select="education/item/projects/item/dates | work-experience/item/projects/item/dates">
                                {t: 'red', s: Y('<xsl:value-of select="start" />'), e: Y('<xsl:value-of select="end" />'), k: '<xsl:value-of select="start" />-<xsl:value-of select="end" />'},
                            </xsl:for-each>
                            <![CDATA[
                            ]
                            let btm = {red: 4, blue: 16, green: 28}
                            for(var r of d) {
                                var s = 100 * (r.s - dmin) / (dmax - dmin)
                                var e = 100 * (r.e - dmin) / (dmax - dmin)
                            $('#tracks').append(`<div id="range-${r.k}" class="range range-${r.t}" style="left: ${s}%; width: ${e-s}%; bottom: ${btm[r.t]}px;"></div>`)
                            }
                            ]]>
                        </script>
                    </div>
                </div>

                <div id="main" class="w-100">
                    <div id="sidebar" class="d-block align-items-center justify-content-center text-center">
                        <div class="d-block d-print-none w-100 px-5 py-3 profile-picture position-relative">
                            <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 512 512" style="enable-background:new 0 0 512 512;" xml:space="preserve">
                                <path d="M256,0C114.837,0,0,114.837,0,256s114.837,256,256,256c2.581,0,5.099-0.32,7.68-0.384l0.896,0.171c0.704,0.128,1.387,0.213,2.091,0.213c0.981,0,1.984-0.128,2.923-0.405l1.195-0.341C405.056,503.509,512,392.171,512,256C512,114.837,397.163,0,256,0z M408.149,434.325c-1.003-3.264-3.264-6.016-6.549-7.104l-56.149-18.688c-19.605-8.171-28.736-39.552-30.869-52.139c14.528-13.504,27.947-33.621,27.947-51.797c0-6.187,1.749-8.555,1.408-8.619c3.328-0.832,6.037-3.2,7.317-6.379c1.045-2.624,10.24-26.069,10.24-41.877c0-0.875-0.107-1.749-0.32-2.581c-1.344-5.355-4.48-10.752-9.173-14.123v-49.664c0-30.699-9.344-43.563-19.243-51.008c-2.219-15.275-18.581-44.992-76.757-44.992c-59.477,0-96,55.915-96,96v49.664c-4.693,3.371-7.829,8.768-9.173,14.123c-0.213,0.853-0.32,1.728-0.32,2.581c0,15.808,9.195,39.253,10.24,41.877c1.28,3.179,2.965,5.205,6.293,6.037c0.683,0.405,2.432,2.795,2.432,8.96c0,18.176,13.419,38.293,27.947,51.797c-2.112,12.565-11.157,43.925-30.144,51.861l-56.896,18.965c-3.264,1.088-5.611,3.776-6.635,7.04C53.376,391.189,21.291,327.317,21.291,256c0-129.387,105.28-234.667,234.667-234.667S490.624,126.613,490.624,256C490.667,327.339,458.56,391.253,408.149,434.325z"/>
                            </svg>
                            <div id="particles-js" style="position: absolute; left: 0; top: 0; right: 0; bottom: 0;"></div>
                        </div>
                        <h3><xsl:value-of select="people/person[@self='true']/name" /></h3>
                        <hr/>

                        <div class="d-print-none">
                        <a href="{people/person[@self='true']/linkedin}" class="contact-link" title="LinkedIn"><i class="fa fa-fw fa-lg fa-linkedin"></i></a>
                        <a href="{people/person[@self='true']/github}" class="contact-link" title="GitHub"><i class="fa fa-fw fa-lg fa-github"></i></a>
                        <a href="mailto:{people/person[@self='true']/contact/email[@type='personal']}" class="contact-link" title="E-Mail"><i class="fa fa-fw fa-lg fa-envelope"></i></a>
                        <a href="tel:{people/person[@self='true']/contact/phone[@type='mobile']}" class="contact-link" title="Mobile phone"><i class="fa fa-fw fa-lg fa-mobile-phone"></i></a>
                        <span id="icon-info-text" class="px-2 d-block text-primary" style="white-space: nowrap; font-size: 70%;"></span>
                        <script><![CDATA[
                            function contactTooltip(what) {
                                $('#icon-info-text').html(what)
                            }
                            $('a.contact-link')
                                .mouseover(function() {contactTooltip(this.title)})
                                .mouseout(function() {contactTooltip('&nbsp;')})
                            contactTooltip('&nbsp;')
                        ]]></script>
                        </div>

                        <nav id="cv-sections" class="d-print-none">
                            <ul class="list-unstyled">
                                <li class="cv-section m-3">
                                    <a href="#education" class="nav-link" data-tag="education"><i class="fa fa-graduation-cap fa-2x" /> Education</a>
                                </li>
                                <li class="cv-section m-3">
                                    <a href="#research" class="nav-link" data-tag="research"><i class="fa fa-book fa-2x" /> Research</a>
                                </li>
                                <li class="cv-section m-3">
                                    <a href="#work" class="nav-link" data-tag="work"><i class="fa fa-cogs fa-2x" /> Work</a>
                                </li>
                                <li class="cv-section m-3">
                                    <a href="#projects" class="nav-link" data-tag="projects"><i class="fa fa-code-fork fa-2x" /> Projects</a>
                                </li>
                            </ul>
                        </nav>
                    </div>

                    <div id="content" class="">
                        <div id="searchInfo" class="panel panel-warning">
                            Showing items matching
                            <span class="badge badge-pill badge-secondary">
                                <span id="searchTerm"></span>
                                <a href="#" class="close">
                                    <span aria-hidden="true">&#215;</span>
                                </a>
                            </span>
                        </div>

                        <div id="education" class="section">
                            <h3 class="title">Education</h3>
                            <xsl:for-each select="education/item">
                                <xsl:sort select="dates/start" order="descending" />
                                <div id="item-edu-{position()}" class="item" data-time-range="{dates/start}-{dates/end}">
                                    <i class="fa fa-graduation-cap fa-2x"></i>

                                    <h5 class="title">
                                        <xsl:value-of select="type"/>
                                        in <xsl:value-of select="faculty"/>
                                        <xsl:if test="topic">
                                            &#183; <xsl:value-of select="topic" />
                                        </xsl:if>
                                    </h5>

                                    <xsl:apply-templates select="dates" />

                                    <div>
                                        <i class="fa fa-university"></i><xsl:text> </xsl:text><xsl:value-of select="department" /> at <xsl:value-of select="institution" />
                                    </div>

                                    <xsl:if test="grade or gpa">
                                        <div>
                                            <xsl:if test="grade">Grade: <xsl:value-of select="grade" /></xsl:if>
                                            <xsl:if test="grade and gpa"> &#183; </xsl:if>
                                            <xsl:if test="gpa">GPA: <xsl:value-of select="gpa" /></xsl:if>
                                        </div>
                                    </xsl:if>

                                    <div>
                                        Thesis: <em><xsl:value-of select="thesis/title" /></em>
                                    </div>

                                    <xsl:apply-templates select="tags" />

                                    <xsl:if test="research-projects or summer-schools or teaching-experience or projects">
                                        <div id="item-edu-{position()}-collapse" class="collapse">
                                            <xsl:if test="research-projects">
                                                <div>
                                                    Participation to research projects:
                                                    <ul>
                                                        <xsl:for-each select="research-projects/item">
                                                            <li>
                                                                <em><xsl:value-of select="name" /></em>
                                                                (<xsl:value-of select="type" />)
                                                                <xsl:if test="url">
                                                                    <a href="{url}"><i class="fa fa-external-link"></i></a>
                                                                </xsl:if>
                                                            </li>
                                                        </xsl:for-each>
                                                    </ul>
                                                </div>
                                            </xsl:if>
                                            <xsl:if test="summer-schools">
                                                <div>
                                                    Attendance to summer schools:
                                                    <ul>
                                                        <xsl:for-each select="summer-schools/item">
                                                            <li>
                                                                <em>
                                                                    <xsl:value-of select="name" />
                                                                    <xsl:text> </xsl:text>
                                                                    <xsl:value-of select="year" />
                                                                </em>:
                                                                <xsl:value-of select="full-name" />
                                                                (<xsl:value-of select="location" />)
                                                                <xsl:if test="url">
                                                                    <a href="{url}"><i class="fa fa-external-link"></i></a>
                                                                </xsl:if>
                                                                <xsl:apply-templates select="tags" />
                                                            </li>
                                                        </xsl:for-each>
                                                    </ul>
                                                </div>
                                            </xsl:if>
                                            <xsl:if test="teaching-experience">
                                                <div>
                                                    Teaching experience:
                                                    <ul>
                                                        <xsl:for-each select="teaching-experience/item">
                                                            <li>
                                                                <xsl:value-of select="type" />
                                                                for <em><xsl:value-of select="class" /></em>
                                                                (<xsl:value-of select="department" />
                                                                at <xsl:value-of select="institution" />,
                                                                <xsl:value-of select="year" />)
                                                                <xsl:apply-templates select="tags" />
                                                            </li>
                                                        </xsl:for-each>
                                                    </ul>
                                                </div>
                                            </xsl:if>
                                            <xsl:if test="projects">
                                                <div>
                                                    Projects:
                                                    <ul>
                                                        <xsl:for-each select="projects/item">
                                                            <xsl:sort select="dates/start" order="descending" />
                                                            <li>
                                                                <em><xsl:value-of select="name" /></em>:
                                                                <xsl:value-of select="description" /><br/>

                                                                <xsl:apply-templates select="tags" />
                                                            </li>
                                                        </xsl:for-each>
                                                    </ul>
                                                </div>
                                            </xsl:if>
                                        </div>
                                        <div>
                                            <a href="#item-edu-{position()}-collapse" class="collapsed" data-toggle="collapse" aria-expanded="false" aria-controls="item-edu-{position()}-collapse">Show more</a>
                                        </div>
                                    </xsl:if>
                                </div>
                            </xsl:for-each>
                            <div id="item-awards" class="item">
                                <i class="fa fa-trophy fa-2x"></i>
                                <h5 class="title">Awards:</h5>
                                <ul>
                                <xsl:for-each select="education/award">
                                    <li><xsl:value-of select="." /></li>
                                </xsl:for-each>
                                </ul>
                            </div>
                        </div>

                        <div id="research" class="section">
                            <h3 class="title">Research</h3>
                            <xsl:if test="research/interests">
                                <div id="item-research-interests" class="item">
                                    <i class="fa fa-lightbulb-o fa-2x"></i>
                                    Research interests:
                                    <ul class="multicolumn">
                                        <xsl:for-each select="research/interests/item">
                                            <li><xsl:value-of select="." /></li>
                                        </xsl:for-each>
                                    </ul>
                                </div>
                            </xsl:if>
                            <xsl:if test="research/publications">
                                <div id="item-research-publications" class="item">
                                    <i class="fa fa-book fa-2x"></i>
                                    Publications
                                    <ul>
                                        <li>
                                            Journals:
                                            <ul>
                                                <xsl:for-each select="research/publications/item">
                                                    <xsl:sort select="year" order="descending" />
                                                    <xsl:if test="@type='journal'">
                                                        <li>
                                                            <em><xsl:value-of select="title" /></em>,
                                                            <xsl:for-each select="author">
                                                                <xsl:if test="position()!=1">, </xsl:if>
                                                                <xsl:value-of select="." />
                                                            </xsl:for-each>
                                                            <xsl:if test="et-al">, et al.</xsl:if>
                                                            (<xsl:value-of select="journal" /><xsl:text> </xsl:text><xsl:value-of select="year" />)
                                                        </li>
                                                    </xsl:if>
                                                </xsl:for-each>
                                            </ul>
                                        </li>
                                        <li>
                                            Conferences:
                                            <ul>
                                                <xsl:for-each select="research/publications/item">
                                                    <xsl:sort select="year" order="descending" />
                                                    <xsl:if test="@type='conference'">
                                                        <li>
                                                            <em><xsl:value-of select="title" /></em>,
                                                            <xsl:for-each select="author">
                                                                <xsl:if test="position()!=1">, </xsl:if>
                                                                <xsl:value-of select="." />
                                                            </xsl:for-each>
                                                            <xsl:if test="et-al">, et al.</xsl:if>
                                                            (<xsl:value-of select="conference" /><xsl:text> </xsl:text><xsl:value-of select="year" />)
                                                        </li>
                                                    </xsl:if>
                                                </xsl:for-each>
                                            </ul>
                                        </li>
                                    </ul>
                                </div>
                            </xsl:if>
                        </div>

                        <div id="work" class="section">
                            <h3 class="title">Work Experience</h3>
                            <xsl:for-each select="work-experience/item">
                                <xsl:sort select="dates/start" order="descending" />
                                <div id="item-work-{position()}" class="item" data-time-range="{dates/start}-{dates/end}">
                                    <i class="fa fa-cogs fa-2x"></i>

                                    <h5 class="title"><xsl:value-of select="title"/> &#183; <xsl:value-of select="company" /></h5>

                                    <xsl:apply-templates select="dates" />

                                    <xsl:if test="description">
                                        <div>
                                            Description: <xsl:value-of select="description" />
                                        </div>
                                    </xsl:if>

                                    <xsl:if test="projects">
                                        <div id="item-work-{position()}-collapse" class="collapse">
                                            <xsl:if test="projects">
                                                <div>
                                                    Projects:
                                                    <ul>
                                                        <xsl:for-each select="projects/item">
                                                            <xsl:sort select="dates/start" order="descending" />
                                                            <li>
                                                                <em><xsl:value-of select="name" /></em>
                                                                <xsl:if test="size">
                                                                    [<xsl:value-of select="size" /><xsl:value-of select="size/@unit" />]
                                                                </xsl:if>:
                                                                <xsl:value-of select="description" />

                                                                <xsl:apply-templates select="tags" />
                                                            </li>
                                                        </xsl:for-each>
                                                    </ul>
                                                </div>
                                            </xsl:if>
                                        </div>
                                        <div>
                                            <a href="#item-work-{position()}-collapse" class="collapsed" data-toggle="collapse" aria-expanded="false" aria-controls="item-work-{position()}-collapse">Show more</a>
                                        </div>
                                    </xsl:if>

                                    <xsl:apply-templates select="tags" />
                                </div>
                            </xsl:for-each>
                        </div>

                        <div id="projects" class="section">
                            <h3 class="title">Projects</h3>
                            <xsl:for-each select="education/item/projects/item | work-experience/item/projects/item">
                                <xsl:sort select="dates/start" order="descending" />
                                <div id="item-project-{position()}" class="item" data-time-range="{dates/start}-{dates/end}">
                                    <i class="fa fa-code-fork fa-2x"></i>
                                    <h5 class="title"><xsl:value-of select="name" /></h5>

                                    <xsl:apply-templates select="dates" />

                                    <xsl:value-of select="description" />

                                    <xsl:if test="url">
                                        <div>
                                            <i class="fa fa-external-link"></i><xsl:text> </xsl:text><a href="{url}"><xsl:value-of select="url" /></a>
                                        </div>
                                    </xsl:if>

                                    <xsl:apply-templates select="tags" />
                                </div>
                            </xsl:for-each>
                        </div>
                    </div>
                </div>
                <script><![CDATA[
                // toggle 'Show more' / 'Show less' text of collapse links:
                $('[data-toggle="collapse"]').click(function() {
                    let e = $(this)
                    setTimeout(function() {e.text(e.hasClass("collapsed") ? "Show more" : "Show less")}, 400)
                });

                // create tag pills:
                $('div.item').each(function(i,e) {
                    var tags = $(e).data('tags')
                    if(!tags) return
                    tags = tags.split(',')
                    $.each(tags, function(i,tag) { $(e).addClass(`tag-${tag}`) })
                    $(e).find('div.item-content').append('<div class="item-tags">' + $.map(tags, function(tag) {return `<a href="#" class="show-tag-${tag}"><span class="badge badge-pill badge-primary">${tag}</span></a>`}).join(' ') + '</div>')
                })

                function allTags() {
                    var at = {}
                    $('div.item').each(function(i,e) {
                        var tags = $(e).data('tags')
                        if(!tags) return
                        tags = tags.split(',')
                        for(var tag of tags) at[tag] = 1
                    })
                    at = Object.keys(at)
                    console.log("all tags:", at)
                    return at
                }
                function filterItem(id, visible) {
                    var e = $('#' + id)
                    var speed = 'fast'
                    if(visible) e.show(speed)
                    else e.hide(speed)
                }
                function filterItems(tag) {
                    console.log("filterItems", tag)
                    var b = {}
                    for(var y of allTags())
                        if(tag !== y)
                            $('.tag-' + y).each(function(i,e) {b[e.id] = false})
                    $('.tag-' + tag).each(function(i,e) {b[e.id] = true})
                    for(var id in b) filterItem(id, b[id])
                }

                function itemHasTag(i,t) {
                    return $(i).find('a.tag').is(function(i,e) { return $(e).text() == t })
                }

                function filterByTag(t) {
                    if(!t) {
                        $('#content').removeClass('searching')
                        $('div.item').css('display', 'block')
                    }
                    else {
                        $('div.item').each(function(i,e) {
                            $(e).css('display', itemHasTag(e,t) ? 'block' : 'none')
                        })
                        $('#content').addClass('searching')
                        $('#searchTerm').text(t)
                    }
                }

                var timelineShowTimeout
                var timelineHideTimeout
                function showTimeline() {
                }
                function hideTimeline() {
                }
                $('div.item').each(function(i,e) {
                    if(!$(e).data('time-range')) return
                    $(e)
                        .mouseover(function() {
                            clearTimeout(timelineHideTimeout)
                            $('#range-' + $(e).data('time-range')).addClass('hover')
                            timelineShowTimeout = setTimeout(function() {
                                $('#timeline-wrap').css('opacity', 1)
                            }, 1000)
                        })
                        .mouseout(function() {
                            clearTimeout(timelineShowTimeout)
                            $('#range-' + $(e).data('time-range')).removeClass('hover')
                            timelineHideTimeout = setTimeout(function() {
                                $('#timeline-wrap').css('opacity', 0)
                            }, 1000)
                        })
                })

                $('.date').each(function(i,e) {
                    if($(e).text() == '')
                        $(e).text('Now')
                    else {
                        var d = new Date($(e).text())
                        $(e).text(d.toLocaleString('default', {month: 'short'}) + ' ' + d.getFullYear())
                    }
                })

                if("onhashchange" in window) {
                    window.onhashchange = function() {
                        hashChanged(window.location.hash);
                    }
                }
                else {
                    var storedHash = window.location.hash;
                    window.setInterval(function() {
                        if(window.location.hash != storedHash) {
                            storedHash = window.location.hash;
                            hashChanged(storedHash);
                        }
                    }, 100);
                }

                function hashChanged(h) {
                    var s = unescape(h.split('#').pop())
                    var stdlinks = $('a.nav-link').map(function(i,e) {return e.href.split('#').pop()}).toArray()
                    if(stdlinks.indexOf(s) < 0) {
                        filterByTag(s)
                        $(window).scrollTop(0);
                    }
                    else {
                        filterByTag()
                        $(window).scrollTop($(`div[id="${s}"]`).offset().top)
                    }
                }

                hashChanged(window.location.hash)
                ]]></script>
                <script src="https://cdn.jsdelivr.net/npm/particles.js@2.0.0/particles.js"></script>
                <script>
                    particlesJS("particles-js", {"particles": {"number": {"value": 100, "density": {"enable": true, "value_area": 100}}, "color": {"value": "#fff", "opacity": 0.6}, "shape": {"type": "edge"}, "opacity": {"value": 0.1, "random": false, "anim": {"enable": false, "speed": 1, "opacity_min": 0.4, "sync": false}}, "size": {"value": 5, "random": true, "anim": {"enable": false, "speed": 20, "size_min": 0.1, "sync": false}}, "line_linked": {"enable": true, "distance": 50, "color": "#fff", "opacity": 0.6, "width": 1}, "move": {"enable": true, "speed": 1, "direction": "none", "random": true, "straight": false, "out_mode": "out", "bounce": true}}, "interactivity": {"detect_on": "canvas", "events": {"onhover": {"enable": true, "mode": "grab"}, "resize": true}, "modes": {"grab": {"distance": 60, "line_linked": {"opacity": 0.8}}, "remove": {"particles_nb": 2}}}, "retina_detect": true});
                </script>
            </body>
        </html>
	</xsl:template>

    <xsl:template match="tags">
        <div class="tags">
            <xsl:apply-templates select="tag" />
        </div>
	</xsl:template>

    <xsl:template match="tags/tag">
        <a href="#{.}" class="badge badge-pill badge-secondary tag"><xsl:value-of select="." /></a>
        <xsl:text> </xsl:text>
	</xsl:template>

    <xsl:template match="dates">
        <div class="dates">
            <i class="fa fa-calendar"></i>
            <xsl:text> </xsl:text>
            <span class="date"><xsl:value-of select="start" /></span>
            <xsl:text> - </xsl:text>
            <span class="date"><xsl:value-of select="end" /></span>
        </div>
	</xsl:template>
</xsl:stylesheet>
