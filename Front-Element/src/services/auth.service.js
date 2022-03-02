import axios from "axios";
import jwtDecode from "jwt-decode";

import baseUrl from "../utils/interface";
import {ElMessage} from "element-plus";

const API_URL = `${baseUrl}/api/auth`;

class AuthService {
  login(user, captcha) {
    return axios.post(`${API_URL}/signin`, {
      username: user.username,
      password: user.password,
    }, {
      headers: {
        'X-Captcha-Token': captcha.token,
        'X-Captcha-Code': captcha.code
      }
    }).then(response => {
      if (response.data.token) {
        localStorage.setItem('token', response.data.token);
      }
      return response;
    }).catch(error => {
      let mes = error.response.data.message

      ElMessage({
        message: mes,
        type: 'error'
      })

      return error;
    });
  }

  logout() {
    localStorage.removeItem('token');
  }

  getCurrentUser() {
    const token = localStorage.getItem('token');
    if (!token) {
      return null;
    }
    return jwtDecode(token);
  }
}

export default new AuthService();
