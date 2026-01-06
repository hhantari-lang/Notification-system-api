%dw 2.0

fun parseMkgCloudNotificationData(payload, typeActe) = do {
	if(payload.count > 0)
		(payload.items filter((val, key) -> val.values.send_push == 'True')) map((v, k) -> {
		    contactId: v.keys.contactid,
		    typeNotification: typeActe,
		    appTitle: v.values.title_mobile,
		    appMsg1: v.values.message1_mobile,
		    appMsg2: v.values.message2_mobile,
		    appMsg3: v.values.message3_mobile,
		    appFormattedMsg: "",
		    appLibelleCTA: v.values.titlecta_mobile,
		    appUrlCTA: v.values.urlcta_mobile,
		    appDateLimite: v.values.limitdate_mobile as LocalDateTime {format:"M/d/yyyy h:mm:ss a"} as LocalDateTime default "",
		    appDatePublicationParcours: v.values.publicationdate_mobile as LocalDateTime {format:"M/d/yyyy h:mm:ss a"} as LocalDateTime default "",
		    publicationdate_mobile: v.values.publicationdate_mobile,
		    webTitle: v.values.title_web,
		    webMsg1: v.values.message1_web,
		    webMsg2: v.values.message2_web,
		    webMsg3: v.values.message3_web,
		    webFormattedMsg: "",
		    webLibelleCTA: v.values.titlecta_web,
		    webUrlCTA: v.values.urlcta_web,
		    webDateLimite: v.values.limitdate_web as LocalDateTime {format:"M/d/yyyy h:mm:ss a"} as LocalDateTime default "",
		    originalDateLimite: v.values.limitdate_web,
		    webDatePublicationParcours: v.values.publicationdate_web as LocalDateTime {format:"M/d/yyyy h:mm:ss a"} as LocalDateTime default "",
		    originalDatePublicationParcours: v.values.publicationdate_web
		})
	else []
}

ns mkgCloudNotifications https://www.hedios.com