---
layout: page
title: Chapter 1 - Data Wrangling
---

This chapter introduces some helper functions to query the Longitudinal Tracts Database (LTDB) to search for the variables you need for your analysis.

Library
=======

    #Library
    library( tidyverse )
    library( here )
    library( pander )

Load LTDB Data
==============

    # Data

    # store data dictionary file path
    DD_FILEPATH <- here::here( "data/rodeo/ltdb_data_dictionary.csv" )

    # import data dictionary
    dd <- read.csv( DD_FILEPATH, stringsAsFactors=F)

    # Longitudinal Tract Database 2010 Sample file path
    LTDB_FILEPATH <- here::here( "data/raw/ltdb_std_2010_sample.csv" )

    # Import Longitudinal Tract Database 2010 Sample 
    ltdb.data <- read_csv( LTDB_FILEPATH, col_names = TRUE )

    # Rename columns to lower case
    ltdb.data <- as.data.frame( sapply( ltdb.data, tolower ) )

Load Helper Functions
=====================

    # Load function source file
    import::here("filter_category",
                 "var_description",
                 "filter_time",
                 .from = here::here("analysis/source_file_rn.R"),
                 .character_only = TRUE)

Sample Functions
================

    # filter data where the category contains "race"
    filter_category(dd, "race") %>% 
      pander()

<table>
<caption>Table continues below</caption>
<colgroup>
<col style="width: 12%" />
<col style="width: 11%" />
<col style="width: 11%" />
<col style="width: 24%" />
<col style="width: 40%" />
</colgroup>
<thead>
<tr class="header">
<th style="text-align: center;"> </th>
<th style="text-align: center;">root</th>
<th style="text-align: center;">root2</th>
<th style="text-align: center;">category</th>
<th style="text-align: center;">definition</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: center;"><strong>15</strong></td>
<td style="text-align: center;">a15asn</td>
<td style="text-align: center;">a15asn</td>
<td style="text-align: center;">age-race</td>
<td style="text-align: center;">0-15 years old of Asians and Pacific Islanders (in 1980, 0-14 years old of Asians/Pacific Islanders; in 2008-12 ACS, 0-14 years old of Asian/Pacific Islander race)</td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>16</strong></td>
<td style="text-align: center;">a15blk</td>
<td style="text-align: center;">a15blk</td>
<td style="text-align: center;">age-race</td>
<td style="text-align: center;">0-15 years old of black race (in 1980, 0-14 years old of black race; in 2006- 10 ACS, 0-14 years old of black race)</td>
</tr>
<tr class="odd">
<td style="text-align: center;"><strong>17</strong></td>
<td style="text-align: center;">a15hsp</td>
<td style="text-align: center;">a15hsp</td>
<td style="text-align: center;">age-race</td>
<td style="text-align: center;">0-15 years old, persons of Hispanic origins (in 1980, 0-14 years old, persons of Hispanic origin; in 2008-12 ACS, 0-14 years old, persons of Hispanic origins)</td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>18</strong></td>
<td style="text-align: center;">a15ntv</td>
<td style="text-align: center;">a15ntv</td>
<td style="text-align: center;">age-race</td>
<td style="text-align: center;">0-15 years old of Native American race (in 1980, 0-14 years old of Native American race; in 2008-12 ACS, 0-14 years old of Native American race)</td>
</tr>
<tr class="odd">
<td style="text-align: center;"><strong>19</strong></td>
<td style="text-align: center;">a15wht</td>
<td style="text-align: center;">a15wht</td>
<td style="text-align: center;">age-race</td>
<td style="text-align: center;">0-15 years old of white race (in 1980, 0-14 years old of white race; in 2006- 10 ACS, 0-14 years old of white race)</td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>21</strong></td>
<td style="text-align: center;">a60asn</td>
<td style="text-align: center;">a60asn</td>
<td style="text-align: center;">age-race</td>
<td style="text-align: center;">60 years and older of Asians and Pacific Islanders</td>
</tr>
<tr class="odd">
<td style="text-align: center;"><strong>22</strong></td>
<td style="text-align: center;">a60blk</td>
<td style="text-align: center;">a60blk</td>
<td style="text-align: center;">age-race</td>
<td style="text-align: center;">60 years and older of black race</td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>23</strong></td>
<td style="text-align: center;">a60hsp</td>
<td style="text-align: center;">a60hsp</td>
<td style="text-align: center;">age-race</td>
<td style="text-align: center;">60 years and older, persons of Hispanic origins</td>
</tr>
<tr class="odd">
<td style="text-align: center;"><strong>24</strong></td>
<td style="text-align: center;">a60ntv</td>
<td style="text-align: center;">a60ntv</td>
<td style="text-align: center;">age-race</td>
<td style="text-align: center;">60 years and older of Native American race</td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>26</strong></td>
<td style="text-align: center;">a60wht</td>
<td style="text-align: center;">a60wht</td>
<td style="text-align: center;">age-race</td>
<td style="text-align: center;">60 years and older of white race</td>
</tr>
<tr class="odd">
<td style="text-align: center;"><strong>27</strong></td>
<td style="text-align: center;">a65asn</td>
<td style="text-align: center;">a65asn</td>
<td style="text-align: center;">age-race</td>
<td style="text-align: center;">65 years and older of Asians and Pacific Islanders</td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>28</strong></td>
<td style="text-align: center;">a65blk</td>
<td style="text-align: center;">a65blk</td>
<td style="text-align: center;">age-race</td>
<td style="text-align: center;">65 years and older of black race</td>
</tr>
<tr class="odd">
<td style="text-align: center;"><strong>29</strong></td>
<td style="text-align: center;">a65hsp</td>
<td style="text-align: center;">a65hsp</td>
<td style="text-align: center;">age-race</td>
<td style="text-align: center;">65 years and older, persons of Hispanic origins</td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>30</strong></td>
<td style="text-align: center;">a65ntv</td>
<td style="text-align: center;">a65ntv</td>
<td style="text-align: center;">age-race</td>
<td style="text-align: center;">65 years and older of Native American race</td>
</tr>
<tr class="odd">
<td style="text-align: center;"><strong>31</strong></td>
<td style="text-align: center;">a65wht</td>
<td style="text-align: center;">a65wht</td>
<td style="text-align: center;">age-race</td>
<td style="text-align: center;">65 years and older of non-Hispanic whites</td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>38</strong></td>
<td style="text-align: center;">ageasn</td>
<td style="text-align: center;">ageasn</td>
<td style="text-align: center;">age-race</td>
<td style="text-align: center;">Asian and Pacific Islander population with known age distribution</td>
</tr>
<tr class="odd">
<td style="text-align: center;"><strong>39</strong></td>
<td style="text-align: center;">ageblk</td>
<td style="text-align: center;">ageblk</td>
<td style="text-align: center;">age-race</td>
<td style="text-align: center;">black population with known age distribution</td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>40</strong></td>
<td style="text-align: center;">agehsp</td>
<td style="text-align: center;">agehsp</td>
<td style="text-align: center;">age-race</td>
<td style="text-align: center;">Hispanic population with known age distribution</td>
</tr>
<tr class="odd">
<td style="text-align: center;"><strong>41</strong></td>
<td style="text-align: center;">agentv</td>
<td style="text-align: center;">agentv</td>
<td style="text-align: center;">age-race</td>
<td style="text-align: center;">Native American population with known age distribution</td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>42</strong></td>
<td style="text-align: center;">agewht</td>
<td style="text-align: center;">agewht</td>
<td style="text-align: center;">age-race</td>
<td style="text-align: center;">white population with known age distribution</td>
</tr>
<tr class="odd">
<td style="text-align: center;"><strong>43</strong></td>
<td style="text-align: center;">asian</td>
<td style="text-align: center;">asian</td>
<td style="text-align: center;">race</td>
<td style="text-align: center;">persons of Asian race (and Pacific Islander)</td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>44</strong></td>
<td style="text-align: center;">black</td>
<td style="text-align: center;">black</td>
<td style="text-align: center;">race</td>
<td style="text-align: center;">persons of black race</td>
</tr>
<tr class="odd">
<td style="text-align: center;"><strong>50</strong></td>
<td style="text-align: center;">dapov</td>
<td style="text-align: center;">dapov</td>
<td style="text-align: center;">poverty-race</td>
<td style="text-align: center;">Asians and Pacific Islanders for whom poverty status is determined</td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>51</strong></td>
<td style="text-align: center;">dbpov</td>
<td style="text-align: center;">dbpov</td>
<td style="text-align: center;">poverty-race</td>
<td style="text-align: center;">black persons for whom poverty status is determined</td>
</tr>
<tr class="odd">
<td style="text-align: center;"><strong>55</strong></td>
<td style="text-align: center;">dhpov</td>
<td style="text-align: center;">dhpov</td>
<td style="text-align: center;">poverty-race</td>
<td style="text-align: center;">Hispanics for whom poverty status is determined</td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>58</strong></td>
<td style="text-align: center;">dnapov</td>
<td style="text-align: center;">dnapov</td>
<td style="text-align: center;">poverty-race</td>
<td style="text-align: center;">Native American for whom poverty status is determined</td>
</tr>
<tr class="odd">
<td style="text-align: center;"><strong>60</strong></td>
<td style="text-align: center;">dwpov</td>
<td style="text-align: center;">dwpov</td>
<td style="text-align: center;">poverty-race</td>
<td style="text-align: center;">white persons for whom poverty status is determined</td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>71</strong></td>
<td style="text-align: center;">haw</td>
<td style="text-align: center;">haw</td>
<td style="text-align: center;">race</td>
<td style="text-align: center;">persons of Hawaiian race</td>
</tr>
<tr class="odd">
<td style="text-align: center;"><strong>73</strong></td>
<td style="text-align: center;">hha</td>
<td style="text-align: center;">hha</td>
<td style="text-align: center;">demographics-race</td>
<td style="text-align: center;">total Asian/Pacific Islander households in sample-based data</td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>74</strong></td>
<td style="text-align: center;">hhb</td>
<td style="text-align: center;">hhb</td>
<td style="text-align: center;">demographics-race</td>
<td style="text-align: center;">total black households in sample-based data</td>
</tr>
<tr class="odd">
<td style="text-align: center;"><strong>75</strong></td>
<td style="text-align: center;">hhh</td>
<td style="text-align: center;">hhh</td>
<td style="text-align: center;">demographics-race</td>
<td style="text-align: center;">total Hispanic households in sample-based data</td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>76</strong></td>
<td style="text-align: center;">hhw</td>
<td style="text-align: center;">hhw</td>
<td style="text-align: center;">demographics-race</td>
<td style="text-align: center;">total white households in sample-based data</td>
</tr>
<tr class="odd">
<td style="text-align: center;"><strong>78</strong></td>
<td style="text-align: center;">hinca</td>
<td style="text-align: center;">hinca</td>
<td style="text-align: center;">income-race</td>
<td style="text-align: center;">Median household income for Asians and Pacific Islanders</td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>79</strong></td>
<td style="text-align: center;">hincb</td>
<td style="text-align: center;">hincb</td>
<td style="text-align: center;">income-race</td>
<td style="text-align: center;">Median household income for blacks</td>
</tr>
<tr class="odd">
<td style="text-align: center;"><strong>80</strong></td>
<td style="text-align: center;">hinch</td>
<td style="text-align: center;">hinch</td>
<td style="text-align: center;">income-race</td>
<td style="text-align: center;">Median household income for Hispanics</td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>81</strong></td>
<td style="text-align: center;">hincw</td>
<td style="text-align: center;">hincw</td>
<td style="text-align: center;">income-race</td>
<td style="text-align: center;">Median household income for whites</td>
</tr>
<tr class="odd">
<td style="text-align: center;"><strong>82</strong></td>
<td style="text-align: center;">hisp</td>
<td style="text-align: center;">hisp</td>
<td style="text-align: center;">race</td>
<td style="text-align: center;">persons of Hispanic origin</td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>90</strong></td>
<td style="text-align: center;">india</td>
<td style="text-align: center;">india</td>
<td style="text-align: center;">race</td>
<td style="text-align: center;">persons of Asian Indian race</td>
</tr>
<tr class="odd">
<td style="text-align: center;"><strong>108</strong></td>
<td style="text-align: center;">napov</td>
<td style="text-align: center;">napov</td>
<td style="text-align: center;">poverty-race</td>
<td style="text-align: center;">Asians and Pacific Islanders in poverty</td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>110</strong></td>
<td style="text-align: center;">nbpov</td>
<td style="text-align: center;">nbpov</td>
<td style="text-align: center;">poverty-race</td>
<td style="text-align: center;">blacks in poverty</td>
</tr>
<tr class="odd">
<td style="text-align: center;"><strong>112</strong></td>
<td style="text-align: center;">nhblk</td>
<td style="text-align: center;">nhblk</td>
<td style="text-align: center;">race</td>
<td style="text-align: center;">persons of black race, not Hispanic origin</td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>113</strong></td>
<td style="text-align: center;">nhpov</td>
<td style="text-align: center;">nhpov</td>
<td style="text-align: center;">poverty-race</td>
<td style="text-align: center;">Hispanics in poverty</td>
</tr>
<tr class="odd">
<td style="text-align: center;"><strong>114</strong></td>
<td style="text-align: center;">nhwht</td>
<td style="text-align: center;">nhwht</td>
<td style="text-align: center;">race</td>
<td style="text-align: center;">persons of white race, not Hispanic origin</td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>115</strong></td>
<td style="text-align: center;">nnapov</td>
<td style="text-align: center;">nnapov</td>
<td style="text-align: center;">poverty-race</td>
<td style="text-align: center;">Native Americans in poverty</td>
</tr>
<tr class="odd">
<td style="text-align: center;"><strong>117</strong></td>
<td style="text-align: center;">ntv</td>
<td style="text-align: center;">ntv</td>
<td style="text-align: center;">race</td>
<td style="text-align: center;">persons of Native American race</td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>118</strong></td>
<td style="text-align: center;">nwpov</td>
<td style="text-align: center;">nwpov</td>
<td style="text-align: center;">poverty-race</td>
<td style="text-align: center;">whites in poverty</td>
</tr>
<tr class="odd">
<td style="text-align: center;"><strong>128</strong></td>
<td style="text-align: center;">p15asn</td>
<td style="text-align: center;">p15asn</td>
<td style="text-align: center;">age-race</td>
<td style="text-align: center;">percentage of 0-15 years old of Asians and Pacific Islanders (in 1980, percentage of 0-14 years old of Asians/Pacific Islanders; in 2008-12 ACS, percentage of 0-14 years old of Asian/Pacific Islander race)</td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>129</strong></td>
<td style="text-align: center;">p15blk</td>
<td style="text-align: center;">p15blk</td>
<td style="text-align: center;">age-race</td>
<td style="text-align: center;">percentage of 0-15 years old of black race (in 1980, percentage of 0-14 years old of black race; in 2008-12 ACS, percentage of 0-14 years old of black race)</td>
</tr>
<tr class="odd">
<td style="text-align: center;"><strong>130</strong></td>
<td style="text-align: center;">p15hsp</td>
<td style="text-align: center;">p15hsp</td>
<td style="text-align: center;">age-race</td>
<td style="text-align: center;">percentage of 0-15 years old, persons of Hispanic origins (in 1980, percentage of 0-14 years old, persons of Hispanic origin; in 2008-12 ACS, percentage of 0-14 years old, persons of Hispanic origins)</td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>131</strong></td>
<td style="text-align: center;">p15ntv</td>
<td style="text-align: center;">p15ntv</td>
<td style="text-align: center;">age-race</td>
<td style="text-align: center;">percentage of 0-15 years old of Native American race (in 1980, percentage of 0-14 years old of Native American race; in 2008-12 ACS, percentage of 0-14 years old of Native American race)</td>
</tr>
<tr class="odd">
<td style="text-align: center;"><strong>132</strong></td>
<td style="text-align: center;">p15wht</td>
<td style="text-align: center;">p15wht</td>
<td style="text-align: center;">age-race</td>
<td style="text-align: center;">percentage of 0-15 years old of white race (in 1980, percentage of 0-14 years old of white race; in 2008-12 ACS, percentage of 0-14 years old of white race)</td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>136</strong></td>
<td style="text-align: center;">p65asn</td>
<td style="text-align: center;">p65asn</td>
<td style="text-align: center;">age-race</td>
<td style="text-align: center;">percentage of 65 years and older of Asians and Pacific Islanders</td>
</tr>
<tr class="odd">
<td style="text-align: center;"><strong>137</strong></td>
<td style="text-align: center;">p65blk</td>
<td style="text-align: center;">p65blk</td>
<td style="text-align: center;">age-race</td>
<td style="text-align: center;">percentage of 65 years and older of black race</td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>138</strong></td>
<td style="text-align: center;">p65hsp</td>
<td style="text-align: center;">p65hsp</td>
<td style="text-align: center;">age-race</td>
<td style="text-align: center;">percentage of 65 years and older, persons of Hispanic origins</td>
</tr>
<tr class="odd">
<td style="text-align: center;"><strong>139</strong></td>
<td style="text-align: center;">p65ntv</td>
<td style="text-align: center;">p65ntv</td>
<td style="text-align: center;">age-race</td>
<td style="text-align: center;">percentage of 65 years and older of Native American race</td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>140</strong></td>
<td style="text-align: center;">p65pov</td>
<td style="text-align: center;">p65pov</td>
<td style="text-align: center;">age-race</td>
<td style="text-align: center;">percentage of 65 years and older in poverty</td>
</tr>
<tr class="odd">
<td style="text-align: center;"><strong>141</strong></td>
<td style="text-align: center;">p65wht</td>
<td style="text-align: center;">p65wht</td>
<td style="text-align: center;">age-race</td>
<td style="text-align: center;">percentage of 65 years and older of non-Hispanic whites</td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>143</strong></td>
<td style="text-align: center;">papov</td>
<td style="text-align: center;">papov</td>
<td style="text-align: center;">poverty-race</td>
<td style="text-align: center;">percentage of Asian and Pacific Islanders in poverty</td>
</tr>
<tr class="odd">
<td style="text-align: center;"><strong>144</strong></td>
<td style="text-align: center;">pasian</td>
<td style="text-align: center;">pasian</td>
<td style="text-align: center;">race</td>
<td style="text-align: center;">percentage of persons of Asian race (and Pacific Islander)</td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>145</strong></td>
<td style="text-align: center;">pbpov</td>
<td style="text-align: center;">pbpov</td>
<td style="text-align: center;">poverty-race</td>
<td style="text-align: center;">percentage of blacks in poverty</td>
</tr>
<tr class="odd">
<td style="text-align: center;"><strong>156</strong></td>
<td style="text-align: center;">phaw</td>
<td style="text-align: center;">phaw</td>
<td style="text-align: center;">race</td>
<td style="text-align: center;">percentage of persons of Hawaiian race</td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>157</strong></td>
<td style="text-align: center;">phisp</td>
<td style="text-align: center;">phisp</td>
<td style="text-align: center;">race</td>
<td style="text-align: center;">percentage of persons of Hispanic origin</td>
</tr>
<tr class="odd">
<td style="text-align: center;"><strong>158</strong></td>
<td style="text-align: center;">phpov</td>
<td style="text-align: center;">phpov</td>
<td style="text-align: center;">poverty-race</td>
<td style="text-align: center;">percentage of Hispanics in poverty</td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>172</strong></td>
<td style="text-align: center;">pnapov</td>
<td style="text-align: center;">pnapov</td>
<td style="text-align: center;">poverty-race</td>
<td style="text-align: center;">percentage of Native Americans in poverty</td>
</tr>
<tr class="odd">
<td style="text-align: center;"><strong>174</strong></td>
<td style="text-align: center;">pnhblk</td>
<td style="text-align: center;">pnhblk</td>
<td style="text-align: center;">race</td>
<td style="text-align: center;">percentage of persons of black race, not Hispanic origin</td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>175</strong></td>
<td style="text-align: center;">pnhwht</td>
<td style="text-align: center;">pnhwht</td>
<td style="text-align: center;">race</td>
<td style="text-align: center;">percentage of persons white, not Hispanic origin</td>
</tr>
<tr class="odd">
<td style="text-align: center;"><strong>176</strong></td>
<td style="text-align: center;">pntv</td>
<td style="text-align: center;">pntv</td>
<td style="text-align: center;">race</td>
<td style="text-align: center;">percentage of persons of Native American race</td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>199</strong></td>
<td style="text-align: center;">pwpov</td>
<td style="text-align: center;">pwpov</td>
<td style="text-align: center;">poverty-race</td>
<td style="text-align: center;">percentage of whites in poverty</td>
</tr>
<tr class="odd">
<td style="text-align: center;"><strong>211</strong></td>
<td style="text-align: center;">white</td>
<td style="text-align: center;">white</td>
<td style="text-align: center;">race</td>
<td style="text-align: center;">persons of white race</td>
</tr>
</tbody>
</table>

<table>
<caption>Table continues below</caption>
<colgroup>
<col style="width: 13%" />
<col style="width: 14%" />
<col style="width: 13%" />
<col style="width: 13%" />
<col style="width: 14%" />
<col style="width: 14%" />
<col style="width: 14%" />
</colgroup>
<thead>
<tr class="header">
<th style="text-align: center;"> </th>
<th style="text-align: center;">X1970.f</th>
<th style="text-align: center;">X1970.s</th>
<th style="text-align: center;">X1980.f</th>
<th style="text-align: center;">X1980.s</th>
<th style="text-align: center;">X1990.f</th>
<th style="text-align: center;">X1990.s</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: center;"><strong>15</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;">a15asn80</td>
<td style="text-align: center;">A15ASN90</td>
<td style="text-align: center;"></td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>16</strong></td>
<td style="text-align: center;">A15BLK70</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;">a15blk80</td>
<td style="text-align: center;">A15BLK90</td>
<td style="text-align: center;"></td>
</tr>
<tr class="odd">
<td style="text-align: center;"><strong>17</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;">a15hsp80</td>
<td style="text-align: center;">A15HSP90</td>
<td style="text-align: center;"></td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>18</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;">a15ntv80</td>
<td style="text-align: center;">A15NTV90</td>
<td style="text-align: center;"></td>
</tr>
<tr class="odd">
<td style="text-align: center;"><strong>19</strong></td>
<td style="text-align: center;">A15WHT70</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;">a15wht80</td>
<td style="text-align: center;">A15WHT90</td>
<td style="text-align: center;"></td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>21</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;">a60asn80</td>
<td style="text-align: center;">A60ASN90</td>
<td style="text-align: center;"></td>
</tr>
<tr class="odd">
<td style="text-align: center;"><strong>22</strong></td>
<td style="text-align: center;">A60BLK70</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;">a60blk80</td>
<td style="text-align: center;">A60BLK90</td>
<td style="text-align: center;"></td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>23</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;">a60hsp80</td>
<td style="text-align: center;">A60HSP90</td>
<td style="text-align: center;"></td>
</tr>
<tr class="odd">
<td style="text-align: center;"><strong>24</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;">a60ntv80</td>
<td style="text-align: center;">A60NTV90</td>
<td style="text-align: center;"></td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>26</strong></td>
<td style="text-align: center;">A60WHT70</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;">a60wht80</td>
<td style="text-align: center;">A60WHT90</td>
<td style="text-align: center;"></td>
</tr>
<tr class="odd">
<td style="text-align: center;"><strong>27</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>28</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
</tr>
<tr class="odd">
<td style="text-align: center;"><strong>29</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>30</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
</tr>
<tr class="odd">
<td style="text-align: center;"><strong>31</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>38</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;">ageasn80</td>
<td style="text-align: center;">AGEASN90</td>
<td style="text-align: center;"></td>
</tr>
<tr class="odd">
<td style="text-align: center;"><strong>39</strong></td>
<td style="text-align: center;">AGEBLK70</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;">ageblk80</td>
<td style="text-align: center;">AGEBLK90</td>
<td style="text-align: center;"></td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>40</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;">agehsp80</td>
<td style="text-align: center;">AGEHSP90</td>
<td style="text-align: center;"></td>
</tr>
<tr class="odd">
<td style="text-align: center;"><strong>41</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;">agentv80</td>
<td style="text-align: center;">AGENTV90</td>
<td style="text-align: center;"></td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>42</strong></td>
<td style="text-align: center;">AGEWHT70</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;">agewht80</td>
<td style="text-align: center;">AGEWHT90</td>
<td style="text-align: center;"></td>
</tr>
<tr class="odd">
<td style="text-align: center;"><strong>43</strong></td>
<td style="text-align: center;">ASIAN70</td>
<td style="text-align: center;"></td>
<td style="text-align: center;">ASIAN80</td>
<td style="text-align: center;"></td>
<td style="text-align: center;">ASIAN90</td>
<td style="text-align: center;"></td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>44</strong></td>
<td style="text-align: center;">BLACK70</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
</tr>
<tr class="odd">
<td style="text-align: center;"><strong>50</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;">dapov80</td>
<td style="text-align: center;"></td>
<td style="text-align: center;">DAPOV90</td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>51</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;">DBPOV70</td>
<td style="text-align: center;"></td>
<td style="text-align: center;">dbpov80</td>
<td style="text-align: center;"></td>
<td style="text-align: center;">DBPOV90</td>
</tr>
<tr class="odd">
<td style="text-align: center;"><strong>55</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;">dhpov80</td>
<td style="text-align: center;"></td>
<td style="text-align: center;">DHPOV90</td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>58</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;">dnapov80</td>
<td style="text-align: center;"></td>
<td style="text-align: center;">DNAPOV90</td>
</tr>
<tr class="odd">
<td style="text-align: center;"><strong>60</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;">DWPOV70</td>
<td style="text-align: center;"></td>
<td style="text-align: center;">dwpov80</td>
<td style="text-align: center;"></td>
<td style="text-align: center;">DWPOV90</td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>71</strong></td>
<td style="text-align: center;">HAW70</td>
<td style="text-align: center;"></td>
<td style="text-align: center;">HAW80</td>
<td style="text-align: center;"></td>
<td style="text-align: center;">HAW90</td>
<td style="text-align: center;"></td>
</tr>
<tr class="odd">
<td style="text-align: center;"><strong>73</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;">hha80</td>
<td style="text-align: center;"></td>
<td style="text-align: center;">HHA90</td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>74</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;">hhb80</td>
<td style="text-align: center;"></td>
<td style="text-align: center;">HHB90</td>
</tr>
<tr class="odd">
<td style="text-align: center;"><strong>75</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;">hhh80</td>
<td style="text-align: center;"></td>
<td style="text-align: center;">HHH90</td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>76</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;">hhw80</td>
<td style="text-align: center;"></td>
<td style="text-align: center;">HHW90</td>
</tr>
<tr class="odd">
<td style="text-align: center;"><strong>78</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;">hinca80</td>
<td style="text-align: center;"></td>
<td style="text-align: center;">HINCA90</td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>79</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;">hincb80</td>
<td style="text-align: center;"></td>
<td style="text-align: center;">HINCB90</td>
</tr>
<tr class="odd">
<td style="text-align: center;"><strong>80</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;">hinch80</td>
<td style="text-align: center;"></td>
<td style="text-align: center;">HINCH90</td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>81</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;">hincw80</td>
<td style="text-align: center;"></td>
<td style="text-align: center;">HINCW90</td>
</tr>
<tr class="odd">
<td style="text-align: center;"><strong>82</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;">HISP80</td>
<td style="text-align: center;"></td>
<td style="text-align: center;">HISP90</td>
<td style="text-align: center;"></td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>90</strong></td>
<td style="text-align: center;">INDIA70</td>
<td style="text-align: center;"></td>
<td style="text-align: center;">INDIA80</td>
<td style="text-align: center;"></td>
<td style="text-align: center;">INDIA90</td>
<td style="text-align: center;"></td>
</tr>
<tr class="odd">
<td style="text-align: center;"><strong>108</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;">napov80</td>
<td style="text-align: center;"></td>
<td style="text-align: center;">NAPOV90</td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>110</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;">NBPOV70</td>
<td style="text-align: center;"></td>
<td style="text-align: center;">nbpov80</td>
<td style="text-align: center;"></td>
<td style="text-align: center;">NBPOV90</td>
</tr>
<tr class="odd">
<td style="text-align: center;"><strong>112</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;">NHBLK80</td>
<td style="text-align: center;"></td>
<td style="text-align: center;">NHBLK90</td>
<td style="text-align: center;"></td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>113</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;">nhpov80</td>
<td style="text-align: center;"></td>
<td style="text-align: center;">NHPOV90</td>
</tr>
<tr class="odd">
<td style="text-align: center;"><strong>114</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;">NHWHT80</td>
<td style="text-align: center;"></td>
<td style="text-align: center;">NHWHT90</td>
<td style="text-align: center;"></td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>115</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;">nnapov80</td>
<td style="text-align: center;"></td>
<td style="text-align: center;">NNAPOV90</td>
</tr>
<tr class="odd">
<td style="text-align: center;"><strong>117</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;">NTV80</td>
<td style="text-align: center;"></td>
<td style="text-align: center;">NTV90</td>
<td style="text-align: center;"></td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>118</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;">NWPOV70</td>
<td style="text-align: center;"></td>
<td style="text-align: center;">nwpov80</td>
<td style="text-align: center;"></td>
<td style="text-align: center;">NWPOV90</td>
</tr>
<tr class="odd">
<td style="text-align: center;"><strong>128</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>129</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
</tr>
<tr class="odd">
<td style="text-align: center;"><strong>130</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>131</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
</tr>
<tr class="odd">
<td style="text-align: center;"><strong>132</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>136</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
</tr>
<tr class="odd">
<td style="text-align: center;"><strong>137</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>138</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
</tr>
<tr class="odd">
<td style="text-align: center;"><strong>139</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>140</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
</tr>
<tr class="odd">
<td style="text-align: center;"><strong>141</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>143</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
</tr>
<tr class="odd">
<td style="text-align: center;"><strong>144</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>145</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
</tr>
<tr class="odd">
<td style="text-align: center;"><strong>156</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>157</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
</tr>
<tr class="odd">
<td style="text-align: center;"><strong>158</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>172</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
</tr>
<tr class="odd">
<td style="text-align: center;"><strong>174</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>175</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
</tr>
<tr class="odd">
<td style="text-align: center;"><strong>176</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>199</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
</tr>
<tr class="odd">
<td style="text-align: center;"><strong>211</strong></td>
<td style="text-align: center;">WHITE70</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
</tr>
</tbody>
</table>

<table style="width:75%;">
<colgroup>
<col style="width: 13%" />
<col style="width: 15%" />
<col style="width: 15%" />
<col style="width: 15%" />
<col style="width: 15%" />
</colgroup>
<thead>
<tr class="header">
<th style="text-align: center;"> </th>
<th style="text-align: center;">X2000.f</th>
<th style="text-align: center;">X2000.s</th>
<th style="text-align: center;">X2010.f</th>
<th style="text-align: center;">X2010.s</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: center;"><strong>15</strong></td>
<td style="text-align: center;">A15ASN00</td>
<td style="text-align: center;"></td>
<td style="text-align: center;">a15asn10</td>
<td style="text-align: center;">a15asn12</td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>16</strong></td>
<td style="text-align: center;">A15BLK00</td>
<td style="text-align: center;"></td>
<td style="text-align: center;">a15blk10</td>
<td style="text-align: center;">a15blk12</td>
</tr>
<tr class="odd">
<td style="text-align: center;"><strong>17</strong></td>
<td style="text-align: center;">A15HSP00</td>
<td style="text-align: center;"></td>
<td style="text-align: center;">a15hsp10</td>
<td style="text-align: center;">a15hsp12</td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>18</strong></td>
<td style="text-align: center;">A15NTV00</td>
<td style="text-align: center;"></td>
<td style="text-align: center;">a15ntv10</td>
<td style="text-align: center;">a15ntv12</td>
</tr>
<tr class="odd">
<td style="text-align: center;"><strong>19</strong></td>
<td style="text-align: center;">A15WHT00</td>
<td style="text-align: center;"></td>
<td style="text-align: center;">a15wht10</td>
<td style="text-align: center;">a15wht12</td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>21</strong></td>
<td style="text-align: center;">A60ASN00</td>
<td style="text-align: center;"></td>
<td style="text-align: center;">a60asn10</td>
<td style="text-align: center;"></td>
</tr>
<tr class="odd">
<td style="text-align: center;"><strong>22</strong></td>
<td style="text-align: center;">A60BLK00</td>
<td style="text-align: center;"></td>
<td style="text-align: center;">a60blk10</td>
<td style="text-align: center;"></td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>23</strong></td>
<td style="text-align: center;">A60HSP00</td>
<td style="text-align: center;"></td>
<td style="text-align: center;">a60hsp10</td>
<td style="text-align: center;"></td>
</tr>
<tr class="odd">
<td style="text-align: center;"><strong>24</strong></td>
<td style="text-align: center;">A60NTV00</td>
<td style="text-align: center;"></td>
<td style="text-align: center;">a60ntv10</td>
<td style="text-align: center;"></td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>26</strong></td>
<td style="text-align: center;">A60WHT00</td>
<td style="text-align: center;"></td>
<td style="text-align: center;">a60wht10</td>
<td style="text-align: center;"></td>
</tr>
<tr class="odd">
<td style="text-align: center;"><strong>27</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;">a65asn12</td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>28</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;">a65blk12</td>
</tr>
<tr class="odd">
<td style="text-align: center;"><strong>29</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;">a65hsp12</td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>30</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;">a65ntv12</td>
</tr>
<tr class="odd">
<td style="text-align: center;"><strong>31</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;">a65wht12</td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>38</strong></td>
<td style="text-align: center;">AGEASN00</td>
<td style="text-align: center;"></td>
<td style="text-align: center;">ageasn10</td>
<td style="text-align: center;">ageasn12</td>
</tr>
<tr class="odd">
<td style="text-align: center;"><strong>39</strong></td>
<td style="text-align: center;">AGEBLK00</td>
<td style="text-align: center;"></td>
<td style="text-align: center;">ageblk10</td>
<td style="text-align: center;">ageblk12</td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>40</strong></td>
<td style="text-align: center;">AGEHSP00</td>
<td style="text-align: center;"></td>
<td style="text-align: center;">agehsp10</td>
<td style="text-align: center;">agehsp12</td>
</tr>
<tr class="odd">
<td style="text-align: center;"><strong>41</strong></td>
<td style="text-align: center;">AGENTV00</td>
<td style="text-align: center;"></td>
<td style="text-align: center;">agentv10</td>
<td style="text-align: center;">agentv12</td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>42</strong></td>
<td style="text-align: center;">AGEWHT00</td>
<td style="text-align: center;"></td>
<td style="text-align: center;">agewht10</td>
<td style="text-align: center;">agewht12</td>
</tr>
<tr class="odd">
<td style="text-align: center;"><strong>43</strong></td>
<td style="text-align: center;">ASIAN00</td>
<td style="text-align: center;"></td>
<td style="text-align: center;">asian10</td>
<td style="text-align: center;">asian12</td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>44</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
</tr>
<tr class="odd">
<td style="text-align: center;"><strong>50</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;">DAPOV00</td>
<td style="text-align: center;"></td>
<td style="text-align: center;">dapov12</td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>51</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;">DBPOV00</td>
<td style="text-align: center;"></td>
<td style="text-align: center;">dbpov12</td>
</tr>
<tr class="odd">
<td style="text-align: center;"><strong>55</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;">DHPOV00</td>
<td style="text-align: center;"></td>
<td style="text-align: center;">dhpov12</td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>58</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;">DNAPOV00</td>
<td style="text-align: center;"></td>
<td style="text-align: center;">dnapov12</td>
</tr>
<tr class="odd">
<td style="text-align: center;"><strong>60</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;">DWPOV00</td>
<td style="text-align: center;"></td>
<td style="text-align: center;">dwpov12</td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>71</strong></td>
<td style="text-align: center;">HAW00</td>
<td style="text-align: center;"></td>
<td style="text-align: center;">haw10</td>
<td style="text-align: center;">haw12</td>
</tr>
<tr class="odd">
<td style="text-align: center;"><strong>73</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;">HHA00</td>
<td style="text-align: center;"></td>
<td style="text-align: center;">hha12</td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>74</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;">HHB00</td>
<td style="text-align: center;"></td>
<td style="text-align: center;">hhb12</td>
</tr>
<tr class="odd">
<td style="text-align: center;"><strong>75</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;">HHH00</td>
<td style="text-align: center;"></td>
<td style="text-align: center;">hhh12</td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>76</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;">HHW00</td>
<td style="text-align: center;"></td>
<td style="text-align: center;">hhw12</td>
</tr>
<tr class="odd">
<td style="text-align: center;"><strong>78</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;">HINCA00</td>
<td style="text-align: center;"></td>
<td style="text-align: center;">hinca12</td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>79</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;">HINCB00</td>
<td style="text-align: center;"></td>
<td style="text-align: center;">hincb12</td>
</tr>
<tr class="odd">
<td style="text-align: center;"><strong>80</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;">HINCH00</td>
<td style="text-align: center;"></td>
<td style="text-align: center;">hinch12</td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>81</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;">HINCW00</td>
<td style="text-align: center;"></td>
<td style="text-align: center;">hincw12</td>
</tr>
<tr class="odd">
<td style="text-align: center;"><strong>82</strong></td>
<td style="text-align: center;">HISP00</td>
<td style="text-align: center;"></td>
<td style="text-align: center;">hisp10</td>
<td style="text-align: center;">hisp12</td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>90</strong></td>
<td style="text-align: center;">INDIA00</td>
<td style="text-align: center;"></td>
<td style="text-align: center;">india10</td>
<td style="text-align: center;">india12</td>
</tr>
<tr class="odd">
<td style="text-align: center;"><strong>108</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;">NAPOV00</td>
<td style="text-align: center;"></td>
<td style="text-align: center;">napov12</td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>110</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;">NBPOV00</td>
<td style="text-align: center;"></td>
<td style="text-align: center;">nbpov12</td>
</tr>
<tr class="odd">
<td style="text-align: center;"><strong>112</strong></td>
<td style="text-align: center;">NHBLK00</td>
<td style="text-align: center;"></td>
<td style="text-align: center;">nhblk10</td>
<td style="text-align: center;">nhblk12</td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>113</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;">NHPOV00</td>
<td style="text-align: center;"></td>
<td style="text-align: center;">nhpov12</td>
</tr>
<tr class="odd">
<td style="text-align: center;"><strong>114</strong></td>
<td style="text-align: center;">NHWHT00</td>
<td style="text-align: center;"></td>
<td style="text-align: center;">nhwht10</td>
<td style="text-align: center;">nhwht12</td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>115</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;">NNAPOV00</td>
<td style="text-align: center;"></td>
<td style="text-align: center;">nnapov12</td>
</tr>
<tr class="odd">
<td style="text-align: center;"><strong>117</strong></td>
<td style="text-align: center;">NTV00</td>
<td style="text-align: center;"></td>
<td style="text-align: center;">ntv10</td>
<td style="text-align: center;">ntv12</td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>118</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;">NWPOV00</td>
<td style="text-align: center;"></td>
<td style="text-align: center;">nwpov12</td>
</tr>
<tr class="odd">
<td style="text-align: center;"><strong>128</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;">p15asn12</td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>129</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;">p15blk12</td>
</tr>
<tr class="odd">
<td style="text-align: center;"><strong>130</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;">p15hsp12</td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>131</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;">p15ntv12</td>
</tr>
<tr class="odd">
<td style="text-align: center;"><strong>132</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;">p15wht12</td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>136</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;">p65asn12</td>
</tr>
<tr class="odd">
<td style="text-align: center;"><strong>137</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;">p65blk12</td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>138</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;">p65hsp12</td>
</tr>
<tr class="odd">
<td style="text-align: center;"><strong>139</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;">p65ntv12</td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>140</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;">p65pov12</td>
</tr>
<tr class="odd">
<td style="text-align: center;"><strong>141</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;">p65wht12</td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>143</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;">papov12</td>
</tr>
<tr class="odd">
<td style="text-align: center;"><strong>144</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;">pasian12</td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>145</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;">pbpov12</td>
</tr>
<tr class="odd">
<td style="text-align: center;"><strong>156</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;">phaw12</td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>157</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;">phisp12</td>
</tr>
<tr class="odd">
<td style="text-align: center;"><strong>158</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;">phpov12</td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>172</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;">pnapov12</td>
</tr>
<tr class="odd">
<td style="text-align: center;"><strong>174</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;">pnhblk12</td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>175</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;">pnhwht12</td>
</tr>
<tr class="odd">
<td style="text-align: center;"><strong>176</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;">pntv12</td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>199</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;">pwpov12</td>
</tr>
<tr class="odd">
<td style="text-align: center;"><strong>211</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
</tr>
</tbody>
</table>

    # search for variables containing the description "60 years and older"
    var_description(dd, "60 years and older")

    ## [1] "a60asn" "a60blk" "a60hsp" "a60ntv" "a60wht"

    # create a vector containing the time period (start, end)
    time_period <- c("1990","2000")

    # filter data to show all variables available for the time period 
    filter_time( dd, time_period) %>% pander()

<table>
<caption>Table continues below</caption>
<colgroup>
<col style="width: 13%" />
<col style="width: 24%" />
<col style="width: 45%" />
<col style="width: 16%" />
</colgroup>
<thead>
<tr class="header">
<th style="text-align: center;">root</th>
<th style="text-align: center;">category</th>
<th style="text-align: center;">definition</th>
<th style="text-align: center;">1990</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: center;">state</td>
<td style="text-align: center;">id</td>
<td style="text-align: center;">state</td>
<td style="text-align: center;">state</td>
</tr>
<tr class="even">
<td style="text-align: center;">county</td>
<td style="text-align: center;">id</td>
<td style="text-align: center;">county</td>
<td style="text-align: center;">county</td>
</tr>
<tr class="odd">
<td style="text-align: center;">tract</td>
<td style="text-align: center;">id</td>
<td style="text-align: center;">census tract</td>
<td style="text-align: center;">tract</td>
</tr>
<tr class="even">
<td style="text-align: center;">trtid</td>
<td style="text-align: center;">id</td>
<td style="text-align: center;">census tract (10 digit identifier)</td>
<td style="text-align: center;">TRTID10</td>
</tr>
<tr class="odd">
<td style="text-align: center;">cbsa</td>
<td style="text-align: center;">tract attribute</td>
<td style="text-align: center;">A core-based statistical area (CBSA) is a U.S. geographic area defined by the Office of Management and Budget (OMB) that consists of one or more counties (or equivalents) anchored by an urban center of at least 10,000 people plus adjacent counties that are socioeconomically tied to the urban center by commuting</td>
<td style="text-align: center;">cbsa10</td>
</tr>
<tr class="even">
<td style="text-align: center;">ccflag</td>
<td style="text-align: center;">tract attribute</td>
<td style="text-align: center;"></td>
<td style="text-align: center;">ccflag10</td>
</tr>
<tr class="odd">
<td style="text-align: center;">metdiv</td>
<td style="text-align: center;">tract attribute</td>
<td style="text-align: center;">Metropolitan Division</td>
<td style="text-align: center;">metdiv10</td>
</tr>
<tr class="even">
<td style="text-align: center;">placefp</td>
<td style="text-align: center;">tract attribute</td>
<td style="text-align: center;">5-character place FIPS code</td>
<td style="text-align: center;">placefp10</td>
</tr>
<tr class="odd">
<td style="text-align: center;">globd</td>
<td style="text-align: center;">tract attribute</td>
<td style="text-align: center;"></td>
<td style="text-align: center;">GlobD90</td>
</tr>
<tr class="even">
<td style="text-align: center;">globg</td>
<td style="text-align: center;">tract attribute</td>
<td style="text-align: center;"></td>
<td style="text-align: center;">GlobG90</td>
</tr>
<tr class="odd">
<td style="text-align: center;">placefp</td>
<td style="text-align: center;">tract attribute</td>
<td style="text-align: center;">5-character place FIPS code</td>
<td style="text-align: center;">placefp10</td>
</tr>
<tr class="even">
<td style="text-align: center;">cbsa</td>
<td style="text-align: center;">tract attribute</td>
<td style="text-align: center;">A core-based statistical area (CBSA) is a U.S. geographic area defined by the Office of Management and Budget (OMB) that consists of one or more counties (or equivalents) anchored by an urban center of at least 10,000 people plus adjacent counties that are socioeconomically tied to the urban center by commuting</td>
<td style="text-align: center;">cbsa10</td>
</tr>
<tr class="odd">
<td style="text-align: center;">metdiv</td>
<td style="text-align: center;">tract attribute</td>
<td style="text-align: center;">Metropolitan Division</td>
<td style="text-align: center;">metdiv10</td>
</tr>
<tr class="even">
<td style="text-align: center;">ccflag</td>
<td style="text-align: center;">tract attribute</td>
<td style="text-align: center;"></td>
<td style="text-align: center;">ccflag10</td>
</tr>
<tr class="odd">
<td style="text-align: center;">a15asn</td>
<td style="text-align: center;">age-race</td>
<td style="text-align: center;">0-15 years old of Asians and Pacific Islanders (in 1980, 0-14 years old of Asians/Pacific Islanders; in 2008-12 ACS, 0-14 years old of Asian/Pacific Islander race)</td>
<td style="text-align: center;">A15ASN90</td>
</tr>
<tr class="even">
<td style="text-align: center;">a15blk</td>
<td style="text-align: center;">age-race</td>
<td style="text-align: center;">0-15 years old of black race (in 1980, 0-14 years old of black race; in 2006- 10 ACS, 0-14 years old of black race)</td>
<td style="text-align: center;">A15BLK90</td>
</tr>
<tr class="odd">
<td style="text-align: center;">a15hsp</td>
<td style="text-align: center;">age-race</td>
<td style="text-align: center;">0-15 years old, persons of Hispanic origins (in 1980, 0-14 years old, persons of Hispanic origin; in 2008-12 ACS, 0-14 years old, persons of Hispanic origins)</td>
<td style="text-align: center;">A15HSP90</td>
</tr>
<tr class="even">
<td style="text-align: center;">a15ntv</td>
<td style="text-align: center;">age-race</td>
<td style="text-align: center;">0-15 years old of Native American race (in 1980, 0-14 years old of Native American race; in 2008-12 ACS, 0-14 years old of Native American race)</td>
<td style="text-align: center;">A15NTV90</td>
</tr>
<tr class="odd">
<td style="text-align: center;">a15wht</td>
<td style="text-align: center;">age-race</td>
<td style="text-align: center;">0-15 years old of white race (in 1980, 0-14 years old of white race; in 2006- 10 ACS, 0-14 years old of white race)</td>
<td style="text-align: center;">A15WHT90</td>
</tr>
<tr class="even">
<td style="text-align: center;">a18und</td>
<td style="text-align: center;">age</td>
<td style="text-align: center;">persons age 17 years and under</td>
<td style="text-align: center;">A18UND90</td>
</tr>
<tr class="odd">
<td style="text-align: center;">a60asn</td>
<td style="text-align: center;">age-race</td>
<td style="text-align: center;">60 years and older of Asians and Pacific Islanders</td>
<td style="text-align: center;">A60ASN90</td>
</tr>
<tr class="even">
<td style="text-align: center;">a60blk</td>
<td style="text-align: center;">age-race</td>
<td style="text-align: center;">60 years and older of black race</td>
<td style="text-align: center;">A60BLK90</td>
</tr>
<tr class="odd">
<td style="text-align: center;">a60hsp</td>
<td style="text-align: center;">age-race</td>
<td style="text-align: center;">60 years and older, persons of Hispanic origins</td>
<td style="text-align: center;">A60HSP90</td>
</tr>
<tr class="even">
<td style="text-align: center;">a60ntv</td>
<td style="text-align: center;">age-race</td>
<td style="text-align: center;">60 years and older of Native American race</td>
<td style="text-align: center;">A60NTV90</td>
</tr>
<tr class="odd">
<td style="text-align: center;">a60up</td>
<td style="text-align: center;">age</td>
<td style="text-align: center;">persons age 60 years and over</td>
<td style="text-align: center;">A60UP90</td>
</tr>
<tr class="even">
<td style="text-align: center;">a60wht</td>
<td style="text-align: center;">age-race</td>
<td style="text-align: center;">60 years and older of white race</td>
<td style="text-align: center;">A60WHT90</td>
</tr>
<tr class="odd">
<td style="text-align: center;">a75up</td>
<td style="text-align: center;">age</td>
<td style="text-align: center;">persons age 75 years and over</td>
<td style="text-align: center;">A75UP90</td>
</tr>
<tr class="even">
<td style="text-align: center;">ageasn</td>
<td style="text-align: center;">age-race</td>
<td style="text-align: center;">Asian and Pacific Islander population with known age distribution</td>
<td style="text-align: center;">AGEASN90</td>
</tr>
<tr class="odd">
<td style="text-align: center;">ageblk</td>
<td style="text-align: center;">age-race</td>
<td style="text-align: center;">black population with known age distribution</td>
<td style="text-align: center;">AGEBLK90</td>
</tr>
<tr class="even">
<td style="text-align: center;">agehsp</td>
<td style="text-align: center;">age-race</td>
<td style="text-align: center;">Hispanic population with known age distribution</td>
<td style="text-align: center;">AGEHSP90</td>
</tr>
<tr class="odd">
<td style="text-align: center;">agentv</td>
<td style="text-align: center;">age-race</td>
<td style="text-align: center;">Native American population with known age distribution</td>
<td style="text-align: center;">AGENTV90</td>
</tr>
<tr class="even">
<td style="text-align: center;">agewht</td>
<td style="text-align: center;">age-race</td>
<td style="text-align: center;">white population with known age distribution</td>
<td style="text-align: center;">AGEWHT90</td>
</tr>
<tr class="odd">
<td style="text-align: center;">asian</td>
<td style="text-align: center;">race</td>
<td style="text-align: center;">persons of Asian race (and Pacific Islander)</td>
<td style="text-align: center;">ASIAN90</td>
</tr>
<tr class="even">
<td style="text-align: center;">china</td>
<td style="text-align: center;">ethnicity</td>
<td style="text-align: center;">persons of Chinese race</td>
<td style="text-align: center;">CHINA90</td>
</tr>
<tr class="odd">
<td style="text-align: center;">cuban</td>
<td style="text-align: center;">ethnicity</td>
<td style="text-align: center;">Cubans</td>
<td style="text-align: center;">CUBAN90</td>
</tr>
<tr class="even">
<td style="text-align: center;">filip</td>
<td style="text-align: center;">ethnicity</td>
<td style="text-align: center;">persons of Filipino race</td>
<td style="text-align: center;">FILIP90</td>
</tr>
<tr class="odd">
<td style="text-align: center;">haw</td>
<td style="text-align: center;">race</td>
<td style="text-align: center;">persons of Hawaiian race</td>
<td style="text-align: center;">HAW90</td>
</tr>
<tr class="even">
<td style="text-align: center;">hisp</td>
<td style="text-align: center;">race</td>
<td style="text-align: center;">persons of Hispanic origin</td>
<td style="text-align: center;">HISP90</td>
</tr>
<tr class="odd">
<td style="text-align: center;">hu</td>
<td style="text-align: center;">housing</td>
<td style="text-align: center;">housing units</td>
<td style="text-align: center;">HU90</td>
</tr>
<tr class="even">
<td style="text-align: center;">india</td>
<td style="text-align: center;">race</td>
<td style="text-align: center;">persons of Asian Indian race</td>
<td style="text-align: center;">INDIA90</td>
</tr>
<tr class="odd">
<td style="text-align: center;">japan</td>
<td style="text-align: center;">ethnicity</td>
<td style="text-align: center;">persons of Japanese race</td>
<td style="text-align: center;">JAPAN90</td>
</tr>
<tr class="even">
<td style="text-align: center;">korea</td>
<td style="text-align: center;">ethnicity</td>
<td style="text-align: center;">persons of Korean race</td>
<td style="text-align: center;">KOREA90</td>
</tr>
<tr class="odd">
<td style="text-align: center;">mex</td>
<td style="text-align: center;">ethnicity</td>
<td style="text-align: center;">Mexicans</td>
<td style="text-align: center;">MEX90</td>
</tr>
<tr class="even">
<td style="text-align: center;">nhblk</td>
<td style="text-align: center;">race</td>
<td style="text-align: center;">persons of black race, not Hispanic origin</td>
<td style="text-align: center;">NHBLK90</td>
</tr>
<tr class="odd">
<td style="text-align: center;">nhwht</td>
<td style="text-align: center;">race</td>
<td style="text-align: center;">persons of white race, not Hispanic origin</td>
<td style="text-align: center;">NHWHT90</td>
</tr>
<tr class="even">
<td style="text-align: center;">ntv</td>
<td style="text-align: center;">race</td>
<td style="text-align: center;">persons of Native American race</td>
<td style="text-align: center;">NTV90</td>
</tr>
<tr class="odd">
<td style="text-align: center;">ohu</td>
<td style="text-align: center;">housing</td>
<td style="text-align: center;">occupied housing units</td>
<td style="text-align: center;">OHU90</td>
</tr>
<tr class="even">
<td style="text-align: center;">own</td>
<td style="text-align: center;">housing</td>
<td style="text-align: center;">owner-occupied housing units</td>
<td style="text-align: center;">OWN90</td>
</tr>
<tr class="odd">
<td style="text-align: center;">pop</td>
<td style="text-align: center;">demographics</td>
<td style="text-align: center;">total population</td>
<td style="text-align: center;">POP90</td>
</tr>
<tr class="even">
<td style="text-align: center;">pr</td>
<td style="text-align: center;">ethnicity</td>
<td style="text-align: center;">Puerto Ricans</td>
<td style="text-align: center;">PR90</td>
</tr>
<tr class="odd">
<td style="text-align: center;">rent</td>
<td style="text-align: center;">housing</td>
<td style="text-align: center;">renter-occupied housing units</td>
<td style="text-align: center;">RENT90</td>
</tr>
<tr class="even">
<td style="text-align: center;">vac</td>
<td style="text-align: center;">housing</td>
<td style="text-align: center;">vacant housing units</td>
<td style="text-align: center;">VAC90</td>
</tr>
<tr class="odd">
<td style="text-align: center;">viet</td>
<td style="text-align: center;">ethnicity</td>
<td style="text-align: center;">persons of Vietnamese race</td>
<td style="text-align: center;">VIET90</td>
</tr>
</tbody>
</table>

<table style="width:17%;">
<colgroup>
<col style="width: 16%" />
</colgroup>
<thead>
<tr class="header">
<th style="text-align: center;">2000</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: center;">state</td>
</tr>
<tr class="even">
<td style="text-align: center;">county</td>
</tr>
<tr class="odd">
<td style="text-align: center;">tract</td>
</tr>
<tr class="even">
<td style="text-align: center;">TRTID10</td>
</tr>
<tr class="odd">
<td style="text-align: center;">cbsa10</td>
</tr>
<tr class="even">
<td style="text-align: center;">ccflag10</td>
</tr>
<tr class="odd">
<td style="text-align: center;">metdiv10</td>
</tr>
<tr class="even">
<td style="text-align: center;">placefp10</td>
</tr>
<tr class="odd">
<td style="text-align: center;">GlobD00</td>
</tr>
<tr class="even">
<td style="text-align: center;">GlobG00</td>
</tr>
<tr class="odd">
<td style="text-align: center;">placefp10</td>
</tr>
<tr class="even">
<td style="text-align: center;">cbsa10</td>
</tr>
<tr class="odd">
<td style="text-align: center;">metdiv10</td>
</tr>
<tr class="even">
<td style="text-align: center;">ccflag10</td>
</tr>
<tr class="odd">
<td style="text-align: center;">A15ASN00</td>
</tr>
<tr class="even">
<td style="text-align: center;">A15BLK00</td>
</tr>
<tr class="odd">
<td style="text-align: center;">A15HSP00</td>
</tr>
<tr class="even">
<td style="text-align: center;">A15NTV00</td>
</tr>
<tr class="odd">
<td style="text-align: center;">A15WHT00</td>
</tr>
<tr class="even">
<td style="text-align: center;">A18UND00</td>
</tr>
<tr class="odd">
<td style="text-align: center;">A60ASN00</td>
</tr>
<tr class="even">
<td style="text-align: center;">A60BLK00</td>
</tr>
<tr class="odd">
<td style="text-align: center;">A60HSP00</td>
</tr>
<tr class="even">
<td style="text-align: center;">A60NTV00</td>
</tr>
<tr class="odd">
<td style="text-align: center;">A60UP00</td>
</tr>
<tr class="even">
<td style="text-align: center;">A60WHT00</td>
</tr>
<tr class="odd">
<td style="text-align: center;">A75UP00</td>
</tr>
<tr class="even">
<td style="text-align: center;">AGEASN00</td>
</tr>
<tr class="odd">
<td style="text-align: center;">AGEBLK00</td>
</tr>
<tr class="even">
<td style="text-align: center;">AGEHSP00</td>
</tr>
<tr class="odd">
<td style="text-align: center;">AGENTV00</td>
</tr>
<tr class="even">
<td style="text-align: center;">AGEWHT00</td>
</tr>
<tr class="odd">
<td style="text-align: center;">ASIAN00</td>
</tr>
<tr class="even">
<td style="text-align: center;">CHINA00</td>
</tr>
<tr class="odd">
<td style="text-align: center;">CUBAN00</td>
</tr>
<tr class="even">
<td style="text-align: center;">FILIP00</td>
</tr>
<tr class="odd">
<td style="text-align: center;">HAW00</td>
</tr>
<tr class="even">
<td style="text-align: center;">HISP00</td>
</tr>
<tr class="odd">
<td style="text-align: center;">HU00</td>
</tr>
<tr class="even">
<td style="text-align: center;">INDIA00</td>
</tr>
<tr class="odd">
<td style="text-align: center;">JAPAN00</td>
</tr>
<tr class="even">
<td style="text-align: center;">KOREA00</td>
</tr>
<tr class="odd">
<td style="text-align: center;">MEX00</td>
</tr>
<tr class="even">
<td style="text-align: center;">NHBLK00</td>
</tr>
<tr class="odd">
<td style="text-align: center;">NHWHT00</td>
</tr>
<tr class="even">
<td style="text-align: center;">NTV00</td>
</tr>
<tr class="odd">
<td style="text-align: center;">OHU00</td>
</tr>
<tr class="even">
<td style="text-align: center;">OWN00</td>
</tr>
<tr class="odd">
<td style="text-align: center;">POP00</td>
</tr>
<tr class="even">
<td style="text-align: center;">PR00</td>
</tr>
<tr class="odd">
<td style="text-align: center;">RENT00</td>
</tr>
<tr class="even">
<td style="text-align: center;">VAC00</td>
</tr>
<tr class="odd">
<td style="text-align: center;">VIET00</td>
</tr>
</tbody>
</table>

    time_period <- c("1980")

    filter_time( dd, time_period) %>% pander()

<table>
<colgroup>
<col style="width: 13%" />
<col style="width: 24%" />
<col style="width: 45%" />
<col style="width: 16%" />
</colgroup>
<thead>
<tr class="header">
<th style="text-align: center;">root</th>
<th style="text-align: center;">category</th>
<th style="text-align: center;">definition</th>
<th style="text-align: center;">1980</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: center;">state</td>
<td style="text-align: center;">id</td>
<td style="text-align: center;">state</td>
<td style="text-align: center;">state</td>
</tr>
<tr class="even">
<td style="text-align: center;">county</td>
<td style="text-align: center;">id</td>
<td style="text-align: center;">county</td>
<td style="text-align: center;">county</td>
</tr>
<tr class="odd">
<td style="text-align: center;">tract</td>
<td style="text-align: center;">id</td>
<td style="text-align: center;">census tract</td>
<td style="text-align: center;">tract</td>
</tr>
<tr class="even">
<td style="text-align: center;">trtid</td>
<td style="text-align: center;">id</td>
<td style="text-align: center;">census tract (10 digit identifier)</td>
<td style="text-align: center;">TRTID10</td>
</tr>
<tr class="odd">
<td style="text-align: center;">cbsa</td>
<td style="text-align: center;">tract attribute</td>
<td style="text-align: center;">A core-based statistical area (CBSA) is a U.S. geographic area defined by the Office of Management and Budget (OMB) that consists of one or more counties (or equivalents) anchored by an urban center of at least 10,000 people plus adjacent counties that are socioeconomically tied to the urban center by commuting</td>
<td style="text-align: center;">cbsa10</td>
</tr>
<tr class="even">
<td style="text-align: center;">ccflag</td>
<td style="text-align: center;">tract attribute</td>
<td style="text-align: center;"></td>
<td style="text-align: center;">ccflag10</td>
</tr>
<tr class="odd">
<td style="text-align: center;">metdiv</td>
<td style="text-align: center;">tract attribute</td>
<td style="text-align: center;">Metropolitan Division</td>
<td style="text-align: center;">metdiv10</td>
</tr>
<tr class="even">
<td style="text-align: center;">placefp</td>
<td style="text-align: center;">tract attribute</td>
<td style="text-align: center;">5-character place FIPS code</td>
<td style="text-align: center;">placefp10</td>
</tr>
<tr class="odd">
<td style="text-align: center;">globd</td>
<td style="text-align: center;">tract attribute</td>
<td style="text-align: center;"></td>
<td style="text-align: center;">GlobD80</td>
</tr>
<tr class="even">
<td style="text-align: center;">globg</td>
<td style="text-align: center;">tract attribute</td>
<td style="text-align: center;"></td>
<td style="text-align: center;">GlobG80</td>
</tr>
<tr class="odd">
<td style="text-align: center;">placefp</td>
<td style="text-align: center;">tract attribute</td>
<td style="text-align: center;">5-character place FIPS code</td>
<td style="text-align: center;">placefp10</td>
</tr>
<tr class="even">
<td style="text-align: center;">cbsa</td>
<td style="text-align: center;">tract attribute</td>
<td style="text-align: center;">A core-based statistical area (CBSA) is a U.S. geographic area defined by the Office of Management and Budget (OMB) that consists of one or more counties (or equivalents) anchored by an urban center of at least 10,000 people plus adjacent counties that are socioeconomically tied to the urban center by commuting</td>
<td style="text-align: center;">cbsa10</td>
</tr>
<tr class="odd">
<td style="text-align: center;">metdiv</td>
<td style="text-align: center;">tract attribute</td>
<td style="text-align: center;">Metropolitan Division</td>
<td style="text-align: center;">metdiv10</td>
</tr>
<tr class="even">
<td style="text-align: center;">ccflag</td>
<td style="text-align: center;">tract attribute</td>
<td style="text-align: center;"></td>
<td style="text-align: center;">ccflag10</td>
</tr>
<tr class="odd">
<td style="text-align: center;">a18und</td>
<td style="text-align: center;">age</td>
<td style="text-align: center;">persons age 17 years and under</td>
<td style="text-align: center;">A18UND80</td>
</tr>
<tr class="even">
<td style="text-align: center;">a60up</td>
<td style="text-align: center;">age</td>
<td style="text-align: center;">persons age 60 years and over</td>
<td style="text-align: center;">A60UP80</td>
</tr>
<tr class="odd">
<td style="text-align: center;">a75up</td>
<td style="text-align: center;">age</td>
<td style="text-align: center;">persons age 75 years and over</td>
<td style="text-align: center;">A75UP80</td>
</tr>
<tr class="even">
<td style="text-align: center;">ag15up</td>
<td style="text-align: center;">age</td>
<td style="text-align: center;">population 15 years and over (in 1970, population 14 years and over)</td>
<td style="text-align: center;">AG15UP80</td>
</tr>
<tr class="odd">
<td style="text-align: center;">asian</td>
<td style="text-align: center;">race</td>
<td style="text-align: center;">persons of Asian race (and Pacific Islander)</td>
<td style="text-align: center;">ASIAN80</td>
</tr>
<tr class="even">
<td style="text-align: center;">china</td>
<td style="text-align: center;">ethnicity</td>
<td style="text-align: center;">persons of Chinese race</td>
<td style="text-align: center;">CHINA80</td>
</tr>
<tr class="odd">
<td style="text-align: center;">cuban</td>
<td style="text-align: center;">ethnicity</td>
<td style="text-align: center;">Cubans</td>
<td style="text-align: center;">CUBAN80</td>
</tr>
<tr class="even">
<td style="text-align: center;">filip</td>
<td style="text-align: center;">ethnicity</td>
<td style="text-align: center;">persons of Filipino race</td>
<td style="text-align: center;">FILIP80</td>
</tr>
<tr class="odd">
<td style="text-align: center;">haw</td>
<td style="text-align: center;">race</td>
<td style="text-align: center;">persons of Hawaiian race</td>
<td style="text-align: center;">HAW80</td>
</tr>
<tr class="even">
<td style="text-align: center;">hisp</td>
<td style="text-align: center;">race</td>
<td style="text-align: center;">persons of Hispanic origin</td>
<td style="text-align: center;">HISP80</td>
</tr>
<tr class="odd">
<td style="text-align: center;">hu</td>
<td style="text-align: center;">housing</td>
<td style="text-align: center;">housing units</td>
<td style="text-align: center;">HU80</td>
</tr>
<tr class="even">
<td style="text-align: center;">india</td>
<td style="text-align: center;">race</td>
<td style="text-align: center;">persons of Asian Indian race</td>
<td style="text-align: center;">INDIA80</td>
</tr>
<tr class="odd">
<td style="text-align: center;">japan</td>
<td style="text-align: center;">ethnicity</td>
<td style="text-align: center;">persons of Japanese race</td>
<td style="text-align: center;">JAPAN80</td>
</tr>
<tr class="even">
<td style="text-align: center;">korea</td>
<td style="text-align: center;">ethnicity</td>
<td style="text-align: center;">persons of Korean race</td>
<td style="text-align: center;">KOREA80</td>
</tr>
<tr class="odd">
<td style="text-align: center;">mar</td>
<td style="text-align: center;">marital</td>
<td style="text-align: center;">currently married (excluding separated)</td>
<td style="text-align: center;">Mar-80</td>
</tr>
<tr class="even">
<td style="text-align: center;">mex</td>
<td style="text-align: center;">ethnicity</td>
<td style="text-align: center;">Mexicans</td>
<td style="text-align: center;">MEX80</td>
</tr>
<tr class="odd">
<td style="text-align: center;">mhmval</td>
<td style="text-align: center;">ses</td>
<td style="text-align: center;">Median home value</td>
<td style="text-align: center;">MHMVAL80</td>
</tr>
<tr class="even">
<td style="text-align: center;">mrent</td>
<td style="text-align: center;">ses</td>
<td style="text-align: center;">Median monthly contract rent</td>
<td style="text-align: center;">MRENT80</td>
</tr>
<tr class="odd">
<td style="text-align: center;">nhblk</td>
<td style="text-align: center;">race</td>
<td style="text-align: center;">persons of black race, not Hispanic origin</td>
<td style="text-align: center;">NHBLK80</td>
</tr>
<tr class="even">
<td style="text-align: center;">nhwht</td>
<td style="text-align: center;">race</td>
<td style="text-align: center;">persons of white race, not Hispanic origin</td>
<td style="text-align: center;">NHWHT80</td>
</tr>
<tr class="odd">
<td style="text-align: center;">ntv</td>
<td style="text-align: center;">race</td>
<td style="text-align: center;">persons of Native American race</td>
<td style="text-align: center;">NTV80</td>
</tr>
<tr class="even">
<td style="text-align: center;">ohu</td>
<td style="text-align: center;">housing</td>
<td style="text-align: center;">occupied housing units</td>
<td style="text-align: center;">OHU80</td>
</tr>
<tr class="odd">
<td style="text-align: center;">own</td>
<td style="text-align: center;">housing</td>
<td style="text-align: center;">owner-occupied housing units</td>
<td style="text-align: center;">OWN80</td>
</tr>
<tr class="even">
<td style="text-align: center;">pop</td>
<td style="text-align: center;">demographics</td>
<td style="text-align: center;">total population</td>
<td style="text-align: center;">POP80</td>
</tr>
<tr class="odd">
<td style="text-align: center;">pr</td>
<td style="text-align: center;">ethnicity</td>
<td style="text-align: center;">Puerto Ricans</td>
<td style="text-align: center;">PR80</td>
</tr>
<tr class="even">
<td style="text-align: center;">rent</td>
<td style="text-align: center;">housing</td>
<td style="text-align: center;">renter-occupied housing units</td>
<td style="text-align: center;">RENT80</td>
</tr>
<tr class="odd">
<td style="text-align: center;">vac</td>
<td style="text-align: center;">housing</td>
<td style="text-align: center;">vacant housing units</td>
<td style="text-align: center;">VAC80</td>
</tr>
<tr class="even">
<td style="text-align: center;">viet</td>
<td style="text-align: center;">ethnicity</td>
<td style="text-align: center;">persons of Vietnamese race</td>
<td style="text-align: center;">VIET80</td>
</tr>
<tr class="odd">
<td style="text-align: center;">wds</td>
<td style="text-align: center;">marital</td>
<td style="text-align: center;">widowed, divorced, and separated</td>
<td style="text-align: center;">WDS80</td>
</tr>
</tbody>
</table>
