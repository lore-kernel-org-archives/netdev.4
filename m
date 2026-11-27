Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795807242;
	b=wXOuLZtakwPey/mcr2vUALq/ifLiT8je1AGeq3o8kFCCiHo4WyjmaM1KxIQoJ5WjT7A9
	 /ZfVNODklIMYpzwwwylafr3cHHD9hcax1RLUWT75LFwf1IM9u/68mGn5aT3tRxlPTxI9f
	 iih+3TPsWwWqgfSEZEH3YphqUKbhwxm4/uQ5LXP4S32UomyHAuA3nVZDCcMyfjYlZN636
	 OjPQPaXlMPgBS1co+eXxZ4RtbyDm2WqjG9XANlcRpe2yYWD5W6lA6glth94xGcrQB3pZB
	 M8ioCwMljiHQRz2d4eaoXJlH3R53PmuDR2jMBfk2zwI1izrcsroDa+cSIbvzZR86eEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795807242;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=y9E1uMyey3tvPdEok9EGJaRWOoGtW5vusnEj9z18keo=;
	b=nLw2j6BLmdnM3RlBX3XV194X/hH6kBxsiRaPkMjKEVZQVdWeFz5ezTBLp8kjKJKexSGG
	 n/kWT2mrvbPTPv3HVj+Zm/+hRVHQtzlYXELrlYNzJojT5HwyY12WR5ZcKL7XWwj/I4DLB
	 GD/UKSbGypr4ubQd8P7fFItJNv0uvtBW1SClL8qxyYpHqxIXeurU/BX8LoHS8cwgOCAPS
	 IpULB3AN0YyVAm1QGrgGyOyQ5P5+OMHUqBAX9I1UOsb5jptOVgEwxhS6/QDNn8gpkBRYa
	 cRVnZv2EK5aJzdmQ1DCmZM4psddEZkTBYJOvWmPkkp7FSsptb3jv5llEwZKnMUgZsdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ah9HsDrf;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B188606A326
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 19:20:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B188606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ah9HsDrf
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-385d8a00598so13029965eec.1
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 11:20:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795807241; x=1796412041; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y9E1uMyey3tvPdEok9EGJaRWOoGtW5vusnEj9z18keo=;
        b=Ah9HsDrfhgovvrObhlZKjY0VXdeOXhnxbTrWaLCXTTk7zi3I2SOnNEP7X3cDD3zfoe
         vytPbcptbZw5VxyYDwFoqutq1t9gBb7iZMAdil+mjx6dY5yFPJj1td9Abxyxk66GbmfJ
         oh4KblN25xZ6nUvz0riXqYkAbnJQ27RX+28VY/vmRJvNLiQXTUa6+680fBjACv+GnVud
         lnzNNC9uLQ+vGw2/93QZ3RVulMp4n1QoIXEF9/3j8CFPgi1mXwCt0bORy6HodqsER3T5
         haT1JiYOj+7lC7JkaLmJYt7IoShGFxqAOpWY7ctQ79XFPW1WlRdEz6LmlnIoTyy7rcTR
         HA2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795807241; x=1796412041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=y9E1uMyey3tvPdEok9EGJaRWOoGtW5vusnEj9z18keo=;
        b=YLq7ZlA5xL2O0ZxiaWCihb9E6PNGYZNzVtfeGQOANwYZxFFyyzdg485sb5WOUZkNhy
         AWaGiAzTZciCoIvZT6l+lQndKjbOXNugb4r68PKqxbeG8PLlywrWE0dEjZRaqnpsNFYL
         bOkMxomL2GWvQF+c+RQXWRSwYAPG/s6ntrg6sDOHZoumaksJ+vmHVU1XqxislNIil/Tt
         Y2e6Jr2VGrwR40yFmkH68RBDtfTGSxtIfEvCDEncoK/PwsrW04lNMPt859H3AvAgexf7
         eHqp6B7OzTdxamhOUzmnS61DL+BiW9F1VtknocQXKHdC/qlnoUiAspzW2ccRNhxbJnfE
         LWMQ==
X-Gm-Message-State: APuU4Z9gXwBw4TBQ8TndxdkzdS7cX5BLXfJw7Y0OKWQyVboPfePu0vUZ
	i52LMjCV/IYKhHkv7aM9ZH/T/nGpBt6/6euyiA8geSGTDFnqLV9e7cK2Hj6d7Cp72Z8=
X-Gm-Gg: AZFdTZdBrpkSf2aHGyd8eQzi36CCW2a+VuoQ/9QGfW9J+mhFsVE3r4kgFEJxwbxb+3A
	BWtelvHzwMx5GPzi+0A4b/mWHEqNQtSDayBbvF/DTIgoXguovg4LbKtTzJ6e3TAqLdXW5FQqvQa
	cLgBmqtS6dIpXjNSYz+8RBehca1rDzWYrospc1sTlsNqNFjtsl6xKwe8cSE7eP3CBd97NAOoJnz
	7QPdSPOa2jHFZFmuXPdfRqy/mtAVZSBH3BIB+K38Zfjpb5fMZxRBa7P6AKl2c7933WQ0ZQuC52T
	B29HLoDYwAfJe/eGf0oVl6mcbDBvIAVB9DwzUatxc60/BoIRIh1CvXs2r5lcKIvkGy8mpoix/Wi
	2jrntcj/IQHVl8PQ6NkqQ2wUnIh/T5CkkGwI628Nola/2PEhk2LgAZKSmIGVmhzfk+JEPHsC+3r
	pg74gIge3mu+HkcS2WD6xme/C2vSFULyFUVKV0nerCkokoi3yCjJJpd07tqv31pflrZchaxWey5
	JK8HH3O8CuZB4waZOtlxqBwPDs6sYqaD0lmtoPsjsfS01ePZiToz6tvJT2JMTTx0vyANaneHDN6
	HGpXVZAh8czC+mDk2clgzCVuLtVflcWR4zh0NGL90Hi2O+Dbp7dFt/QOwuCJA2bdpSpvstFy6d4
	4PLtrRtgitkRjg0Uj/NNfQe6HXAojcz8jkiUyrMomhwepbHNjq4WLPbUtv+WzvA==
X-Received: by 2002:a05:7300:c01b:10b0:386:c3c2:a37b with SMTP id 5a478bee46e88-386c3c2a444mr13350612eec.4.1795807240655;
        Fri, 27 Nov 2026 11:20:40 -0800 (PST)
Received: from Mac.net (198-27-228-154.fiber.dynamic.sonic.net. [198.27.228.154])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c371esm74438668eec.23.2026.11.27.11.20.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 27 Nov 2026 11:20:40 -0800 (PST)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	richardcochran@gmail.com,
	vadim.fedorenko@linux.dev
Subject: [PATCH net v7 1/2] ptp: serialize sysfs enable requests with ioctl paths
Date: Fri, 27 Nov 2026 11:20:36 -0800
Message-ID: <20261127-timecard-core-v7-1-ahmadexp@gmail.com>
In-Reply-To: <20261127-timecard-core-v7-0-ahmadexp@gmail.com>
References: <20261127-timecard-core-v7-0-ahmadexp@gmail.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drivers may call ptp_find_pin() from their enable callback; that helper
requires the caller to hold pincfg_mux. The ioctl paths hold the lock,
but the EXTTS, PPS and periodic-output sysfs stores do not.

Take pincfg_mux around the three sysfs callbacks. Leave existing
validation, permission checks and callback error handling unchanged.
Return -ERESTARTSYS if lock acquisition is interrupted.

Developed with coding-assistant support during review and validation.

Fixes: 62582a7ee783 ("ptp: Avoid deadlocks in the programmable pin code.")
Link: https://lore.kernel.org/r/179579937722.3135.2568812643544816671@kernel.org
Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>
---
 drivers/ptp/ptp_sysfs.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/ptp/ptp_sysfs.c b/drivers/ptp/ptp_sysfs.c
index 8e0e0aa09981..90fdddc1e6a7 100644
--- a/drivers/ptp/ptp_sysfs.c
+++ b/drivers/ptp/ptp_sysfs.c
@@ -60,7 +60,10 @@ static ssize_t extts_enable_store(struct device *dev,
 	if (req.extts.index >= ops->n_ext_ts)
 		goto out;
 
+	if (mutex_lock_interruptible(&ptp->pincfg_mux))
+		return -ERESTARTSYS;
 	err = ops->enable(ops, &req, enable ? 1 : 0);
+	mutex_unlock(&ptp->pincfg_mux);
 	if (err)
 		goto out;
 
@@ -130,7 +133,10 @@ static ssize_t period_store(struct device *dev,
 		goto out;
 
 	enable = req.perout.period.sec || req.perout.period.nsec;
+	if (mutex_lock_interruptible(&ptp->pincfg_mux))
+		return -ERESTARTSYS;
 	err = ops->enable(ops, &req, enable);
+	mutex_unlock(&ptp->pincfg_mux);
 	if (err)
 		goto out;
 
@@ -157,7 +163,10 @@ static ssize_t pps_enable_store(struct device *dev,
 	if (cnt != 1)
 		goto out;
 
+	if (mutex_lock_interruptible(&ptp->pincfg_mux))
+		return -ERESTARTSYS;
 	err = ops->enable(ops, &req, enable ? 1 : 0);
+	mutex_unlock(&ptp->pincfg_mux);
 	if (err)
 		goto out;
 

base-commit: 4392bb809812ac79449cd0cf1f5e00469ee102d1
-- 
2.54.0 (Apple Git-157)

