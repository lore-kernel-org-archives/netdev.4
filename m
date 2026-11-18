Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794991251;
	b=GDo/FlV25Cp1naBqGoh/yw3YfwCI/XxGEFhFZAGKB+unThLv3Gn5mkbyB8jf2d5LEYdv
	 BNif5+tBYnTML5MgDPknU0csx1KVfCXyWqwW9RKw5Rndf2NMLd9YDCqalHFT6+z38OKug
	 B0z+tDx2FVYkVml7Gx+XinY9HBgp2bfvh3SqBHOhE+mFvC7B8ZSDSb/bmrVds8isBg53B
	 3J/WXwfhON1EUaAZauPqp7fxKketzLYjNqSU4tx4zExwH4ylzgfDa+U5BkIksd3eQA93d
	 vj3C11y95yVGDZeHU6LDWSQl8Q3LVBgOVfdEGHoviM8u/gHgoJa4I8cQ6Qzby7EY/7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794991251;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tijoJhJqHiLzmfJFX+bvaWaW5flN5ch0p4c9n0FIh3w=;
	b=PYOJapzqXqwWPNGQSSej90GrSZP2kjBC+NIxtLpzPMDp+w98KTPoTJBkoq5kiqRwee9V
	 L2y73Ljv99u/qoAhYARd8yhzSk7tJSX7y6eSw6ubkNvJj6yUnoGntCNJ61yxoA0ChllO5
	 URtftnGhOsYeT3xGTEBC2hb0RGEIFAnhUZvYqLd1Kldf3AKKBMQHZ2mns95nWCVyLfot0
	 aq26FHMpONdmIYvp0eAGH1lJ9sX2Q2IH+SyQV3S9Q96LFh4e93esoY0c6+nPqRHokkRUj
	 w/l4FvbjK5RP8t4on4U/zikxnXhGV7ISmE8VaK75JxNBGExd3hH2vXF7o18UfqPwOLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ng+LnpIS;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0913D606A33F
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 08:40:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0913D606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ng+LnpIS
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-36f8cdd30beso8051eec.1
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 00:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794991249; x=1795596049; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tijoJhJqHiLzmfJFX+bvaWaW5flN5ch0p4c9n0FIh3w=;
        b=Ng+LnpISPzX+CTmD92puWUFI5csL2ej5pesWPAA0ge+nejhAOJK76/uCfJcESkcR7h
         OUxiM+VgEZ08G8M5owwRQ/88BcbxvktY7aEeEhbzB7N0aCVp2uyDleLX+93NP/Z4fW68
         lmCCwhXLerij2Mg3zaFHAM3+fCJ53sj8b+xqsEpYXpNpKSZJFPaQvI6GDDnykkfUawQm
         iBZu+pLuQhUozDMq1WQ/x2eBzySX5VPx2bZ3snsb9pStn3CsGE/WmsLOH4vNffm6aXvo
         1tTWM6b9xw08Mya23hRuc5RJTp4Ue5fDZ4O1ltpLsCCX+daJT1bO8GEp1i9HfG1SDRIO
         mPRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794991249; x=1795596049;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tijoJhJqHiLzmfJFX+bvaWaW5flN5ch0p4c9n0FIh3w=;
        b=qoSyOVRaSfBWx/kad40hz59UsZxahK5PLQUPB6ic8E/Arxob3tZvsCkZcLfuaCPmo4
         7nQb4Eu9U4mBQ6zNZWDfobGc3oywxRU4GTx1ZbMe5zA5m/K1EuR82yheZ69q6EfCqFut
         YsCUslnGsXmR4eD97GA8kbEy4YH/SNFq9V+69k3GXH+aO+KW0qTuYAAuRFUMyb2lZZzC
         SPHloQItr1gwZw6h1EvZCS2s5UGxzd8dz2mv2rZ3T64kTGCvBVbCUlk7yOdX555MzBDZ
         HJgScDELAyRN+hSMxyozCbegyr42ROzj6n4F1lSp0nP5Pz/oiNdiAxKHKRnjKhM4h6W8
         /O8w==
X-Forwarded-Encrypted: i=1; AL+hErFZsNGr86YRA2oUsDMDfLFqnDPvu7mj9QdFICBN6SJyELyxaNKvQs49QENrObsq5pa9af4EkYo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+baHWRS1t15SPMldkWOtvziuqNb8VgICp8Q5harQ6/jZQEaFF7
	t0GpqhnSwz5Kziknt3j4dzjkw6C+gug3bpy3rlZKFkfK186q4e2difmi
X-Gm-Gg: AZFdTZdcwN+B+NIga8sdXr5VApPpV74h3bbnsF6csvK106SlbqopMlu30lBxhQWnFTW
	+EXNxX4NRZJhvFhzzq4yz/E9p635ejmjVahbE76qk9RFzfevzQ0S72rEfCpA/7RENphoXAkT/sA
	jlvBiwqY3ilubwaYgj9lfj/47NpyPwCp2jnFvdgmqm5BodnHHjXE5NNcRmeLB2Sao91Ai4KRpur
	6A+fDFoJrbXAe8LdecfsxjcK1uBT4NVdaNWN0brdecV5eHf7RsYwYfh6fSPMnEW8N7vfGyHJ7UD
	R3FinVWTguqzlTNaFF+wMuDSuBVGkgNsT9njWhci/6g5u8D4hWvWgisnbjbN8tHnFiH/Jz12J5N
	z7ILEAPTuctxFm02M4sVEargmpgHRWAuWZ5G2kGDm+hYGsD58vLArHauj6dhajZUYUJGb180HW9
	3KgmErIxrpD6FSAJO2hPXR87Msd5CRdwQ+qy5JELR2zMVmu+55KrXq4Kbw7tFCP6se6hNMccig1
	fa79d7gpDw4LQ+c7bc+tOiXN1c/eY9DFdvs0h8ZOXqUN+k1JIl1PrgrdLl+k/XgVMaIVC516XHy
	CqE+GAGTSCkzPyrU0SIaVN66tpajdKt3kcfvpUo=
X-Received: by 2002:a05:7300:26a4:b0:382:61d0:f375 with SMTP id 5a478bee46e88-382802697a3mr1982345eec.7.1794991249093;
        Wed, 18 Nov 2026 00:40:49 -0800 (PST)
Received: from kq.cs.ucr.edu (kq.cs.ucr.edu. [169.235.27.223])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a63059e3sm8528784eec.5.2026.11.18.00.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:40:48 -0800 (PST)
From: Zhengchuan Liang <zcliangcn@gmail.com>
To: Aaron Conole <aconole@redhat.com>
Cc: Eelco Chaudron <echaudro@redhat.com>,
	Ilya Maximets <i.maximets@ovn.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Pravin B Shelar <pshelar@nicira.com>,
	Jesse Gross <jesse@nicira.com>,
	netdev@vger.kernel.org,
	dev@openvswitch.org,
	linux-kernel@vger.kernel.org,
	Zhengchuan Liang <zcliangcn@gmail.com>
Subject: [PATCH net-next] net: openvswitch: avoid hashing the network namespace pointer
Date: Wed, 18 Nov 2026 00:37:28 -0800
Message-Id: <4e124b37fc972925a825881c50f95eb6b3c2e231.1794989369.git.zcliangcn@gmail.com>
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

The Open vSwitch vport name table uses the network namespace pointer as
the Jenkins hash seed. When an Open vSwitch vport already exists in the
attacker's network namespace, unprivileged OVS_VPORT_CMD_GET requests can
look up attacker-chosen missing names and time whether those lookups
traverse an occupied bucket. Ranking the resulting collision pattern
across possible KASLR slides recovers the init_net pointer and thus the
kernel text base.

Use the namespace cookie instead. It is a stable, unique, non-address
identifier that is deliberately exposed to userspace. setup_net() assigns
it before per-net initializers run, and it remains unchanged for the
namespace lifetime. Fold both halves into the seed so vports in different
namespaces retain namespace-dependent bucket placement.

Found by AI-assisted code review and reproduced on an unmodified kernel
without fault injection. After privileged setup created the resident
vport, the timing measurements ran as an unprivileged user with no
effective capabilities. With this change, the pointer-derived prediction
fails. Existing and missing vport lookups behave as expected. Identically
named vports in separate network namespaces remain independent.

Fixes: 46df7b814548 ("openvswitch: Add support for network namespaces.")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Zhengchuan Liang <zcliangcn@gmail.com>
---
 net/openvswitch/vport.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/net/openvswitch/vport.c b/net/openvswitch/vport.c
index 083f7a8d9d4e..6689c8370ec1 100644
--- a/net/openvswitch/vport.c
+++ b/net/openvswitch/vport.c
@@ -53,7 +53,10 @@ void ovs_vport_exit(void)
 
 static struct hlist_head *hash_bucket(const struct net *net, const char *name)
 {
-	unsigned int hash = jhash(name, strlen(name), (unsigned long) net);
+	u32 seed = jhash_2words(lower_32_bits(net->net_cookie),
+				upper_32_bits(net->net_cookie), 0);
+	unsigned int hash = jhash(name, strlen(name), seed);
+
 	return &dev_table[hash & (VPORT_HASH_BUCKETS - 1)];
 }
 
-- 
2.34.1

