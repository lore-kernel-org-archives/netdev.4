Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795848012;
	b=pnwbcyC389zFUMC9c0r/zrabk2KWkm5OKukQJRJw1PQChQooIgwyGg1o6nW0f7lrH4dQ
	 iCkcUc0dk4uUtjy16Z1KRiDbxl9a44fyNWa5XBsZ6tVFs7nOrj7BCvN6BGm+IvOUNBiTH
	 D8fbRw4IWVggVPrBidYH3vg8zjOEtgsU0x883iouCtf2Uohy6a53iavDeHfec7c61yi3y
	 mbGh/Lchq+z09yvstH0nH2e3MeG453kXI6xLB5tmDJ12WTOWaBgCF0Fy/Os4RRNIKANSe
	 uMz3V6Xlb0cnrgHsPinI4QlI0467HidCCxnkLe2iaOwQkkg9btgbBDfi3vofCuGuJIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795848012;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=JtBDqA0h+JfgBDD2KshouDDHBD30oLUFdNdOVDaeMP8=;
	b=iGoiA1eQDEOEPb041WyYmNML7uYOXXCsrxDnyZA+1u/4b2v/5SsqbE8yuKDyvEZLk8gL
	 ajq60GvD9QTlmMUtP1t0387TjfN+znbiogZtGPcumXJL01p+wQK8Vhq+ck5haGj0azEy9
	 utmpYqpk8f7jyhnb5NnXNbCgBDcsRCfjRkyYxibLwQMLe20KTPG8DChu6gihxxRy5zjsj
	 Od4m9/TraObkTDpT2cKLqo3yX0J4by2BRNaPy9/7oZZUmQEuChx8guigjE91b25llVCrD
	 dOwjIxO44waWXCje0WwjWZbu2ULZJIOrek3H8HrJ5L64IGVUChl2TbTxy/C2jdgPutA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ASvCvaKz;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA25606A321
	for <netdev@vger.kernel.org>; Sat, 28 Nov 2026 06:40:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EA25606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ASvCvaKz
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1a2761c69fbso13222802c88.0
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 22:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795848011; x=1796452811; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JtBDqA0h+JfgBDD2KshouDDHBD30oLUFdNdOVDaeMP8=;
        b=ASvCvaKzYfoOVUpOjFe/aLpOaf98GuUWfJy3e6/9PQNQ8pcEu5QkhBp+owrFt4z+2e
         xCOtJkLzPt+ZlR5JycSyzB4HhKJTefN9YG4Plw4+QfrYPaZ8842KZedTaDMrzxLi4EYD
         8MhXNlXVm+R++ewrGggi9dHCDWFpZD/C2HWYmwoHB6wWqUP8ZUWzHwrxZWz2Xr7BUE5p
         X8DY5GL0P22GqN+SPoaaTaSTFTnoyaHtER9jonLF6RO8C+rIrKlJ/BOz+HGw6Zg15g4G
         xCcVwfiGgKMGUFsLGH6AsVHScPfWAjAitarjCO6BVkhwvglOVPimwtfo01RTku1xshGp
         TQ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795848011; x=1796452811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JtBDqA0h+JfgBDD2KshouDDHBD30oLUFdNdOVDaeMP8=;
        b=W4pNqdk9qWlFD/yjAgFDnhKpvt2PNUTLUsPeWad88C0vnL8WNPDaFf89/eKqBB8EE7
         WPexJ8b11DNGyRS0N20SOUjeWctOa+F/SamjcXYl4Of0dgfA81QZtWOF/GdOQZFdDjiw
         554UlGGe5bgKZEFSj+DH+pWnaECmFePwqcTegyyw6A7mt3yo+bpoUM1u0l+x5dKtDka1
         ypH+64GCSVWSIM+HbSrdNHA9wkKdmDOozAFRm6JKJsuy0P8T2iyIT8rIlhgOvO9cL9Tw
         9jNloiCFfA4kbY5qTakhqMwXRlPkUDYNRCyJbbrffd2NHQTARahTFNf0JsquEb3BIQuO
         b07w==
X-Gm-Message-State: APuU4Z88z7nAKzsFuORzTswqn6qjOkH/dT4jJrRu5FPNYBMedAa/IjM5
	v6oPopA1XcMQa4x4G/9eiGnYeBLrHdnoZW8gNvF4Di1eGLDG3PsiosdnVr3OJw==
X-Gm-Gg: AZFdTZdXnsT+VgHcx3vI/kyIbUb6SqX5ppp7EkhtszOfR9FscdiObPeJ2VdUO9ggQzc
	CvynHwqsk5W7iObJ3Kpst7rU7Xf49jE2JhmSxv598B/AwqtJzXIGnLgdCcC1lhCRlKfgFvPeQet
	ACYF3Cem0hsp9sb+XTewXyj04RmKIE3m+UqFIl7E+duEe7gNZ0vTO2ZOgEh1Ny1Rs5pQri5ia41
	ZUuWkY8ja6dTcp6ipnwStuvieUk+gqHYueyxudq0Ifym+a3cbod7Gjh9lGDSkbnKyORV7Yp7Jze
	nN277FnFa2NyN3H4X+BTAJ348gc8WQUtkVugKObBroRW99/z2u047VI4DMM39m6zjQZWUxxj2jw
	X4bsMG966N9FCvRWyGVD3mFuk/Enl1iR6F5AkSohWHTqFQeeUAn0y63+e32v5Y9seHnEVh7JFR3
	z6Fp2lIn6BDI1/NYcFMYTm5nbOfyjt0cg3+Nz2kH/b94LOnUrgGjscUmRqiGHmj/IqKG8suMqPw
	yF+oWsLO7kpfJjh+y2ucrNN3BeghqjhFA9yAhna/8qnXK/iBFDRV2fTYEveZYpoJ7X7XU5KTuqX
	P4PL8mq5h/tzAYPnOZQg1NU19X5bpqiVpqLnJULaX9C8auUVGqcg1wwJZnBng5SL9O5PvfebQk8
	O5JmVDaKENRwa5kTCQTuZja/W/1JwUHM9ECrzTATr4Z4y0w==
X-Received: by 2002:a05:701b:42c6:10b0:1ac:91b6:8dfd with SMTP id a92af1059eb24-1b55690919bmr30042524c88.31.1795848011370;
        Fri, 27 Nov 2026 22:40:11 -0800 (PST)
Received: from l ([2603:8002:ea00:6800:c936:de14:80b6:30c0])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c1142sm60446286c88.2.2026.11.27.22.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 22:40:11 -0800 (PST)
From: Dave Seddon <dave.seddon.ca@gmail.com>
To: netdev@vger.kernel.org
Cc: Dave Seddon <dave.seddon.ca@gmail.com>,
	Stephen Hemminger <stephen@networkplumber.org>,
	David Ahern <dsahern@kernel.org>
Subject: [PATCH iproute2 v2 1/2] ip xfrm: copy only the mark payload in deleteall
Date: Fri, 27 Nov 2026 22:40:07 -0800
Message-ID: <20261128064008.2028008-2-dave.seddon.ca@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261128064008.2028008-1-dave.seddon.ca@gmail.com>
References: <20261128064008.2028008-1-dave.seddon.ca@gmail.com>
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

Pass RTA_PAYLOAD() as the length when deleteall copies XFRMA_MARK. It
passes rta_len, which includes the attribute header, so each delete
request carries four extra bytes.

Fixes: 0c7d651b38d6 ("xfrm_{state, policy}: Allow to deleteall polices/states with marks")
Signed-off-by: Dave Seddon <dave.seddon.ca@gmail.com>
---
 ip/xfrm_policy.c | 2 +-
 ip/xfrm_state.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/ip/xfrm_policy.c b/ip/xfrm_policy.c
index 5261a292..1a41f2a9 100644
--- a/ip/xfrm_policy.c
+++ b/ip/xfrm_policy.c
@@ -783,7 +783,7 @@ static int xfrm_policy_keep(struct nlmsghdr *n, void *arg)
 
 	if (tb[XFRMA_MARK]) {
 		int r = addattr_l(new_n, xb->size, XFRMA_MARK,
-				(void *)RTA_DATA(tb[XFRMA_MARK]), tb[XFRMA_MARK]->rta_len);
+				(void *)RTA_DATA(tb[XFRMA_MARK]), RTA_PAYLOAD(tb[XFRMA_MARK]));
 		if (r < 0) {
 			fprintf(stderr, "%s: XFRMA_MARK failed\n", __func__);
 			exit(1);
diff --git a/ip/xfrm_state.c b/ip/xfrm_state.c
index dcd08d59..7e365b19 100644
--- a/ip/xfrm_state.c
+++ b/ip/xfrm_state.c
@@ -1203,7 +1203,7 @@ static int xfrm_state_keep(struct nlmsghdr *n, void *arg)
 
 	if (tb[XFRMA_MARK]) {
 		int r = addattr_l(new_n, xb->size, XFRMA_MARK,
-				(void *)RTA_DATA(tb[XFRMA_MARK]), tb[XFRMA_MARK]->rta_len);
+				(void *)RTA_DATA(tb[XFRMA_MARK]), RTA_PAYLOAD(tb[XFRMA_MARK]));
 		if (r < 0) {
 			fprintf(stderr, "%s: XFRMA_MARK failed\n", __func__);
 			exit(1);
-- 
2.56.0

