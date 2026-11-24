Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795525451;
	b=QS7cOWVQI70I1wm7RWUsH/xVSScaY/r1bMUrUtZEvgGPMvRmTPsffQo5+GxDD0nmtN/m
	 Inq6YeCyxF6VTns2mfBZsAqqwU5tbBtazg2fxk0vl0cl3QXD7fMluZuRpSL8MLI/rni0r
	 eEkNzpH6x8Lxkwn7CqZwar2IvM3EY8uExxbcPGm3YttnyX/Wp+zEI+Zd+8d+wUj5kk/6k
	 vPS6rBTWpUIS5wEgwjk5xev7xiXsaaAwvHXO+fMx67wZoRNoUHfpPafhQQOT97LH1NgDP
	 laHB5KI+o6e+m1ro5vXUz2Q9WolKz1V/3XfiKmlJgJHA38/G8Hbrjss1NJUYG1P+CAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795525451;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding;
	bh=O4bBg3eU3rRTqv+pJaj5O4MQi6+ijSTSzFjKAyAoK48=;
	b=MqAYTJgrLSq57R2yDrKc84QYELm9+ojXmwc/Moa8N7UKM2SqQZYDDOY5mtAiFypwcaGD
	 Eo0QW8tFszVH9F1ZCUYyhwq8m9aVhP1q0DFZ4Z7gQA0srLKdfTaxRdCr+Ux58ODihKH0t
	 FAt3JNt+xMrnEN4ATgDxO4d491SQJ5liDdnZ/SKHAYaggCWKykQiC0pqU5+DG/ouC48Jw
	 oSX3iurSoG6zAO0mshZw7XQyHHEhk7uChs8dkXw1WzEIfYDBlm74PKN0p7gHYZ3zRJb0J
	 kTkjp2vkHOT6XEWOUoq1iZvkVZMOwAUPdwGlmG+neas0JjOajSssJwHUwxfYPm45yRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hmN0aDBj;
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1485A606A31E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 13:04:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1485A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hmN0aDBj
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cde4b4e936fso2425320a12.1
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 05:04:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795525450; x=1796130250; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=O4bBg3eU3rRTqv+pJaj5O4MQi6+ijSTSzFjKAyAoK48=;
        b=hmN0aDBjn8nHH+s33uG4ndgXtb73UDVk5D9aZBdgknah6f1/8tRNtJM622LQLyaAKB
         FLxGimquB1TbeA+dBMChB2Un26Hybj+jwiHw+gWJFB5sh0swwBd5hP/XrdjtRjMV20PW
         fcj40DrvVuuHTSfyfL/UKwvkwkvPev0mhTLJculKDMkgz/NKeROn1gbIgL3U2wp2sCLV
         xU7Jq6Y3RRShPbe63X07JuWHSshjux5Nd20J+ow6t+O6IbI8odimUijRp3MmNROYoNCm
         DhBu7KJriHJgt95PDGaUKb76GHKto3owbSdmaRGSn5RWNJRFAHmUrwq8JbIjtz3YcnbM
         b4Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795525450; x=1796130250;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O4bBg3eU3rRTqv+pJaj5O4MQi6+ijSTSzFjKAyAoK48=;
        b=fj6Sf1G5fxi5ri+0zE/oZye0olcvVb7nxOeDK8ZqU37OUia/sbpr0SaceIYikAWj/L
         Pv8PdxTd4fnD6tLniYETQ9h3m6JTCdMKOy6p22fRyenN7aXfsR5JUfw/Vjmhkr+zkNaE
         HwnD3py2qNifkFrv03bCb9scnAgX8dv2ngTP3Cqzxm/8dYbFqWnXF0Szpuuh+PRPjMYC
         86WqM24Dyp9QllCFGLiJyktZTRaFZ7yIrOaLQLRe0+UsMPx2IqunpDyMxmLr6d8PrP+6
         GRX3h2gVyVXmAhGOGsJRU3UHTo64MUqvbQ3m9maa3lhW13c39/fiVToKI3dtVJ35lhPi
         a0ag==
X-Forwarded-Encrypted: i=1; AL+hErGsZuYOCb02lHWxaQRPC8M5VInUKRc+EO9ouX2ScYpb6t9WcgmHUJk5Z1ektlAPZHFNu3Cbssw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8IG0MSUnHBYrKPEHLje3GcqegEuEKJ2xi+zTb2ZRiz4rCEvVbe
	WvkS+3FtQRevrNwd8Vrec5pkHXUKkWZ5kuq4aeaEKd8IrTDE7v4gTcTb
X-Gm-Gg: AZFdTZfmj9sqByOv1sWkROsJH4qOCBMIsqVOJETMuhRK6FlWssvWSFh8do3ABK99qFR
	8wUICmwuWyXUyq5xSUWEQ8cFd0urcbpr+QCMwmuUSUtlLwTIvzJslyk1eDc6EJHTARywEFBo2L6
	bbenWqDFPVLB8YF+gjehdkKTRrXzyb1af5Wb/Y/e2fTfOTOHcUnlzRDJJ2VSVY/G8GH0+A8pHlM
	Oi6NAzdWrRjvEQsRum1bjf3PJd/xNPyP64PcOJoHuPw824rNMwvFEDaIvTAPfWQ59hNyo4mAqHS
	CWV5sF/i0VpEfCXhscRm4FhgYnOSjYxF0mBfWPdDsqtD6VWNrJwuSBidERJoCGFfG4b1U/ZtQA7
	e1gdH9JBo5d8rZX+Vt34R/mp3uvjXQba0GlruPGbyAR/6qygBhZ5WzkdnMZexIL6XlMhb3wqpcp
	oA0zMGYjvHK5/G2A5O1PqzrCqaaRQq1O76SaQ4UjfLdzwg+2Hf8tF+WLk53GbNF1IWS4uOy8HyW
	8CI9SjyJKJIP8EauZTrU0fB2LWaNAUpBwFoMScUCBhvFTshq7m5jh3skyNs6KUdvMH95Hxc3p12
	UI1u/lCCjBiq/SdXGk6t4MgIcO4X5jmofo2gkYiatJK6YI4WugmMSsGaKsheXi6ced8=
X-Received: by 2002:a17:90b:2cce:b0:3ac:928a:68ce with SMTP id 98e67ed59e1d1-3b41c95e0ecmr9391109a91.33.1795525450258;
        Tue, 24 Nov 2026 05:04:10 -0800 (PST)
Received: from d20be28ee783.tail196be.ts.net (vldb.skku.ac.kr. [115.145.173.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41adcfe23sm22832150a91.15.2026.11.24.05.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 05:04:09 -0800 (PST)
From: Kyuwon Cho <kyuwoncho18@gmail.com>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Stanislav Fomichev <sdf@fomichev.me>,
	Willem de Bruijn <willemb@google.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org
Subject: [PATCH net] vlan: drop the promisc/allmulti references on the real device on delete
Date: Tue, 24 Nov 2026 22:04:06 +0900
Message-ID: <179552079831.1290967.13072162433438626338@gmail.com>
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

Since commit 27b918007d96 ("net: vlan: don't propagate flags on open"),
vlan_dev_change_rx_flags() passes IFF_PROMISC and IFF_ALLMULTI changes
on to the real device whether or not the VLAN device is up, and
vlan_dev_open()/vlan_dev_stop() no longer take or drop those references.
Nothing drops them when the VLAN device is deleted, so the real device
stays promiscuous or allmulti for good:

  ip link add link veth0 name vlan10 type vlan id 10
  ip link set vlan10 promisc on
  ip link del vlan10
  ip -d link show veth0    # promiscuity 1

Drop them in vlan_dev_uninit(). The device flags are still set there,
and no instance lock is held, so this does not bring back the recursive
locking that the commit above removed.

Fixes: 27b918007d96 ("net: vlan: don't propagate flags on open")
Signed-off-by: Kyuwon Cho <kyuwoncho18@gmail.com>
---
The issue was found by an LLM-guided test generator that we are
developing as a research prototype. The commands above reproduce it as
any user under "unshare -Urn", after
"ip link add veth0 type veth peer name veth1". Our test also covers
allmulti and a VLAN that is up when the flag is set or the device is
deleted.

The patch was written with LLM assistance; we reviewed and tested it.
With it, both counts return to 0 in every case, with lockdep enabled
and quiet.

 net/8021q/vlan_dev.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/net/8021q/vlan_dev.c b/net/8021q/vlan_dev.c
index bca0a3693636..5286c7918871 100644
--- a/net/8021q/vlan_dev.c
+++ b/net/8021q/vlan_dev.c
@@ -647,6 +647,13 @@ void vlan_dev_free_egress_priority(const struct net_device *dev)
 
 static void vlan_dev_uninit(struct net_device *dev)
 {
+	struct net_device *real_dev = vlan_dev_priv(dev)->real_dev;
+
+	if (dev->flags & IFF_ALLMULTI)
+		dev_set_allmulti(real_dev, -1);
+	if (dev->flags & IFF_PROMISC)
+		dev_set_promiscuity(real_dev, -1);
+
 	vlan_dev_free_egress_priority(dev);
 }
 
-- 
2.43.0

