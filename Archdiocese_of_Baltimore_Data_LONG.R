###########################################################################
###
### R Syntax for production of Archdiocese of Baltimore Long file
###
###########################################################################

### Load SGP Package

require(SGP)


### Load base data files

AOB_2007 <- read.delim("Data/Base_Files/Dr. B Final 2007.txt")
AOB_2008 <- read.delim("Data/Base_Files/Dr. B Final 2008.txt")
AOB_2009 <- read.delim("Data/Base_Files/Dr. B Final 2009 with PIE.txt")
AOB_2010 <- read.delim("Data/Base_Files/Dr. B Final 2010 with PIE.txt")
AOB_2011 <- read.delim("Data/Base_Files/Dr. B Final 2011 with PIE.txt")
AOB_2010_GRADE_3 <- read.delim("Data/Base_Files/Dr. B 2010 Grade 3.txt")
AOB_2011_GRADE_3 <- read.delim("Data/Base_Files/Dr. B 2011 grade 3.txt")
AOB_2011_GRADE_4 <- read.delim("Data/Base_Files/Dr. B 2011 grade 4.txt")
AOB_2007_GRADE_6 <- read.delim("Data/Base_Files/Grade 6 2007 Dr. B.txt")
AOB_2008_GRADE_7 <- read.delim("Data/Base_Files/Grade 7 2008 Dr. B.txt")
AOB_2009_GRADE_8 <- read.delim("Data/Base_Files/Grade 8 2009 Dr. B.txt")

### Tidy up data

AOB_2008$X <- AOB_2010$X <- AOB_2011$X <- AOB_2010_GRADE_3$X <- AOB_2011_GRADE_4$X <- NULL


names(AOB_2010_GRADE_3)[7] <- "SS"
names(AOB_2011_GRADE_4)[12] <- "PIE"

AOB_Names <- c("LAST_NAME", "FIRST_NAME", "ID", "GENDER", "ETHNICITY", "TEACHER", "SCALE_SCORE", 
	"GRADE", "CONTENT_AREA", "SCHOOL_NUMBER", "SCHOOL_NAME", "PIE", "TITLE_I_STATUS")


names(AOB_2007) <- names(AOB_2008) <- names(AOB_2009) <- names(AOB_2010) <- names(AOB_2011) <- AOB_Names
names(AOB_2010_GRADE_3) <- names(AOB_2011_GRADE_3) <- names(AOB_2011_GRADE_4) <- names(AOB_2007_GRADE_6) <- names(AOB_2008_GRADE_7) <- names(AOB_2009_GRADE_8) <- head(AOB_Names, -1)

### ID

AOB_2007_GRADE_6$ID <- as.integer(as.character(AOB_2007_GRADE_6$ID))
AOB_2008_GRADE_7$ID <- as.integer(as.character(AOB_2008_GRADE_7$ID))


### GENDER

AOB_2007$GENDER[AOB_2007$GENDER=="U"] <- NA
AOB_2007$GENDER <- factor(AOB_2007$GENDER)
levels(AOB_2007$GENDER) <- c("Female", "Male")

AOB_2008$GENDER[AOB_2008$GENDER=="U"] <- NA
AOB_2008$GENDER <- factor(AOB_2008$GENDER)
levels(AOB_2008$GENDER) <- c("Female", "Male")

AOB_2009$GENDER[AOB_2009$GENDER==""] <- NA
AOB_2009$GENDER <- factor(AOB_2009$GENDER)
levels(AOB_2009$GENDER) <- c("Female", "Male")

AOB_2010$GENDER[!AOB_2010$GENDER %in% c("Female", "Male")] <- NA
AOB_2010$GENDER <- factor(AOB_2010$GENDER)

AOB_2011$GENDER[AOB_2011$GENDER==""] <- NA
AOB_2011$GENDER <- factor(AOB_2011$GENDER)
levels(AOB_2011$GENDER) <- c("Female", "Male")

AOB_2010_GRADE_3$GENDER[AOB_2010_GRADE_3$GENDER==""] <- NA
AOB_2010_GRADE_3$GENDER <- factor(AOB_2010_GRADE_3$GENDER)

AOB_2011_GRADE_3$GENDER[AOB_2011_GRADE_3$GENDER==""] <- NA
AOB_2011_GRADE_3$GENDER <- factor(AOB_2011_GRADE_3$GENDER)

AOB_2007_GRADE_6$GENDER[AOB_2007_GRADE_6$GENDER==""] <- NA
AOB_2007_GRADE_6$GENDER <- factor(AOB_2007_GRADE_6$GENDER)

AOB_2008_GRADE_7$GENDER[AOB_2008_GRADE_7$GENDER==""] <- NA
AOB_2008_GRADE_7$GENDER <- factor(AOB_2008_GRADE_7$GENDER)

AOB_2009_GRADE_8$GENDER[AOB_2009_GRADE_8$GENDER==""] <- NA
AOB_2009_GRADE_8$GENDER <- factor(AOB_2009_GRADE_8$GENDER)


### ETHNICITY

levels(AOB_2007$ETHNICITY) <- c("Asian", "Black/African American", "Hispanic/Latino", "American Indian/Alaskan", "Other", "White")
levels(AOB_2008$ETHNICITY) <- c("Asian", "Black/African American", "Hispanic/Latino", "American Indian/Alaskan", "Other", "White")

AOB_2009$ETHNICITY[AOB_2009$ETHNICITY==""] <- NA
AOB_2009$ETHNICITY <- factor(AOB_2009$ETHNICITY)
levels(AOB_2009$ETHNICITY) <- c("Asian", "Black/African American", "Hispanic/Latino", "American Indian/Alaskan", 
	"Multiple Ethnicites", "Other", "Hawaiian/Pacific Islander", "White")

AOB_2010$ETHNICITY[AOB_2010$ETHNICITY==""] <- NA
AOB_2010$ETHNICITY <- factor(AOB_2010$ETHNICITY)
levels(AOB_2010$ETHNICITY) <- c("American Indian/Alaskan Native", "Asian", "Black/African American", "Hawaiian/Pacific Islander", "Hispanic/Latino", 
	"Multiple Ethnicites", "Other", "White")

AOB_2011$ETHNICITY[AOB_2011$ETHNICITY==""] <- NA
AOB_2011$ETHNICITY <- factor(AOB_2011$ETHNICITY)
levels(AOB_2011$ETHNICITY) <- c("Asian", "Black/African American", "Hispanic/Latino", "American Indian/Alaskan", 
	"Multiple Ethnicites", "Other", "White")

AOB_2010_GRADE_3$ETHNICITY[AOB_2010_GRADE_3$ETHNICITY==""] <- NA
AOB_2010_GRADE_3$ETHNICITY <- factor(AOB_2010_GRADE_3$ETHNICITY)
levels(AOB_2010_GRADE_3$ETHNICITY) <- c("American Indian/Alaskan Native", "Asian", "Black/African American", "Hispanic/Latino", 
	"Multiple Ethnicites", "Other", "White")

AOB_2011_GRADE_3$ETHNICITY[AOB_2011_GRADE_3$ETHNICITY==""] <- NA
AOB_2011_GRADE_3$ETHNICITY <- factor(AOB_2011_GRADE_3$ETHNICITY)
levels(AOB_2011_GRADE_3$ETHNICITY) <- c("American Indian/Alaskan Native", "Asian", "Black/African American", "Hispanic/Latino", 
	"Multiple Ethnicites", "Other", "White")

AOB_2011_GRADE_4$ETHNICITY[AOB_2011_GRADE_4$ETHNICITY==""] <- NA
AOB_2011_GRADE_4$ETHNICITY <- factor(AOB_2011_GRADE_4$ETHNICITY)
levels(AOB_2011_GRADE_4$ETHNICITY) <- c("American Indian/Alaskan Native", "Asian", "Black/African American", "Hispanic/Latino", 
	"Multiple Ethnicites", "Other", "White")

AOB_2007_GRADE_6$ETHNICITY[AOB_2007_GRADE_6$ETHNICITY==""] <- NA
AOB_2007_GRADE_6$ETHNICITY <- factor(AOB_2007_GRADE_6$ETHNICITY)
levels(AOB_2007_GRADE_6$ETHNICITY) <- c("American Indian/Alaskan Native", "Asian", "Black/African American", "Hawaiian/Pacific Islander",
	"Hispanic/Latino", "Multiple Ethnicites", "Other", "White")

AOB_2008_GRADE_7$ETHNICITY[AOB_2008_GRADE_7$ETHNICITY==""] <- NA
AOB_2008_GRADE_7$ETHNICITY <- factor(AOB_2008_GRADE_7$ETHNICITY)
levels(AOB_2008_GRADE_7$ETHNICITY) <- c("American Indian/Alaskan Native", "Asian", "Black/African American", "Hawaiian/Pacific Islander",
	"Hispanic/Latino", "Multiple Ethnicites", "Other", "White")

AOB_2009_GRADE_8$ETHNICITY[AOB_2009_GRADE_8$ETHNICITY==""] <- NA
AOB_2009_GRADE_8$ETHNICITY <- factor(AOB_2009_GRADE_8$ETHNICITY)
levels(AOB_2009_GRADE_8$ETHNICITY) <- c("American Indian/Alaskan Native", "Asian", "Black/African American", "Hawaiian/Pacific Islander",
	"Hispanic/Latino", "Multiple Ethnicites", "Other", "White")


### SCALE SCORE

AOB_2007$SCALE_SCORE <- as.numeric(as.character(AOB_2007$SCALE_SCORE))
AOB_2008$SCALE_SCORE <- as.numeric(as.character(AOB_2008$SCALE_SCORE))
AOB_2009$SCALE_SCORE <- as.numeric(as.character(AOB_2009$SCALE_SCORE))
AOB_2010$SCALE_SCORE <- as.numeric(as.character(AOB_2010$SCALE_SCORE))
AOB_2011$SCALE_SCORE <- as.numeric(as.character(AOB_2011$SCALE_SCORE))
AOB_2010_GRADE_3$SCALE_SCORE <- as.numeric(as.character(AOB_2010_GRADE_3$SCALE_SCORE))
AOB_2011_GRADE_3$SCALE_SCORE <- as.numeric(as.character(AOB_2011_GRADE_3$SCALE_SCORE))
AOB_2011_GRADE_4$SCALE_SCORE <- as.numeric(as.character(AOB_2011_GRADE_4$SCALE_SCORE))
AOB_2007_GRADE_6$SCALE_SCORE <- as.numeric(as.character(AOB_2007_GRADE_6$SCALE_SCORE))
AOB_2008_GRADE_7$SCALE_SCORE <- as.numeric(as.character(AOB_2008_GRADE_7$SCALE_SCORE))
AOB_2009_GRADE_8$SCALE_SCORE <- as.numeric(as.character(AOB_2009_GRADE_8$SCALE_SCORE))


### Create YEAR

AOB_2007$YEAR <- 2007
AOB_2008$YEAR <- 2008
AOB_2009$YEAR <- 2009
AOB_2010$YEAR <- 2010
AOB_2011$YEAR <- 2011
AOB_2010_GRADE_3$YEAR <- 2010
AOB_2011_GRADE_3$YEAR <- 2011
AOB_2011_GRADE_4$YEAR <- 2011
AOB_2007_GRADE_6$YEAR <- 2007
AOB_2008_GRADE_7$YEAR <- 2008
AOB_2009_GRADE_8$YEAR <- 2009


### CONTENT_AREA

levels(AOB_2007$CONTENT_AREA)[2] <- "Language"


### rbind.fill

AOB_Data_LONG <- rbind.fill(AOB_2007, AOB_2008, AOB_2009, AOB_2010, AOB_2011, AOB_2010_GRADE_3, AOB_2011_GRADE_3, AOB_2011_GRADE_4,
				AOB_2007_GRADE_6, AOB_2008_GRADE_7, AOB_2009_GRADE_8)


### Last bit of tidying up

levels(AOB_Data_LONG$CONTENT_AREA) <- toupper(levels(AOB_Data_LONG$CONTENT_AREA))
levels(AOB_Data_LONG$CONTENT_AREA)[2] <- "MATHEMATICS"

AOB_Data_LONG$ID <- as.factor(AOB_Data_LONG$ID)

AOB_Data_LONG$TITLE_I_STATUS <- NULL

AOB_Data_LONG$PIE[is.na(AOB_Data_LONG$PIE)] <- 2
AOB_Data_LONG$PIE <- factor(AOB_Data_LONG$PIE, levels=1:2, labels=c("PIE: Yes", "PIE: No"))
AOB_Data_LONG$YEAR <- as.integer(AOB_Data_LONG$YEAR)

names(AOB_Data_LONG)[6] <- "INSTRUCTOR_NAME"

AOB_Data_LONG$SCHOOL_ENROLLMENT_STATUS <- factor(1, levels=1:2, labels=c("Enrolled School: Yes", "Enrolled School: No"))
AOB_Data_LONG$DISTRICT_NUMBER <- 1L
AOB_Data_LONG$DISTRICT_NAME <- as.factor("Archdiocese of Baltimore")


### Create VALID_CASE variable and invalidate cases as necessary

AOB_Data_LONG$VALID_CASE <- factor(1, levels=1:2, labels=c("VALID_CASE", "INVALID_CASE"))
AOB_Data_LONG <- as.data.table(AOB_Data_LONG)
setkeyv(AOB_Data_LONG, c("VALID_CASE", "CONTENT_AREA", "YEAR", "ID", "GRADE", "SCALE_SCORE"))
setkeyv(AOB_Data_LONG, c("VALID_CASE", "CONTENT_AREA", "YEAR", "ID"))
AOB_Data_LONG[["VALID_CASE"]][which(duplicated(AOB_Data_LONG))-1] <- "INVALID_CASE"
AOB_Data_LONG <- as.data.frame(AOB_Data_LONG)

### Reorder names

name.order <- c("VALID_CASE", "YEAR", "CONTENT_AREA", "ID", "LAST_NAME", "FIRST_NAME", "GRADE", "DISTRICT_NUMBER", "DISTRICT_NAME", "SCHOOL_NUMBER", "SCHOOL_NAME", "INSTRUCTOR_NAME", "SCALE_SCORE", 
	"GENDER", "ETHNICITY", "PIE", "SCHOOL_ENROLLMENT_STATUS")

AOB_Data_LONG <- AOB_Data_LONG[,name.order]


### Save result

save(AOB_Data_LONG, file="Data/AOB_Data_LONG.Rdata")
