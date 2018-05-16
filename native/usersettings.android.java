import com.appodeal.ads.UserSettings;

class BBUserSettings {
    
    private UserSettings settings;
    private UserSettings.Gender genderArr[] = {UserSettings.Gender.FEMALE, UserSettings.Gender.MALE, UserSettings.Gender.OTHER};
    
    BBUserSettings(UserSettings settings) {
        this.settings = settings;
    }
    
    public void setAge(int age) {
        settings.setAge(age);
    }
    
    public void setGender(int gender) {
        settings.setGender(genderArr[gender]);
    }
    
    public void setUserId(String userId) {
        settings.setUserId(userId);
    }
}
