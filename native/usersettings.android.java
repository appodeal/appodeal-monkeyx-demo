import com.appodeal.ads.UserSettings;

class BBUserSettings {
    
    private UserSettings settings;
    private UserSettings.Alcohol alcoholArr[] = {UserSettings.Alcohol.NEUTRAL, UserSettings.Alcohol.NEGATIVE, UserSettings.Alcohol.POSITIVE};
    private UserSettings.Gender genderArr[] = {UserSettings.Gender.FEMALE, UserSettings.Gender.MALE, UserSettings.Gender.OTHER};
    private UserSettings.Occupation occupationArr[] = {UserSettings.Occupation.OTHER, UserSettings.Occupation.SCHOOL, UserSettings.Occupation.UNIVERSITY, UserSettings.Occupation.WORK};
    private UserSettings.Relation relationArr[] = {UserSettings.Relation.DATING, UserSettings.Relation.ENGAGED, UserSettings.Relation.MARRIED, UserSettings.Relation.OTHER, UserSettings.Relation.SEARCHING, UserSettings.Relation.SINGLE};
    private UserSettings.Smoking smokingArr[] = {UserSettings.Smoking.NEUTRAL, UserSettings.Smoking.NEGATIVE, UserSettings.Smoking.POSITIVE};
    
    BBUserSettings(UserSettings settings) {
        this.settings = settings;
    }
    
    public void setAge(int age) {
        settings.setAge(age);
    }
    
    public void setAlcohol(int alcohol) {
        settings.setAlcohol(alcoholArr[alcohol]);
    }
    
    public void setBirthday(String bday) {
        settings.setBirthday(bday);
    }
    
    public void setEmail(String email) {
        settings.setEmail(email);
    }
    
    public void setGender(int gender) {
        settings.setGender(genderArr[gender]);
    }
    
    public void setInterests(String interests) {
        settings.setInterests(interests);
    }
    
    public void setOccupation(int occupation) {
        settings.setOccupation(occupationArr[occupation]);
    }
    
    public void setRelation(int relation) {
        settings.setRelation(relationArr[relation]);
    }
    
    public void setSmoking(int smoking) {
        settings.setSmoking(smokingArr[smoking]);
    }
    
    public void setUserId(String userId) {
        settings.setUserId(userId);
    }
}
