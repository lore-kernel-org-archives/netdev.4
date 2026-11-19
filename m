Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795114997;
	b=nAhVYr/EQKciBESmlIZX9RpFMo6H1N/qGgn1lAG2lobUFwFA5X/i2EOBMMCITlsAJ5qe
	 1qTDYCQ9VWe9eGvOi4kOsywovnR0Hcro8EOdLrCaQ+gqyiM9nlJVtP62EmUNV72ccdn93
	 GqMnXA4HDYkSWeP06JQmk3s7QtR2YVNj3YGzfUwzAS/8WmwitEIz/+41FdDYnKOBZp04X
	 EgHsA8Y8Iq0nFQMjQeoTg6a8XcBKid3DWOlhZFF2wDh+9jVqWOvE0V1Egs9l069giqprp
	 xdKg6zK79SnO4ihqMAmWk53eSix2NMv7csbk/c0GjkTsfDnbcSJhT5fXq/VdFbQdBuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795114997;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+nKVkbXlRsmxQY9EEgmvOLBSQqPef8TLtgQqSAl2rrY=;
	b=PgfFDorDOFheDT8IqlTIs9ODqKaQrkOYHH5rLlnIq7ntyZNz0o7G74gQLFjtjkhlZTbZ
	 BBYdQQToS1lun2TLSDy5w9ZGocMBA/z64qXA8HY0LXIjOpMAN521GLGau37dUFL1Oh3GS
	 lHYrXOen+9+r5kxhiOdSc+wLaLahj+snwPBGX3jfQxZP312XmE8orZecjZwhIiYOwuMkV
	 wku14Bb2Ka42ySmoEjNtbyG6yKJZuyeomzQp/4WhcfWdw19y/bnrcWetkGmiBUBj4j8TK
	 b8rdw9ojF0z+u/pp5SLQe/Q+fX8+70NKslIZlmeS00FQ9BvzQbJ9GHX6RD0O1MBpRug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=networkplumber.org;
	spf=pass smtp.mailfrom=networkplumber.org;
	dkim=pass header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=EUDti8Yj;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B41606A32C
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 19:03:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3B41606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=EUDti8Yj
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2efd659464aso218545ad.3
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 11:03:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20260707.gappssmtp.com; s=20260707; t=1795114996; x=1795719796; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+nKVkbXlRsmxQY9EEgmvOLBSQqPef8TLtgQqSAl2rrY=;
        b=EUDti8YjssxdnHUwJKRzFlLtl6kKRLbfAPB7XmA6Zt9h9BVs4yGKwvMOr4o/Tg8d8N
         jcbYi5gfOCPT9KP0P5LUfeseCXV1f/po7WcxY2Dkt4nqJ1f1dLjlKIZtATpp+4r2CPnb
         u7ZsrfA/Qn/qfG33CYDvdCrMpUgpRqkNMhYvDnOBF48W6gkyLgUkPEsDqqKolQgtowoG
         NPU/zr2SQGbmWWKUykWFaQRqtsfWqBHLK9ciIbg5Ctd2hC02UEm9ncaxPbfwXbDs86dA
         /UURdvaXKd6VOzEwO94uy1cT1NJGERweEFGQ6bdrLMtiHxg8pxJdX/pB/SE89rQf4ofY
         aoUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795114996; x=1795719796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+nKVkbXlRsmxQY9EEgmvOLBSQqPef8TLtgQqSAl2rrY=;
        b=DJgUDKh4+DDBN3xxlnrxxFHLi4wC6JlNjGphv5KZ+BwUPHRoH1+j5w2psiQnFGalAK
         s8pdYhl6vqm85x+M/tePqx6xr/WZQt4XWmnmw39yXVlgmJ2Q+FOeBh00ZQGQMuvTrwmP
         npwRPH23AhNAtGbQFiFrzLEmSASiK/7/IlM1NxRhgrjkbE3eu6oJr1MprEbBqtFi+CS4
         rNpUj+SB2I+v68QUVFKbH3EaEmBp+VbN49wS/EWPPj7rTms0B0gYecDKKKIOEwxrGZA7
         o6R3ndz3TJk1if0xIn6bSijyuzBr5mIaAP0H0Ct/gSGm2CW5ElfwdGg9J7zHWqi8Hqnz
         w+AA==
X-Gm-Message-State: APuU4Z9WasjgzpRyAdXVB1Wt8VMKz3nkojjnPoc8evndKZ7stZyg9ci0
	pONMv26rzeHLir6FqR15t+ADCptv5i0pxZh4E7XP3WrgpfajNFA+BS0Zcvyn7xv82ql/mntduL1
	d9gwMD3g=
X-Gm-Gg: AZFdTZco9T7fQz7++BuhqwtGyerkBtZaXV9heMxrd6xp1vWYz/SQHtG8t8ig1KyiqX9
	4FckTiI3b45lb7ahJnydMSStlDBkOJER7bcbca7RJqsxzZmNgJSXOEbKgNYBBpB/IGYzYL2u8ae
	CSLMY0ngSz+09fPSoET3OIVG0z69oI8FtI2KxSg3x3MztCakFPbWwxmGSoNojJCmoORdIGfbRGK
	YMnEaLwmjGG8xbusq6gfQqFK6XBhz/VVzcrICDOSeJodQBPOFIEmymwbumdK/m2E700IgzMkOvj
	yS0NWIYWVpN8JbPvM5tRsz90b7/no5ddgWVN57iPWzUCJ0rEAmzaaUEWAv/j04JVBPkKidX0C1t
	Q6ykbOii7GP8g8Vi/1FXKy1lkv+/nUUIrbav5xzLzqKxMioE4mmxK0yZeP+hz4agz9PFH1+jKIn
	L2z0/3/iXYmmUqQ+BwQgvpxuZcP4rXT4H6FaHUQW41cT1qXpiSkBpU6LNEWyPESQ1oM6hTyFfzO
	NIHSmUBGn6J4SZ3ph3TBtPvlsQ+NsLvekmfUm0RNP3Hb1mGCBBArEOLheAVzn45bum9Jj35fy8g
	zWTIRYWqpiyD6+LnFExeHldskDSLvNtIWAd8eHhViFsa/KNaqDuUpzhC9z0wWHpUYTWV
X-Received: by 2002:a17:902:d4c7:b0:2f0:22fe:65de with SMTP id d9443c01a7336-2f03f1914d1mr6476745ad.59.1795114995908;
        Thu, 19 Nov 2026 11:03:15 -0800 (PST)
Received: from phoenix.lan (204-195-112-43.wavecable.com. [204.195.112.43])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0de00asm3750225ad.35.2026.11.19.11.03.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 11:03:15 -0800 (PST)
From: Stephen Hemminger <stephen@networkplumber.org>
To: netdev@vger.kernel.org
Cc: dsahern@kernel.org,
	Stephen Hemminger <stephen@networkplumber.org>
Subject: [PATCH iproute2-next v2 1/7] lib/bpf: parse /proc/mounts with getmntent and check fs magic
Date: Thu, 19 Nov 2026 11:02:36 -0800
Message-ID: <20261119190312.578885-2-stephen@networkplumber.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261119190312.578885-1-stephen@networkplumber.org>
References: <20261119190312.578885-1-stephen@networkplumber.org>
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

---
 lib/bpf_legacy.c | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/lib/bpf_legacy.c b/lib/bpf_legacy.c
index 9d5fcf5f..5b8ac47d 100644
--- a/lib/bpf_legacy.c
+++ b/lib/bpf_legacy.c
@@ -32,6 +32,7 @@
 #include <sys/mman.h>
 #include <sys/mount.h>
 #include <sys/resource.h>
+#include <mntent.h>
 
 #include <arpa/inet.h>
 
@@ -543,12 +544,13 @@ static const char *bpf_find_mntpt_single(unsigned long magic, char *mnt,
 	int ret;
 
 	ret = bpf_valid_mntpt(mntpt, magic);
-	if (!ret) {
-		strlcpy(mnt, mntpt, len);
-		return mnt;
-	}
+	if (ret)
+		return NULL;
 
-	return NULL;
+	if (strlcpy(mnt, mntpt, len) >= (size_t)len)
+		return NULL;
+
+	return mnt;
 }
 
 static const char *bpf_find_mntpt(const char *fstype, unsigned long magic,
@@ -556,7 +558,8 @@ static const char *bpf_find_mntpt(const char *fstype, unsigned long magic,
 				  const char * const *known_mnts)
 {
 	const char * const *ptr;
-	char type[100];
+	const char *found = NULL;
+	struct mntent *ent;
 	FILE *fp;
 
 	if (known_mnts) {
@@ -568,24 +571,21 @@ static const char *bpf_find_mntpt(const char *fstype, unsigned long magic,
 		}
 	}
 
-	if (len != PATH_MAX)
-		return NULL;
-
-	fp = fopen("/proc/mounts", "r");
+	fp = setmntent("/proc/mounts", "r");
 	if (fp == NULL)
 		return NULL;
 
-	while (fscanf(fp, "%*s %" textify(PATH_MAX) "s %99s %*s %*d %*d\n",
-		      mnt, type) == 2) {
-		if (strcmp(type, fstype) == 0)
+	while ((ent = getmntent(fp)) != NULL) {
+		if (strcmp(ent->mnt_type, fstype) != 0)
+			continue;
+
+		found = bpf_find_mntpt_single(magic, mnt, len, ent->mnt_dir);
+		if (found)
 			break;
 	}
 
-	fclose(fp);
-	if (strcmp(type, fstype) != 0)
-		return NULL;
-
-	return mnt;
+	endmntent(fp);
+	return found;
 }
 
 int bpf_trace_pipe(void)
-- 
2.53.0

