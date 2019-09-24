package com.fh.shop.admin.util;

import org.apache.commons.lang3.StringUtils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {

    public static final String Y_M_D = "yyyy-MM-dd";
    public static final String FULL_YEAR = "yyyy-MM-dd HH:mm:ss";

    public static String date2str(Date date, String pattern) {
        if (date == null) {
            return "";
        }
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
        String result = simpleDateFormat.format(date);
        return result;
    }

    public static Date str2date(String date, String pattern) {
        if (StringUtils.isEmpty(date)) {
            return null;
        }
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
        Date currDate = null;
        try {
            currDate = simpleDateFormat.parse(date);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return currDate;
    }
}
