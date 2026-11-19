Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795066484;
	b=jideUXC/DKelv0uYuXIzWgAQrnYR9r42AQU3spljyUHCmewuc6IU+8f5BwZj/OcWMDdv
	 yZngcs+px+YLR4FWtJUuFDxMBFm/QAyLgiXhv5AyxZrnHVFCfIqPAcBDUQ0i/qJEj6TxY
	 aaTtXbEmxkesa2Nis/UMhI94nwxG1jkImjyNVwpRLWXkfwY/W0Pki1PJS8abLErdYe6N6
	 WT6ByA92bWrDJWonCEmmw9AhcLH4UyzXHpS2SsJR6KJx6VTtlHEl1IhLz4tsP/OZHaW05
	 zxBTHQQuCpii258J2WMI2oI7W1zN19iFu86r6VOXuBOVdpDAKAFF6HE4H1op5UwICRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795066484;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=FqNOA/XhMTTZd7OvJELMXZv2ULVvy6ui2nsQvAMkW3Y=;
	b=5avsPZ1HfceuT93mciBaBopnEoGjg+bnAv9qvUmlKOxaObGWZErsi1AQIvh0spNvIXZw
	 2b19P0frLM01GeJVg3IVuiDcHrFSk/tZ5tIVu7yckYmUbYew7s53Y/BxncSBLo1brJhxy
	 wBAkIA/zKmnmrTc3LIq3rPhru8Sik9ZTQkqIogWxMUgnE5MQ3f8AKplrxL1L8ySYZfAFp
	 3gKjEjbX1ttkRRR8JthQfxC9zTlaAg6wKfR65aSkIMYouBjdcYA0atfvriIjpvYTw2orX
	 U1Z6MxdZ6/vUk/yISfO4ttOIgtXTrSZ3cvi+H7UDi4BNTEKna+PTPqUpwZ4i1xvwMSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Idb9rU17;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82080606A325
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 05:34:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82080606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Idb9rU17
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-49a92144733so816525f8f.0
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 21:34:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795066483; x=1795671283; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FqNOA/XhMTTZd7OvJELMXZv2ULVvy6ui2nsQvAMkW3Y=;
        b=Idb9rU17frJ2gEg1N27gOZs8AUcjvXJX/XjIeUn12LCC/ZCyYVNQwOAYQTxDUSIGFk
         GSWOhAavX8/7Z1OKmn1UXKZ5C+O/PSo6tnSGzLHzKZG9rS8H/e+dj1bi2adLfhsgegfn
         o/x9tTjEJk88M8gH8mn5oY1LbhkJ0PB39YRDwdahpJsu2eLknTFXAMCmJ5tvA2qKsP1R
         KpPY+WKFMp/HYoDKSpy5MnrdENmF5kmVY6E8CJPY+YuAuklrqnJAURLST0yCpXcP8chI
         7/Zf6CkPTJhzKZKYaFzRfihGfhz5oD20B4NmO6IgOOBvwg27T/NsS7LTL7SyB29UkWds
         pmgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795066483; x=1795671283;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FqNOA/XhMTTZd7OvJELMXZv2ULVvy6ui2nsQvAMkW3Y=;
        b=GzHbmyAelxvy3higGosS94h6FIChgvZubHb5Hj6JtPCrk3h8lULvkVeR8no0KxXBv5
         qni/ZFfxhNtj/6ZmPskxlTTErsAg5DT6MSxapjz3aWNxe1w0SU0R4ZlGh5Dqypu7jQdv
         pnb04mJACR4BLaxLCHrWz+ZAy4+9g/CH6H5fhJXzcRH12pxlZ+F5IdChC3NYaNbomeOJ
         J+MzAe/0jbCuFCUn1cs8uoeVzBKz4RuZIB6APrEVy0OBvXh7mI09+CTczHMNSfDWZiDI
         7g0HRGk0Efz8NaSfwWKHA11zWDI2UFUTj/EKAtocfprf4Z8hvZxcUA9swhCljLVbTeNH
         PjsA==
X-Gm-Message-State: APuU4Z85Ee7xsTCjOGgXgoBmBXf4bmEXi3zEDguhAQgoKVh6dyoH/2gf
	A4PM3yFfVOgWB2cxvXlfRMqcbirm+Na7WG8F1n9dO9Gyyq6IDUuGE+6/zDJoOTgcD0I=
X-Gm-Gg: AZFdTZdREXaUD4zFMkzjgyG50KimHktVC8uXK4eUZxyy1D3wOBHHYXc11ggMbWaEaB7
	Y7oA+8JNukzhw0arMHHmbKcrX+BgPzDzAuBZCd3B8uzHGEeR3Q2J7Lq0f1Cin+44HwcuKQ91O3P
	PzdUWc5L/sp3fbKeRRC9PwiOpq6h5Dca7dkKRmYVo8b/bYdmF5AhSfOZb3V7vihFfRg5KbJLdp3
	f1Q+BmmJeItG/RpYlUXFmpMhV1+2fFy65xaZmYt43sPPUNruDddOXXKfYPE/0wcVRjFrk2aUTDl
	mZQF1rL5omM+ggOL3gxdWRMidI6EJ6ACj5zI5Cq3wnbh4zkhRsgR/M8S3QzZe16EuPdQt6sLVwi
	W50eiSkxZozJCG0JHuptW6i7GAA6dPdOG3uDBG7V/VPgzdLJEltn34RwUZFoG+yWXDoT0iDDOBp
	HxHAqPjEqwDWyWRF047GjnbQNBPL5vvrtBc04tq/mO4WNTIAvhlm62HfefijnIEKsPVI9hQKZwb
	bweWnmZ7Fu3sDl5C3EvG287t6okKrodUnyJuxqXJ1ffckoXwWo52hLa3az8Kbc/pvT8e4BSYadV
	hX7oye9XYfNrVO+nNmqKGpPXQcDNyMjk2V3XU/PhGg==
X-Received: by 2002:a05:6000:4b1e:b0:48d:f9dd:e3df with SMTP id ffacd0b85a97d-4a638bd6a63mr9511769f8f.18.1795066482521;
        Wed, 18 Nov 2026 21:34:42 -0800 (PST)
Received: from localhost.localdomain ([102.185.156.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65609391bsm8674320f8f.36.2026.11.18.21.34.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 21:34:42 -0800 (PST)
From: Mohamed Dawod <mhm.dawod@gmail.com>
To: netdev@vger.kernel.org
Cc: vinicius.gomes@intel.com,
	jhs@mojatatu.com,
	jiri@resnulli.us,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	ye.zh-yuan@socionext.com,
	linux-kernel@vger.kernel.org,
	Mohamed Dawod <mhm.dawod@gmail.com>
Subject: [PATCH net] net/sched: cbs: fix 32-bit overflow in transmission time estimate
Date: Thu, 19 Nov 2026 07:33:57 +0200
Message-Id: <20261119053357.2033707-1-mhm.dawod@gmail.com>
X-Mailer: git-send-email 2.25.1
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

cbs_dequeue_soft() estimates when the transmission of a packet completes:

	q->last = now + div64_s64(len * NSEC_PER_SEC, port_rate);

len is an int and NSEC_PER_SEC is 1000000000L. On 32-bit architectures
long is 32 bits wide, so the product is computed in 32 bits and wraps
before it is widened for div64_s64(). For a 1242 byte frame the product
is 1242000000000 mod 2^32 = 754451456, which gives a transmission time
of about 60 ns at 100 Mbit/s instead of about 99 us.

As a result q->last stays almost equal to now and the packet sending
time is ignored again, which is the problem 'commit 961d0e5b3294
("net: cbs: Fix software cbs to consider packet sending time")'
set out to fix. The throughput becomes

	idleslope * port_rate / |sendslope|

instead of idleslope.

Measured on a BeagleBone Black (32-bit ARM, CPSW, 100 Mbit/s full
duplex) with software CBS (offload 0), one UDP flow with a 1200 byte
payload (1242 byte frames), sendslope = idleslope - 100000. The rate
was read from the qdisc byte counters:

	idleslope [kbit/s]   before [Mbit/s]   after [Mbit/s]
	10000                11.1              10
	20000                25.0              20
	30000                42.9              30

Cast len to s64 so the multiplication is done in 64 bits on all
architectures.

Fixes: 961d0e5b3294 ("net: cbs: Fix software cbs to consider packet sending time")
Signed-off-by: Mohamed Dawod <mhm.dawod@gmail.com>
---
 net/sched/sch_cbs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/net/sched/sch_cbs.c
+++ b/net/sched/sch_cbs.c
@@ cbs_dequeue_soft()
 	if (unlikely(atomic64_read(&q->port_rate) == 0))
 		q->last = now;
 	else
-		q->last = now + div64_s64(len * NSEC_PER_SEC,
+		q->last = now + div64_s64((s64)len * NSEC_PER_SEC,
 					  atomic64_read(&q->port_rate));
---
 net/sched/sch_cbs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/sched/sch_cbs.c b/net/sched/sch_cbs.c
index 1c93469c56e3..107c2b6e9da3 100644
--- a/net/sched/sch_cbs.c
+++ b/net/sched/sch_cbs.c
@@ -222,7 +222,7 @@ static struct sk_buff *cbs_dequeue_soft(struct Qdisc *sch)
 	if (unlikely(atomic64_read(&q->port_rate) == 0))
 		q->last = now;
 	else
-		q->last = now + div64_s64(len * NSEC_PER_SEC,
+		q->last = now + div64_s64((s64)len * NSEC_PER_SEC,
 					  atomic64_read(&q->port_rate));
 
 	return skb;
-- 
2.25.1

