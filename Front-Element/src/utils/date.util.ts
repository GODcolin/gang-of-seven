class DateUtil {
    UTCToLocal(utcDate: Date): Date {
        return new Date(utcDate.getTime() - utcDate.getTimezoneOffset() * 60000);
    }

    LocalToUTC(localDate: Date): Date {
        return new Date(localDate.getTime() + localDate.getTimezoneOffset() * 60000);
    }

    toChineseString(date: Date): string {
        return date.toLocaleString('zh-CN', {
            timeZone: 'Asia/Shanghai'
        });
    }
}

export default new DateUtil();
