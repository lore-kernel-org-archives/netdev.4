Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794863498;
	b=yxfISbIt7bGhmir2xgr4yfHAy7w1ss443EuDEgeAf51tdLf0dZsR49D9tqiUTiG0f5AY
	 8RfNZZ2qa1fnl9Y8/kvlpdBfg39rACafVsP035Zx5P7QjXzj6f2B+J0cU0LC5/CWreOx/
	 YK5kLf0ateQOgOgGrTAhPNZM/sXZNPrxwp1b+PKNygzQryryILEjPO7bY1/J0djvRc8lr
	 XwZdP8B8VEZSYgQGlfpnG4rfteW1OgWHV48OPuIDurveqB6Iiacb5j2H5208Qc1YWrMJR
	 d/kfDOo7Wcj9+Pr85rBvNoEThU4/UnB4rGjq6IfCad4lXJtVCuT8b6Fv3TUKLOkBepw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794863498;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=ILoO4goQSOoAFXrp9tlM49AIZVlr2sW5ElqOP880MOw=;
	b=bNxgd8GKJlzeNbMdBErekR6K8tfOKw8dWDp8xWD4G7cAGfTUSB0rBGOKHQ0k5d2+lBPy
	 D2cKEWSOQ4x/5RNuzBPEXusTKqLuqTpEsALOqO7BE3RaWnFsPgVk4rHfbTnopmraGWJRq
	 OlD0E0GiPrRKsy/UE739arPPC+PlC+CGegGQhc03/NswqCnFP17NakFG/XvtrFHk6yOlf
	 eweKvMQMEM6VZf+dS/d9LreHhaUFaymsyBV2pLRNWOaTP2pFnQCdJV1wdmmBiaFvaLRx2
	 EWsAyf9Co1Ov1knX5xWpzpwz3mMxtPsKkKHAaygBu3AUEDUsoAAD6N2ne9Es/s+sa9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z1LOCLVb;
	arc=none smtp.remote-ip=74.125.224.42
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32856606A8AC
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 21:11:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32856606A8AC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z1LOCLVb
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-67db1f6f50eso1902387d50.0
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 13:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794863492; x=1795468292; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ILoO4goQSOoAFXrp9tlM49AIZVlr2sW5ElqOP880MOw=;
        b=Z1LOCLVbqg3v2F2CfBLW30hHZGcUBUbf5PwM9IOmOKHSWFMqNO/IVH5dTHhY8OBBHb
         b8LmnoKVgF0wAbyinTuMmNNSpPniKQ5eiWzPfzDnhJtBLCTuS/cWH0/6K3616b40al6n
         uxGMSiw2aHfQVOSeV8PrN2Eju1fM45uzJpN1k437ZYsXMXgNlsRvHBtOQ9byhmHmb0VI
         9uMS8b+uRq8crE+tWrYBT/RA0pUBk24JGppTS5ULSRxJNjCAasdTFlqpu8PY+xrt1MrB
         08y+5BL8m3gi4K4EvV0dpKAJ2rEwcv8KJAmTRKtaa3rgoVyIyDC9WkaDFcecmecEnJB0
         xFJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794863492; x=1795468292;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ILoO4goQSOoAFXrp9tlM49AIZVlr2sW5ElqOP880MOw=;
        b=J12B6BaqVuMEmNKC33Uc091Cu8EteyzJETh2QnaHiyGsD3MT8P73ZYzz1iTJhKqOnF
         lhs3fXfSx85T1djhIaMoKHbRPonzuo7nL/FNF6/6GTphHdZoQSsJZmHQe5F93UYMaJO/
         YcD7QfWrCyWbAWPbFIq6SQCgQFW/RJp5bRm6kHje6snT4ico610LLlqQVF6DBKRYcazh
         8ue6MiPAO8pOShZ5YpFZbzEtMU00JRVGvBe1JRlNK4qBEOpvH3nqtlLGUQ3bgXFo4Vnd
         4EOyqz1MtXlSJipDEfGwQhhMAi7LUlIFgKbJzPbhURMW1cxa8F//kqHgtuZOpHbv+jKa
         Ikcg==
X-Forwarded-Encrypted: i=1; AL+hErF6MsPBZ3xqwjary7OL4VUNRcN2rcsVAGCgPi2QdbCVLb8nPQuKqasfAEH5VGhtxdeExcQHAJ8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8bIyeQmxZolJYVTva15tOaU6DssQbp7ELx1NFSFRD54gVsj2/O
	/T7iOh4yn5aaTolj0hywAC2ukpJKwWgO3T/4hDZpFBl5HUFwAOer/3tV
X-Gm-Gg: AZFdTZc0IYAcyj6D3T+yub+tjr8+RtwqPrOj617C4XEgd8wsaDu/QCg5AUKo0BBXuUW
	5E0PsGGNion5AIj+8qH9EnFu85pBFq8TNuzbAZutuR4UoQB62yFoQbpaaj9QUXsP7wYIwNe07+a
	6EU+YJnCPNjryxj+u2cAkMcZiSmDcLREvdnyWEfz+JwgtpqybBDmxeNlto1Wb6N+jGjg5p/odU3
	1M1IVmItAfY4XNVBObhBpnibbX0U7FkYxrVq35CCpJki1o0Gd8VFo2pL+slDEkQETQeuHM0GcO8
	AoWBpJviuMUxl1+qe+YPhoaJRy1GYPe4YviOWAqpGu7030OeN7CjzFpUNiPYc2fxr+A8Rai3O6Q
	mFbNOlfI8jpEbMboAP+rCk1gIEsJ7/Z+5JMScNkSV2/1d/Xtd4t1JDa97th2J022mks/fjsWF1G
	icP+iUF8ip2VCWTamMA6FN2XN08/vldY6y1+0JcpD/w6f73ETeXFx0IkbpmCzjDfbsxcmId4eJM
	ACLdT6O+DdXyW7izdGPh9GfGdK6hidKGOxvYj24//h+MnA1cPQulnzGR5R4soT/qzKbVKkoaKNw
	1fMwEf3ZzUGYR/WS0iyIfeb/RxA=
X-Received: by 2002:a53:a3cf:0:b0:679:93e2:2002 with SMTP id 956f58d0204a3-67d897c7c92mr5263413d50.80.1794863492199;
        Mon, 16 Nov 2026 13:11:32 -0800 (PST)
Received: from localhost ([2a03:2880:30ff:44::])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67d8a59e70asm10952941d50.10.2026.11.16.13.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:11:31 -0800 (PST)
From: Daniel Zahka <daniel.zahka@gmail.com>
Date: Mon, 16 Nov 2026 13:11:22 -0800
Subject: [PATCH net-next 4/4] eth: mpnic: support changing the MAC address
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-mpnic-l2-oot-v1-4-8dc6eb3582b0@gmail.com>
References: <20261116-mpnic-l2-oot-v1-0-8dc6eb3582b0@gmail.com>
In-Reply-To: <20261116-mpnic-l2-oot-v1-0-8dc6eb3582b0@gmail.com>
To: Alexander Duyck <alexanderduyck@fb.com>, 
 Jakub Kicinski <kuba@kernel.org>, kernel-team@meta.com, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>, 
 Mohsin Bashir <mohsin.bashr@gmail.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 Daniel Zahka <daniel.zahka@gmail.com>
X-Mailer: b4 0.13.0

Let the user change the primary dev_addr used by the device. Core
doesn't schedule an rx mode update for an address change, so the TCAM is
updated inline. The device address entry is rewritten in place, so
frames to the old address stop matching once the new one is written.

Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>
---
 drivers/net/ethernet/meta/mpnic/mpnic_netdev.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/net/ethernet/meta/mpnic/mpnic_netdev.c b/drivers/net/ethernet/meta/mpnic/mpnic_netdev.c
index c01e276c4a74..fff35d150572 100644
--- a/drivers/net/ethernet/meta/mpnic/mpnic_netdev.c
+++ b/drivers/net/ethernet/meta/mpnic/mpnic_netdev.c
@@ -83,6 +83,25 @@ static int mpnic_set_rx_mode(struct net_device *netdev,
 	return 0;
 }
 
+static int mpnic_set_mac(struct net_device *netdev, void *p)
+{
+	struct mpnic_net *mpn = netdev_priv(netdev);
+	struct sockaddr *addr = p;
+
+	if (!is_valid_ether_addr(addr->sa_data))
+		return -EADDRNOTAVAIL;
+
+	eth_hw_addr_set(netdev, addr->sa_data);
+
+	if (netif_running(netdev)) {
+		netif_addr_lock_bh(netdev);
+		__mpnic_set_rx_mode(mpn->mpd, &netdev->uc, &netdev->mc);
+		netif_addr_unlock_bh(netdev);
+	}
+
+	return 0;
+}
+
 static void mpnic_clear_rx_mode(struct mpnic_dev *mpd)
 {
 	struct mpnic_mac_addr *mac_addr = mpd->mac_addr;
@@ -237,6 +256,7 @@ static const struct net_device_ops mpnic_netdev_ops = {
 	.ndo_open		= mpnic_open,
 	.ndo_stop		= mpnic_stop,
 	.ndo_validate_addr	= eth_validate_addr,
+	.ndo_set_mac_address	= mpnic_set_mac,
 	.ndo_start_xmit		= mpnic_xmit_frame,
 	.ndo_features_check	= mpnic_features_check,
 	.ndo_set_rx_mode_async	= mpnic_set_rx_mode,

-- 
2.52.1

