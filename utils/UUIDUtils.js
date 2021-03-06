/**
 * Created by Administrator on 2016/7/31.
 * 用于生成32位随机数作为ID
 */
var config = require('../config.js');
module.exports = {
    generateUUID: function () {
        var len = 32;//32长度
        var radix = 16;//16进制
        var chars = config.BASE_WORD.split('');
        var uuid = [], i;
        radix = radix || chars.length;
        if (len) {
            for (i = 0; i < len; i++){
                uuid[i] = chars[0 | Math.random() * radix];
            }
        } else {
            var r;
            uuid[8] = uuid[13] = uuid[18] = uuid[23] = '-';
            uuid[14] = '4';
            for (i = 0; i < 36; i++) {
                if (!uuid[i]) {
                    r = 0 | Math.random() * 16;
                    uuid[i] = chars[(i == 19) ? (r & 0x3) | 0x8 : r];
                }
            }
        }
        return uuid.join('');
    }
};