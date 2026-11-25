Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795625245;
	b=FVjeDlTjNMPgrq6+gu+upO4glR9UpRfCNdgWVI5cm7tu70uiZkKvCkxZOarp4pDtaiUe
	 7wWL9w7wWxt1sUIHd0LwEPltuupUyR3B0qSs19vhPMtp7acTUesYG4VKT3FyM3HKTF1Xg
	 rTlc5jxcxBppZB8zUKO5kRFsm7c5a1qx/mTxsnufxVCYfMsspLI2HYIsmbzhAjj8UUTFe
	 NZgjPG5I46eeu8PGY6DuL7DuGEfOM/4PtiQeuNflcP+jAGXL+RaMZi2xq7CF4v7Mx0SOY
	 i0xqHGu/3xV/5lBC9q80QUGVpyKUCU9JbSHjVIoH3AFqs9/u/QF47vLYvOiqeNVUx9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795625245;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=qenWKunPLMZk3LsufaF7OAqEkY7sY2jqJw0UtvtJ83U=;
	b=ovVRhoBFLfJtUzRp8QMBOEprdI5pJq1NaA6tT6ygN6u+OIQ1zcLBBoUqtfZxeK2L/vhq
	 B5/hJ89Yqq08AhRbG+At78LriK9v8H0ztWKkzbf/N3xLLGW6RNjQYRKrHKYrgwSJjuuv8
	 jjmHOhln/OGLN4As6dMhzeLf9ye8p6quEFKB6W9/E2vmPt1K3lfcrkoUc/OvA6TN8tlQs
	 QJ6wj4DdbGXUq3lYmy162AJsRPxRAOBEByEu3QLpIVKjR+ATGBOHuIqFNNRXLTy3RXtOd
	 RuYnwe5oq6VGRv26zdezII6zm5qtMXplIYmACGWUpLKEEmj8oxjKXxSTYLTncWexjdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=networkplumber.org;
	spf=pass smtp.mailfrom=networkplumber.org;
	dkim=pass header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=PO8WFMPF;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D57606A31E
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 16:47:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67D57606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=PO8WFMPF
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2f04e3bf46dso44003555ad.2
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 08:47:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20260707.gappssmtp.com; s=20260707; t=1795625244; x=1796230044; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qenWKunPLMZk3LsufaF7OAqEkY7sY2jqJw0UtvtJ83U=;
        b=PO8WFMPF0nJHKAaYJscQsQKiggVJ7DzkD0+niuq0Ez1kdTRs+jHdgmJxITYA3UVfKp
         Mvr9giGC4fekuJdK4Qc+8AlxMtXLiEVA587k7RXm2aiQ1myqR42/DFMfa1d2/R/BQObP
         5HILWPyjPJuYjGy//HTwZ2oK9Ff+DNwoosZnkgDU3UszxuY07qvH5vaiQy80GPCOwB+4
         xESJQwFQqkcUT1tLbyd6MjLpLFdsTFoPXe99sp7dqkiHSpYW7LGCc43aSZyw5VVW3C7X
         h4mDv9yOw779azUCWB2eiHI61CyIaLuGoyRP0/YDP3nPBa1ieUvxW050RU1FDoa9yfbM
         SheA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795625244; x=1796230044;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qenWKunPLMZk3LsufaF7OAqEkY7sY2jqJw0UtvtJ83U=;
        b=gzVhivJIMVjCZNBQKkRQTxwdcjJ6pxyMpo9KOCEsge/SytGP3nFfKPio0uDUuRBRIb
         S1XxPg/b1D17aXAXNvRov4aW8loJ5jP5UOX8a8lerBZKm1taWPTr+8LaQ/MibWA9lD2R
         dd+pDsWZt0g95EnMng/0jHgh/yU9Y6w9A08yHIQpv7ugIbcreUzc3dEg2aC/wsqHr5wy
         nJe3DAMLS2dHBnhlcEr70R7S3ld0AWmPw9aJBvwbn0SYAq9io4KWb965N8ZHfkujESoZ
         kD4lZDBVkqjL9o9Tet1sJZlILXYlMuzqo1p6FqsG92rb7i5ULj3ShMat/nOH8zhdtgMW
         m8yg==
X-Gm-Message-State: APuU4Z+Eb+5kgMcemTyl5Gnd0+8gtUeMCecM3S3vKylrRrWGFZ64KGpa
	MgLvQZhutYE4hZPgDplJWgWvlgpfqGyI3lyHONMidkK2APVx+gNbexBmw3MwnZRv/onw8HRFeNn
	BSzdvv4U=
X-Gm-Gg: AZFdTZeFO3ENiaeZs48zo+d3rxR0MyXyt38aBfcVs5H7zd9vxNG/wJPrfiRu46qXGOq
	IYDn5OHAhTm2ZH6xuybw3Pb4E6659jOXC/RN4ZXp9AJn/8kyOJaJ5hqIx8Tp+779eO5IyQDKLK+
	Ne78dzKqgCEFfOBW+FBlH6k43yNBfs+wlVvrsv6Eo5lXmqjVjTCGiORx89Slmhog8vi/9iTZ9TH
	R00tCg+hTgqXCmoEaGN9EYES6maAeF0OYswMXJwIdvO6T5BGBKJaToGtfr6baoio5r0M1+vZF84
	unCvf5WQLNqO1atJjUzxClmpg0FmbcmnMhbYMD1OEMh58VLcrSbOko2yGN+BsHa4LKQOmABC8/J
	5rqvCUjPb+3Fx6z1xrsgaafOLFEiCqyYCZ2jcUZFSw10o8cxvdvDGik1eaRBh+p7jqir2cMADs6
	Wyk8DCUcJZrRiWmYOOxc72OSdEkAy2t4rWxDd12i3gAeEqINFzaRVHBbFiRcbxlTnWQNQHp/IVn
	E/1Rei9DHuPsbkedFS5G8UecsSKHkqSwE/lb8vC5qQ/ujp4vQeCe9a2kyiBEYTo8vZ+6GCGvzPa
	OpjhigCRu6AeQNJXGbpPDsJtElmsV+5sdEH849d0WAeWC18IqoY7z1Zi2MIpVDtoz0Og
X-Received: by 2002:a17:902:f652:b0:2e2:d77b:e587 with SMTP id d9443c01a7336-2f03f1cee76mr196524735ad.18.1795625243510;
        Wed, 25 Nov 2026 08:47:23 -0800 (PST)
Received: from phoenix.lan (204-195-112-43.wavecable.com. [204.195.112.43])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee844acsm92135315ad.2.2026.11.25.08.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 08:47:23 -0800 (PST)
From: Stephen Hemminger <stephen@networkplumber.org>
To: netdev@vger.kernel.org
Cc: dsahern@kernel.org,
	Stephen Hemminger <stephen@networkplumber.org>
Subject: [PATCH iproute2] names: terminate the name returned by id_to_name()
Date: Wed, 25 Nov 2026 08:47:21 -0800
Message-ID: <20261125164721.1942828-1-stephen@networkplumber.org>
X-Mailer: git-send-email 2.53.0
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

strncpy() does not terminate when the source is as long as the limit,
and the tc class name from tc_cls may be up to NAME_MAX_LEN while the
caller's buffer is IDNAME_MAX. A name of 256 characters or more filled
the buffer with no room for the NUL, so the snprintf() that formats it
read past the end.

Use strlcpy(), which always terminates.

Signed-off-by: Stephen Hemminger <stephen@networkplumber.org>
---
 lib/names.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/names.c b/lib/names.c
index 4ecae92b..697942d2 100644
--- a/lib/names.c
+++ b/lib/names.c
@@ -142,7 +142,7 @@ char *id_to_name(struct db_names *db, int id, char *name)
 		entry = entry->next;
 
 	if (entry) {
-		strncpy(name, entry->name, IDNAME_MAX);
+		strlcpy(name, entry->name, IDNAME_MAX);
 		return name;
 	}
 
-- 
2.53.0

