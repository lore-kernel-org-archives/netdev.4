Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795539959;
	b=sPAhwU5cvhkQJaUEXL3pT/+RU4kB9KfgrudVDU/l+nkaeeDi8crCFrxbN8kbaoPHENoU
	 yaaofQ/jpEKO3trFFw3lP+DQ0Z9UkR8WdHZnlGgPLlsONRqo+w3r52MeJ7dILxZuylHOO
	 JbT19GyDKS7FILGnrf18RuY/Yuaiu0bMt3S1NKA7Cx2Kz/ToSuwvPJBCvdUMBH4yevxZA
	 pzi5YEJ9DC75cKz+gASInFSyzuLPtkdqqYDuc6sebTIAsUSWRl5sGouAB37FmwSm7NPTq
	 dbBWEnG4YSPN4dKgcO9f+l+Ygu50HzKaFwi0G9YdWkR1500I4o2+M0F0HeLH4fxA5Cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795539959;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=KA/R0RVdMLZYrfz6wOwbx9rGyZX4zzVffhO6Mw4P1iU=;
	b=WF/5N17Miygb5G5J5O54IpOQ303gMgmCPzoFoZz4w3Th59WImIYhy5ympjClqLXcYY7v
	 RrOu5dMEAOndLHLFpi7pt24G2UyM52fuvidHVAFfzd7DZKfIIhFeBC2UQNZVGcS4w66/C
	 z5Br5BMfrGQ9xSbT/ZZHgnXUaF3CLHsmuxNkiFZ4sLik51KdU+3L3s0+E4Zu+9hzmZZzv
	 u0OuR1OrO5DVYCc8wC24dT1w0Ngl53Y9cZmPnhrjymXM4lUv6HfSnpAhq8F7UBH9ecGys
	 hH9M1VFMKPha1S7VKcWFxg79bu0Qd67CabruRI1WLoEaCyv83y7zf26ZAz7pI9Wr9Qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NUKNiyUP;
	arc=none smtp.remote-ip=209.85.222.45
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15FCB606A685
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 17:05:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15FCB606A685
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NUKNiyUP
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-990a39ba4fbso1243233241.0
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 09:05:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795539958; x=1796144758; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KA/R0RVdMLZYrfz6wOwbx9rGyZX4zzVffhO6Mw4P1iU=;
        b=NUKNiyUPFpNlaLrCPSO3RrJa9WLgyOCyY1cTTKB3WY/2GQOtLbx0qvzRWETtMFabYi
         wTV80i2FENtfjADN1f2z7OwvWg/amyjtsq38KX+oL50Sz6J0ergjkRCD+N8Da7xOTLyd
         nsPGRi9dN4Z70hoN44NpRjeQ7ZzwMEOwjAWNOwMn2cdyQU6+KLd9cILlkFuNY03o1rQs
         8IrvBCgTATeyIhbFekNQQFlNu1fyYmQuwzmMT5RvkmkY9mKkiivFZKhspQvTPHze+cPr
         UjsPPhP6eDHw5KIbbW0AKA03lGytx0epCDNTYzwPmU7VXNXvOWIvOHr8nJz1jUBJhyPw
         xvHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795539958; x=1796144758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KA/R0RVdMLZYrfz6wOwbx9rGyZX4zzVffhO6Mw4P1iU=;
        b=tyAyZykhCT8tTjt1hfTE9TRetdDwy0CKrZoxzIJ/K1+EXplFeJGM3/f5GU5+mgFd6/
         vWCvApUKV2KOhcz8GWnBZaHIkqO7FBwepJOwkztMexnUIYsBOLZ7Zlrpm0B9hfBGGeJv
         reJLojR0IUw4XXqVxv8euE16TQhJQAqCbQy9Lp2SYnCPKB9iAm2iZ4f4NVrLyJMU1VEW
         X8KnZIYcYgLSL9wI8Z9VSRiDhXzBMgOqFKCHCylTNQ10Ymuc6Pd1zhAdkmVf4FAl2yKW
         TtdZC3a4LFbg1TPgNnnRrWgXMM1j2ml7xCAbPRpOwpb1qLnaxfuzUfHHPHghDeXHs2p7
         oR0g==
X-Gm-Message-State: APuU4Z9Dd6LcHma7f11av6xMl/0VlXlJQKnYZ/SDPfOEXhZQzT3tGe1d
	N42kone9+hoRgXqULlQmLzlRfE46XypKcMpfJpknmicVHMy76GpG8ZV8LvIzEQ==
X-Gm-Gg: AZFdTZc7B6qq4qL66FfqkUkYdiND4XuaZ2w+P61ZyRJgz3S7g6trQ2OkQuZq27SFhG/
	KmKBEZeJwJp1MnNtJYJuG+Gs6R+r0+Pb0I2FI3zhG/oQLwXzjvSisEMI9Jfcd9QI8EN+LoYI1+S
	uc+5ZEMdfYyq7seIl1Wq+3t008AtqJg4Wg67t2T1DYWPoS4P5q4D8XIIaCFtHmo2NfR3KtcX8eO
	iZvNgzK2N6cPB9K0aQTuj1tPIXXL33jeHUxv0vidJQSejZVkk9zx27jw2s7S7VNqdZmjkfaZJF2
	CGn0SSVX9BII+FRQe6Qgs4Ut90WQda6Ir+vm27Nia9T6/HPkAaQAEjerfEDif6Nd3LhcnHdWQ61
	yPQAtfxqG5ywa3EhwYvq9qIJi6SYQmgteu9m2ttumILyvI7BZmwRmkR86yGyQvENH47FW7zpHkt
	udqrRtWnnpox3bYRVDkV6OeT8W0vp19lsZXNisv5pJPyf7Ec2Uy3HVIT0Ioaa/dde2oPHMaX9M7
	lLQHBcabTuVSGyBVFt2J5Zjzf7XfWhS5Ky26OzcaQXUHUHJnpZNZ5zCWKkcJ0RqwkttbBzd5G5W
	a4eTnVw4sJXFNQamL8ptb+ndyDD4WWg+cYX07iOfCiLvkH81hM9jVnlbVCElFJy+d92tvdK6WtN
	mmi9Wkgj93k0VC7iRAB+1cWOAcAo6ad41QdBQtXfxDl1wV0TyyLYUGOSwEFs3w5Xcu2Pc+/Ai9E
	f7Vn5pg4uB6A==
X-Received: by 2002:a05:6102:8097:b0:7d2:da5c:6f7e with SMTP id ada2fe7eead31-7d7395e32acmr6497627137.21.1795539957798;
        Tue, 24 Nov 2026 09:05:57 -0800 (PST)
Received: from willemb.c.googlers.com.com (15.60.86.34.bc.googleusercontent.com. [34.86.60.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349cdfbasm140078216d6.17.2026.11.24.09.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:05:57 -0800 (PST)
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	elder@kernel.org,
	Willem de Bruijn <willemb@google.com>
Subject: [PATCH net-next 2/6] net: remove header_ops->validate and dev_validate_header()
Date: Tue, 24 Nov 2026 12:05:40 -0500
Message-ID: <20261124170551.1874487-3-willemdebruijn.kernel@gmail.com>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
In-Reply-To: <20261124170551.1874487-1-willemdebruijn.kernel@gmail.com>
References: <20261124170551.1874487-1-willemdebruijn.kernel@gmail.com>
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

From: Willem de Bruijn <willemb@google.com>

header_ops->validate was added in commit 2793a23aacbd ("net: validate
variable length ll headers") for AX.25, its only implementation. AX.25
was removed in commit dd8d4bc28ad7 ("net: remove ax25 and amateur radio
(hamradio) subsystem"), and the CAP_SYS_RAWIO bypass in
dev_validate_header() was removed in commit 3b9a324e646d ("net: remove
CAP_SYS_RAWIO zero-padding in dev_validate_header").

With both gone, dev_validate_header() only checks
len >= dev->hard_header_len. Remove header_ops->validate and
dev_validate_header(), and replace the only callers in af_packet with
direct checks against the already snapshotted hard_header_len.

Signed-off-by: Willem de Bruijn <willemb@google.com>
---
 include/linux/netdevice.h | 16 ----------------
 net/packet/af_packet.c    |  7 +++----
 2 files changed, 3 insertions(+), 20 deletions(-)

diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index 694b6d29f680..930899a7a577 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -326,7 +326,6 @@ struct header_ops {
 	void	(*cache_update)(struct hh_cache *hh,
 				const struct net_device *dev,
 				const unsigned char *haddr);
-	bool	(*validate)(const char *ll_header, unsigned int len);
 	__be16	(*parse_protocol)(const struct sk_buff *skb);
 };
 
@@ -3587,21 +3586,6 @@ static inline __be16 dev_parse_header_protocol(const struct sk_buff *skb)
 	return dev->header_ops->parse_protocol(skb);
 }
 
-/* ll_header must have at least hard_header_len allocated */
-static inline bool dev_validate_header(const struct net_device *dev,
-				       char *ll_header, int len)
-{
-	if (likely(len >= dev->hard_header_len))
-		return true;
-	if (len < dev->min_header_len)
-		return false;
-
-	if (dev->header_ops && dev->header_ops->validate)
-		return dev->header_ops->validate(ll_header, len);
-
-	return false;
-}
-
 static inline bool dev_has_header(const struct net_device *dev)
 {
 	return dev->header_ops && dev->header_ops->create;
diff --git a/net/packet/af_packet.c b/net/packet/af_packet.c
index 96c5216a9d6b..230b16742346 100644
--- a/net/packet/af_packet.c
+++ b/net/packet/af_packet.c
@@ -2060,7 +2060,7 @@ static int packet_sendmsg_spkt(struct socket *sock, struct msghdr *msg,
 		goto retry;
 	}
 
-	if (!dev_validate_header(dev, skb->data, len) || !skb->len) {
+	if (len < hard_header_len || !skb->len) {
 		err = -EINVAL;
 		goto out_unlock;
 	}
@@ -2644,7 +2644,7 @@ static int tpacket_fill_skb(struct packet_sock *po, struct sk_buff *skb,
 		err = skb_store_bits(skb, 0, data, hdrlen);
 		if (unlikely(err))
 			return err;
-		if (!dev_validate_header(dev, skb->data, hdrlen))
+		if (hdrlen < hard_header_len)
 			return -EINVAL;
 
 		data += hdrlen;
@@ -3115,8 +3115,7 @@ static int packet_snd(struct socket *sock, struct msghdr *msg, size_t len)
 	if (err)
 		goto out_free;
 
-	if ((sock->type == SOCK_RAW &&
-	     !dev_validate_header(dev, skb->data, len)) || !skb->len) {
+	if ((sock->type == SOCK_RAW && len < hard_header_len) || !skb->len) {
 		err = -EINVAL;
 		goto out_free;
 	}
-- 
2.56.1.839.g22a8290db9-goog

