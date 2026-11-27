Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795798250;
	b=pn/KqrE+NzyX6S1FIYfRE4AZ/tpdfwtd4slS88VwG88oVjO1tCAeeLzo1hW92iOkueQn
	 g6KukSRb1pCVKg21K0gpxq9E7QuecK9p82tMO9WqVeP5QzLrgUMr07CpC6Wc58dffH8/P
	 w6QcMqZoIX11/v/L/Na4CAWU3XHWFO3rOfOo71cKnaQTHQSZ7qldqu4upZmXQnUlTgdIc
	 ABpHfUj4HdUtBc8EzinhHWWZWRbPIGThesEZ9EWJBl/ITjkxGf7tUhS8CEqbrSbjlzNR5
	 oXFRlSzsT7+1UdrJMcHN6vcvF+1Kt3+9o24PnWoM9tNvf9OMOwIHHGwg2i6N1VG2/3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795798250;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=CC9xMLD9bTgnYkNcn5iSuVnlB9AbFq24eDdqRch041s=;
	b=RhCx46mAcBojnYj0Vb7e/DEq7/CjTEeKjVR8hSPZqad6E7vZoqa8pG6YYVDosbfLK3NM
	 J8EyypffK2smW7x5gLytOs1UxBZDpwxCbvxOHrDVlmn7mD7K698TUSTu64QrzXwjijiaa
	 W2u62W0he136V9Rjm8gPtw9xZXYej9sbVjofTEyRuDsdsubyUs+r6IZwNq8hEhwqyfhQp
	 BC4FZawN6OUmnyUkrvOMom/Nk+bwdPTTj2JcZSnbFYTYvDfOnsD7Vx50pE3jxpD8gUXu+
	 zOzgh87ufVIsK+jckNyXfiF2BxGwLHFsLgFQWTyuT03mArKS/nodjFKHzLjng6m9SaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=networkplumber.org;
	spf=pass smtp.mailfrom=networkplumber.org;
	dkim=pass header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="P/SDgzim";
	arc=none smtp.remote-ip=209.85.215.182
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD60606A31E
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 16:50:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BD60606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=P/SDgzim
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cd62c570b5dso5562878a12.2
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 08:50:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20260707.gappssmtp.com; s=20260707; t=1795798249; x=1796403049; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CC9xMLD9bTgnYkNcn5iSuVnlB9AbFq24eDdqRch041s=;
        b=P/SDgzimikDxe/mlpt3fI+NiRDwfjEbxSXHdnnxOFlclySZqITon8HUzQw10HsYck1
         EF0zjzipLDdWyn+1Y148vKqWW6JNMSn4TnUSDR4AAw3Lk4iE3leIGHk6jbIqL5XVeYo6
         OaTyLerMSa7FcFtInHMOQAX2/NtIz6Ua2D1KW5Z4JXBOnfxQ30Sm5Ru42yn3eFezWfoH
         UOKGvic2pSGmRdnW9yL3mRzUk6sooFPGqNoqhXqCWq9a8UOzeGKY4QbgMDkW1HkvR3nz
         Yuon4a/tiaG4NeSo4oLZE20P6gDUS2t3H2i2bxjnnlJ0s0sXnriNRe4xNMManOrGvBCO
         BM0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795798249; x=1796403049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CC9xMLD9bTgnYkNcn5iSuVnlB9AbFq24eDdqRch041s=;
        b=2FeZhv0U4mEbHqsDFqvbE1wbVtmTT6cFq/J/IHfg51eMyTcwLahaNtTbqZmToKCj5a
         3mC9nVLtf/eC7l4Wrj4JoHhOZDG9b/pfFLPcAQQjj7T0hQmLMoJjX1BsoNxFAGpP4A0I
         ZzOIZCVBjycPXOTUc1Q2/XRvSYiUxivUoPMRCYGMDzwZNbUz7Ug4rjuMpvbxx10ONNGV
         HGb5whuhL+/oCRPRTqmS5oCsLdp1AKA0qLnuYd4BrqdSLdP+venJSk6YRtms4YII0o1b
         Ag8ZxcqeeuqqQmYnVzAvDvSm1zTx+cErq1OAQyhUkBlBrp/+u9WrLQWnIK3SiemvmXnh
         vhwQ==
X-Gm-Message-State: APuU4Z+GO0z7ZGXolGYZi7mh5V6Mg+c0Q0p3aRiSRxPvI3l5xb4pjvSl
	IMHFZLMXw68VtQ69OBIfNysVwHHSvBeUGRa6HBE1eTWAAeFEMyLMz7hg3p8qBnQ0oKs+XYitXgU
	ZbeswfuQ=
X-Gm-Gg: AZFdTZe5er8oycQ2RFehALdL2alUmmwAAyErNMRa41GqCkA9JSUG1D/vJk8E1i/ZDPi
	IHIutsv+VI7WVQWE7c7uZNaGj/hJPRJLdkacfs9b5PU16ASe3jxJt5EbUWZb0T8KLwhuONt2ZMZ
	jd7RKRQytwiWySjPk+M1/kIL/BQPXIzNDrIl/rjcMdG5phtqfB58SI2HMb3Ffa0/6hYnfKhcHNw
	XTtXou1msBxejvgwUx8g2pbB4tfYC7acX8+V8L2xAYIFeo3BmZXSzMcOEI9WqEY0NBLtlvzNpsa
	7uCiexQz1CtoIUhifJ1cW6VbsAORri6rnpFLFbe4fahAKXmTrNleLanCzFdzamAdzz54dJjxOMh
	O2dRm0/Ljl7hjMgLtsRNTM0WCMO7/eRYksyR52qcneM10GZwKW/b03I6dTimyVLuVNcs+IGbUll
	uGi8gw/IMxX3Kx0TfMW9wg9IzrO4aAYXktNNH07dSOccTRWMRbWNDwn65AJOgFdiGtcojcMSRXG
	x4Su9mv/L3ENZ4GuzMq9CXnXHTbcVc2QSUn4oCxHOdAi2Pvxc4zSAKHChRWz7zyA9MSCdVD931r
	hMcBoTYHSCrZvTStfEf72peq1uxENGUa9CSXyCVUB5AxdwLOjdPhvA==
X-Received: by 2002:a17:90b:2e49:b0:3b4:625:3d2f with SMTP id 98e67ed59e1d1-3b41cb212bfmr23289223a91.55.1795798249527;
        Fri, 27 Nov 2026 08:50:49 -0800 (PST)
Received: from phoenix.lan (204-195-112-43.wavecable.com. [204.195.112.43])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b4b3c71192sm23148044a91.5.2026.11.27.08.50.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 08:50:49 -0800 (PST)
From: Stephen Hemminger <stephen@networkplumber.org>
To: netdev@vger.kernel.org
Cc: dsahern@kernel.org,
	Stephen Hemminger <stephen@networkplumber.org>
Subject: [PATCH iproute2-next 2/2] lib: use flex array for names
Date: Fri, 27 Nov 2026 08:50:46 -0800
Message-ID: <20261127165046.3656340-2-stephen@networkplumber.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127165046.3656340-1-stephen@networkplumber.org>
References: <20261127165046.3656340-1-stephen@networkplumber.org>
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

Can save an allocation here by using flexible array to store the names.

Signed-off-by: Stephen Hemminger <stephen@networkplumber.org>
---
 include/names.h |  2 +-
 lib/names.c     | 11 +++--------
 2 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/include/names.h b/include/names.h
index 7ea83681..dd491a20 100644
--- a/include/names.h
+++ b/include/names.h
@@ -11,7 +11,7 @@
 struct db_entry {
 	struct db_entry *next;
 	unsigned int id;
-	char *name;
+	char name[];
 };
 
 struct db_names {
diff --git a/lib/names.c b/lib/names.c
index 6295a981..299da9d2 100644
--- a/lib/names.c
+++ b/lib/names.c
@@ -53,17 +53,13 @@ int db_names_load(struct db_names *db, db_id_parser_t parse_id,
 		}
 		ret = -1;
 
-		entry = malloc(sizeof(*entry));
+		entry = malloc(sizeof(*entry) + strlen(namebuf) + 1);
 		if (!entry)
 			goto exit;
 
-		entry->name = strdup(namebuf);
-		if (!entry->name) {
-			free(entry);
-			goto exit;
-		}
-
 		entry->id   = id;
+		strcpy(entry->name, namebuf);
+
 		entry->next = db->hash[id & (db->size - 1)];
 		db->hash[id & (db->size - 1)] = entry;
 	}
@@ -87,7 +83,6 @@ void db_names_free(struct db_names *db)
 		while (entry) {
 			struct db_entry *next = entry->next;
 
-			free(entry->name);
 			free(entry);
 			entry = next;
 		}
-- 
2.53.0

