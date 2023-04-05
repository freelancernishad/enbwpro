import Token from './Token'
import AppStorage from './AppStorage'
class User {
    dateformat(date = '') {
        var dates = [];
        if (date == '') {
            var today = new Date();
        } else {
            var today = new Date(date);
        }
        var dd = today.getDate();
        var mm = today.getMonth() + 1;
        var yyyy = today.getFullYear();
        let hrs = today.getHours()
        let hr24 = today.getHours()
        let mins = today.getMinutes()
        let secs = today.getSeconds()
        var ampm = hrs >= 12 ? 'PM' : 'AM';
        if (dd < 10) {
            dd = '0' + dd;
        }
        if (mm < 10) {
            mm = '0' + mm;
        }

        if (hrs <= 9) {
            hrs = '0' + hrs
        }


        hrs = hrs % 12;
        hrs = hrs ? hrs : 12; // the hour '0' should be '12'




        if (mins < 10) {
            mins = '0' + mins
        }
        if (secs < 10) {
            secs = '0' + secs
        }
        today = yyyy + '-' + mm + '-' + dd;
        dates.push(today)
        today = mm + '-' + dd + '-' + yyyy;
        dates.push(today)
        today = mm + '/' + dd + '/' + yyyy;
        dates.push(today)
        today = dd + '-' + mm + '-' + yyyy;
        dates.push(today)
        today = dd + '/' + mm + '/' + yyyy;
        dates.push(today)
        today = yyyy;
        dates.push(today)
        today = yyyy + '-' + mm + '-' + dd + ' ' + hrs + ':' + mins + ' ' + ampm;
        dates.push(today)
        today = yyyy + '-' + mm + '-' + dd + ' ' + hrs + ':' + mins + ':' + secs;
        dates.push(today)
        today =  hrs + ':' + mins + ':' + secs;
        dates.push(today)
        today =  hr24;
        dates.push(today)

        // 10
        today =  yyyy;
        dates.push(today)
        // 11
        today =  mm;
        dates.push(today)
        // 12
        today =  dd;
        dates.push(today)




        return dates;
    }
    responseAfterLogin(res) {
        // console.log(res.data)
        const access_token = res.data.access_token
        const username = res.data.name
        const userid = res.data.user_id
        const role = res.data.role
        if (Token.isValid(access_token)) {
            AppStorage.store(access_token, username, userid, role)
        }
    }
    hasToken() {
        const storeToken = localStorage.getItem('token');
        if (storeToken) {
            return Token.isValid(storeToken) ? true : false
        }
        false
    }
    loggedIn() {
        return this.hasToken()
    }
    loggedOut() {
        return  AppStorage.clear();
    }
    name() {
        if (this.loggedIn()) {
            return localStorage.getItem('user');
        }
    }
    id() {
        if (this.loggedIn()) {
            const payload = Token.payload(localStorage.getItem('token'));
            return payload.sub
        }
        return false
    }
}
export default User = new User()
